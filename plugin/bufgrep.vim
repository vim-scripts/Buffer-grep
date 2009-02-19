" Author: Michael Geddes ( vimmer at frog.wheelycreek.net )
"
" Created for zorph on IRC
" Version: 0.1
"
" Bgrep /{searchexpr}/   Vimgrep all buffers.
"
"
fun! s:BufGrep(param)
  if strlen(a:param) == 0
    echoerr "Search parameter required"
    return 1
  endif
  call setqflist([])
  if a:param[0] != a:param[strlen(a:param)-1]
    let useparam='/'+escape(a:param,'/')+'/'
  else
    let useparam=a:param
  endif

  silent bufdo exe "g ".useparam." call setqflist([{'type': 'l', 'col':1, 'bufnr': winbufnr('.'), 'lnum': line('.'), 'text':getline('.')}],'a')"
  1 cc
endfun


com! -nargs=1  Bgrep  :call s:BufGrep(<q-args>)
