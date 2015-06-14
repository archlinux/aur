# Maintainer: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>
pkgname=vim-syntastic-async-git
pkgver=r674.65091e5
pkgrel=1
pkgdesc="Syntax checking hacks for vim"
arch=('any')
url="https://github.com/daniel-walker/syntastic"
license=('WTFPLv2')
groups=('vim-plugins')
depends=('vim-runtime' 'vim-async-command-git')
makedepends=('git' 'rake')
provides=('vim-syntastic')
conflicts=()
replaces=()
backup=()
options=()
install=vimdoc.install
source=($pkgname::"git+https://github.com/daniel-walker/syntastic.git"
"async_haskell.diff")
noextract=()
sha512sums=('SKIP'
'549592a7c54144e3e17d85db43bab002868504525da77c10248e3d14b9f29f43a58aed1db747f77962f9c1db55eb1148ac5171d05f03e022f19db8773d42ee33')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < $srcdir/async_haskell.diff
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/vim/vimfiles/{plugin,doc,autoload/syntastic/,syntax_checkers}
  cp plugin/syntastic.vim $pkgdir/usr/share/vim/vimfiles/plugin/
  cp doc/syntastic.txt $pkgdir/usr/share/vim/vimfiles/doc/
  cp autoload/syntastic/c.vim $pkgdir/usr/share/vim/vimfiles/autoload/syntastic/
  cp -r syntax_checkers/* $pkgdir/usr/share/vim/vimfiles/syntax_checkers/
}

# vim:set ts=2 sw=2 et:
