# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=vim-vjde
pkgver=2.6.18
_scriptid=17026
_ext=tgz
pkgrel=4
pkgdesc='Just a Development Environment for VIM'
arch=('i686' 'x86_64')
url='http://vim.org/scripts/script.php?script_id=1213'
license=('GPL')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=()
optdepends=(
'ctags: to replace readtags'
'jdk: to install java-runtime and java-environment'
'jre: to install java-runtime'
)
install='vimdoc.install'
source=(
  "$pkgname-$pkgver.${_ext}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}"
)
_fix_files(){ #{{{
  local orig_file=$1
  if [ ! -w "$orig_file" -o ! -s "$orig_file" ]; then
    return
  fi
  
  # remove 'carriage return'
  sed -e 's/\r//g' -i $orig_file

  # change encoding
  iconv -c -f gbk -t utf8 $orig_file > ${orig_file}.fix && \
    mv ${orig_file}.fix ${orig_file} || return 1
} #}}}
export -f _fix_files

build() {
	_vim_dir='/usr/share/vim/vimfiles'

  # compile readtags
  cd "$srcdir"/src
  gcc -o ../plugin/vjde/readtags -DREADTAGS_MAIN readtags.c

  cd "$srcdir"
#  rm -rf "$srcdir"/src
  find $srcdir \( -iname '*.exe' -o -iname '*.dll' \) -exec rm -f '{}' ';'

  # install files
  install -dm755 "$pkgdir"/${_vim_dir}
  install -dm755 "$pkgdir"/usr/bin

  tar -c ./  \
    --exclude $pkgname-$pkgver.${_ext} \
    --exclude src \
    | tar -xC "$pkgdir"/${_vim_dir}
  
  mv "$pkgdir"/${_vim_dir}/plugin/vjde/readtags \
    ${pkgdir}/usr/bin
  ln -s /usr/bin/readtags \
    "$pkgdir"/${_vim_dir}/plugin/vjde

  # fixing files
  find "$pkgdir"/${_vim_dir} -type f -a ! -name '*.class' -a ! -name '*.jar' -exec bash -c '_fix_files {}' ';'
}

md5sums=('29fa90a0ec504ed2b5587d401455ba1e')
