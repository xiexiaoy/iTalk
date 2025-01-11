"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup		" keep a backup file (restore to previous version)
set undofile		" keep an undo file (undo changes after closing)

set history=100		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"搜索高亮
set hlsearch
"折行
set nowrapscan

set linebreak

set ignorecase

"行号和相对行号
"set relativenumber
set number

set colorcolumn=80

set updatetime=2000

set cmdheight=2

set scrolloff=1

set smoothscroll

set nostartofline

set wildmenu

"始终显示状态条
set laststatus=2

set autowrite
"set autowriteall
"set spell

set tm=400
set ttm=0

"tab设置为4个空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent		" always set autoindenting on
set smartindent

"折叠
set foldmethod=indent
set foldlevel=99

"更改备份和交换文件的位置
set backupdir=~/.vimtmp
set directory=~/.vimtmp
set undodir=~/.vimtmp

"ctags
set tags=./.tags;,.tags

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

if has('gui_running')
    "字体
    set guifont=Dejavu\ Sans\ Mono\ Book\ 17
    "set guifont=Dejavu\ Sans\ Mono:h15
    set linespace=-1
    "隐藏工具栏和菜单栏和滚动条
    set guioptions-=T
    set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=b
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

"不高亮匹配
let loaded_matchparen = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> tn :tabnext<CR>
nnoremap <silent> tp :tabprev<CR>
nnoremap <silent> th :tabnext<CR>
nnoremap <silent> tl :tabprev<CR>
nnoremap <silent> td :tabclose<CR>

"拿buffer当普通编辑器的tab使
nnoremap <silent> <S-h> :bp<CR>
nnoremap <silent> <S-l> :bn<CR>

"快速移动到其他window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap j gj
nnoremap k gk
nnoremap <C-e> <C-e>j
nnoremap <C-y> <C-y>k

"刷新vimrc
nnoremap <leader>e :e ~/.vimrc<cr>

"clear search hight light
nnoremap <silent> <BS> :nohl<cr>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

"插入模式下bash风格移动
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-A> <Esc>^i
inoremap <C-E> <End>
"删除
inoremap <C-D>  <Delete>

inoremap <c-j> <c-g><c-j>
inoremap <c-k> <c-g><c-k>

vnoremap < <gv
vnoremap > >gv

" URL encode/decode selection
vnoremap ,eu :!python3 -c 'import sys,urllib.parse;print(urllib.parse.quote(sys.stdin.read()), end="")'<cr>
vnoremap ,du :!python3 -c 'import sys,urllib.parse;print(urllib.parse.unquote(sys.stdin.read()), end="")'<cr>

vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

"emacs-stype editing on the command-line
" start of line
:cnoremap <C-A>		<Home>
" back one character
:cnoremap <C-B>		<Left>
" delete character under cursor
:cnoremap <C-D>		<Del>
" end of line
:cnoremap <C-E>		<End>
" forward one character
:cnoremap <C-F>		<Right>
" recall newer command-line
:cnoremap <C-N>		<Down>
" recall previous (older) command-line
:cnoremap <C-P>		<Up>
" back one word
:cnoremap <Esc><C-B>	<S-Left>
" forward one word
:cnoremap <Esc><C-F>	<S-Right>

cmap w!! w !sudo tee >/dev/null %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertEnter * set nocursorline
autocmd BufEnter,InsertLeave *  set cursorline
" autocmd BufWritePre * %s/\s\+$//e
autocmd! BufWritePost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
syntax on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'fatih/vim-go'
let g:go_fmt_autosave = 1
let g:go_autodetect_gopath = 1
let g:go_gocode_unimported_packages = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

au FileType go nnoremap \t <Plug>(go-info)
au FileType go nnoremap \k <Plug>(go-doc-split)
au FileType go nnoremap \d <Plug>(go-def-split)
au FileType go nnoremap \r <Plug>(go-referrers)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<C-.>'
let g:ycm_show_diagnostics_ui = 1
let g:ycm_auto_hover='CursorHoldI'
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args = ['--completion-style=detailed', '--header-insertion=never', '--background-index']
let g:ycm_complete_in_comments = 1
let g:ycm_disable_signature_help = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_python_binary_path = 'python'
let g:ycm_max_num_candidates = 30
let g:ycm_max_num_identifier_candidates = 5
let g:ycm_enable_semantic_highlighting=0
let g:ycm_enable_inlay_hints=0
let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

nmap <c-\> :YcmCompleter GoToDeclaration<cr>
nmap <c-'> :YcmCompleter G
nmap K <plug>(YCMHover)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
"./config_gen


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'rhysd/vim-clang-format'
let g:clang_format#style_options = {
            \   "ColumnLimit": 80,
            \   "AccessModifierOffset": -4}
let g:clang_format#auto_format = 1
" let g:clang_format#auto_format_git_diff = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_auto_focus = {
            \ "at": "start"
            \ }
let g:ctrlsf_auto_close = {
            \ "normal": 1,
            \ "compact": 1
            \ }
let g:ctrlsf_default_view_mode = 'compact'
nmap <Space>s <Plug>CtrlSFPrompt
vmap <Space>s <Plug>CtrlSFVwordPath
vmap <Space>S <Plug>CtrlSFVwordExec
nmap <Space>w <Plug>CtrlSFCwordPath
nmap <Space>W <Plug>CtrlSFCwordExec
nmap <Space>t :CtrlSFToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Yggdroot/LeaderF'
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '\b'
nnoremap <silent> <c-n> :LeaderfMru<cr>
nnoremap <silent> \f :LeaderfFunction<cr>
nnoremap <silent> \b :LeaderfBuffer<cr>
nnoremap <silent> \t :LeaderfBufTag<cr>
nnoremap <silent> \r :LeaderfTag<cr>
nnoremap <silent> \h :LeaderfHistoryCmd<cr>
nnoremap <silent> \l :LeaderfLine<cr>
nnoremap <silent> \c :LeaderfColorscheme<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.root']
let g:Lf_DefaultMode = 'NameOnly'
let g:Lf_FollowLinks = 1
let g:Lf_NeedCacheTime = 0.5
let g:Lf_NumberOfCache = 20
let g:Lf_WorkingDirectoryMode = 'c'
let g:Lf_WindowPosition = 'popup'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 1
let g:Lf_ShowDevIcons = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewCode = 1
let g:Lf_PreviewInPopup = 1
let g:Lf_GtagsGutentags = 1
let g:Lf_JumpToExistingWindow = 0
let g:Lf_ExternalCommand = 'rg --no-follow --files --no-ignore-vcs "%s"'
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 1,
        \ 'Mru': 1,
        \ 'Tag': 1,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 1,
        \ 'Colorscheme': 1,
        \ 'Rg': 1,
        \ 'Gtags': 1
        \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ludovicchabant/vim-gutentags'
let $GTAGSLABEL = 'native-pygments'
let g:gutentags_generate_on_write = 1

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.root']


" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
"if executable('gtags-cscope') && executable('gtags')
"	let g:gutentags_modules += ['gtags_cscope']
"    set cscopeprg=gtags-cscope
"endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'/.LfCache/gtags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'terryma/vim-expand-region'
vnoremap v <Plug>(expand_region_expand)
vnoremap V <Plug>(expand_region_shrink)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
nnoremap <Leader>f :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/tagbar'
let g:tagbar_ctags_bin='/usr/bin/ctags-universal'
let g:tagbar_sort=0
let g:tagbar_show_data_type=0
let g:tagbar_suffix=0
let g:tagbar_singleclick=1
let g:tagbar_autoshowtag=1
nnoremap <Leader>t :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsCenterLine = 0
autocmd filetype lisp,scheme,racket let b:AutoPairs = {"(": ")", "[": "]", "{": "}","\"": "\""}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/closetag.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'  " show full tag hierarchy
let g:airline#extensions#tagbar#flags = 'f'  " show full tag hierarchy
let g:airline#extensions#ycm#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'zivyangll/git-blame.vim'
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/vim-easy-align'
nnoremap <Leader>a <Plug>(EasyAlign)
vnoremap <Leader>a <Plug>(EasyAlign)
nnoremap <Leader>A <Plug>(EasyAlign)
vnoremap <Leader>A <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'markonm/traces.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'sheerun/vim-polyglot'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<Bar>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

set regexpengine=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'calebsmith/vim-lambdify'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'machakann/vim-swap'
omap i, <Plug>(swap-textobject-i)
xmap i, <Plug>(swap-textobject-i)
omap a, <Plug>(swap-textobject-a)
xmap a, <Plug>(swap-textobject-a)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-surround'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'wellle/targets.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'easymotion/vim-easymotion'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'qpkorr/vim-bufkill'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'muziqiushan/vim-bufonly'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-signify'
let g:signify_update_on_bufenter = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-startify'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'kabbamine/zeavim.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'machakann/vim-highlightedyank'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 't9md/vim-quickhl'
nnoremap vz <Plug>(quickhl-manual-this)
vnoremap vz <Plug>(quickhl-manual-this)
nnoremap z/ <Plug>(quickhl-cword-toggle)
nnoremap z<BS> <Plug>(quickhl-manual-clear)
vnoremap z<BS> <Plug>(quickhl-manual-clear)
nnoremap z\ <Plug>(quickhl-manual-reset)
vnoremap z\ <Plug>(quickhl-manual-reset)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'skywind3000/vim-auto-popmenu'

" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}

" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'skywind3000/asynctasks.vim'
let g:asynctasks_term_pos = 'external'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.root']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'skywind3000/vim-dict'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/fcitx.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dzeban/vim-log-syntax'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/rfc-syntax'
autocmd! BufReadPost rfc\d\+\.txt setfiletype rfc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/lua.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/vim-misc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ds26gte/scmindent'
autocmd BufReadPost *.rkt,*.rktl set filetype=scheme
autocmd filetype lisp,scheme setlocal equalprg=scmindent.rkt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'tex': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \       },
            \       'lisp': {
            \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \       },
            \       'vim': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \       },
            \       'html': {
            \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \       },
            \       'css': 0,
            \   }
            \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"主题配色
syntax enable
if has('gui_running')
    set background=dark
    colorscheme Tomorrow-Night-Eighties
else
    set background=dark
    colorscheme molokai
endif

