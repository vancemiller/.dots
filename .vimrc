" Colors {{{
set t_Co=256            " 256 colors
color desert
syntax enable			" enable syntax processing
au BufNewFile,BufRead *.cu set filetype=cuda
au BufNewFile,BufRead *.cuh set filetype=cuda
au BufNewFile,BufRead *.hip set filetype=cuda
au BufNewFile,BufRead *.cl set filetype=cpp
" }}}

" Editing {{{
" insert closing braces automatially
inoremap {<CR> {<CR>}<C-o>O
" Remove trailing whitespace
"function! TrimWhiteSpace()
"  %s/\s\+$//e
"endfunction
"autocmd FileWritePre    * :call TrimWhiteSpace()
"autocmd FileAppendPre   * :call TrimWhiteSpace()
"autocmd FilterWritePre  * :call TrimWhiteSpace()
"autocmd BufWritePre     * :call TrimWhiteSpace()
"}}}

" Searching {{{
set hlsearch			" highlight matches
set ignorecase    " search for all cases but see next...
set smartcase     " ignore case if all lowercase search term
" }}}

" UI {{{
set number		    	" show line numbers
set showcmd		    	" show command in bottom bar
set cursorline			" highlight cursor line
set cursorcolumn        " highlight cursor column
set lazyredraw			" make UI faster
set showmatch			" matching parenthesis highlight
set nocompatible        " not vi compatible
set mouse=a             " enable mouse
set colorcolumn=100     " 100 character width
highlight CursorLine   cterm=NONE ctermbg=233 ctermfg=NONE
highlight CursorColumn cterm=NONE ctermbg=233 ctermfg=NONE
highlight ColorColumn  cterm=NONE ctermbg=234 ctermfg=NONE
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd QuickFixCmdPost  make nested botright cwindow
set wildmode=longest,list,full
set wildmenu
" }}}

" Navigation {{{
" move between windows with ctrl+hkjl
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
" }}}

" Plugins {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-github-dashboard'
Plug 'Raimondi/yaifa'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-clang-format'
call plug#end()
" Type :PlugInstall to use the plugin manager
" }}}

" Clang-Format {{{
let g:clang_format#detect_style_file = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc,bfaspec,cuda nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,bfaspec,cuda vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
" Format when exiting insert mode
autocmd FileType c,cpp,objc,bfaspec,cuda let g:clang_format#auto_format_on_insert_leave = 0
" }}}
