# Maintainer: Beini <bane AT iki dot fi>
# Contributor: Daniel Micay <danielmicay@gmail.com>
_gitname=termite
pkgname=('termite-ranger-fix-git' 'termite-ranger-fix-terminfo-git')
pkgver=10.85.gf18155b
pkgver() { cd $_gitname && git describe | sed 's/^v//; s/-/./g'; }
pkgrel=1
epoch=1
arch=('i686' 'x86_64')
url="https://github.com/autrimpo/termite/tree/ranger-fix"
license=('LGPL')
makedepends=('git' 'vte3-ng' 'ncurses')
source=(git://github.com/autrimpo/termite.git#branch=ranger-fix)
md5sums=('SKIP')

build() {
  cd $_gitname
  git submodule update --init
  make
}

package_termite-ranger-fix-git() {
  pkgdesc="A simple VTE-based terminal. Includes a fix for w3mimgdisplay"
  depends=('vte3-ng' 'termite-ranger-fix-terminfo-git')
  backup=(etc/xdg/termite/config)
  provides=('termite' 'termite-git')
  conflicts=('termite' 'termite-git')

  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/share/terminfo"
  install -Dm644 config "$pkgdir/etc/xdg/termite/config"
}

package_termite-ranger-fix-terminfo-git() {
  pkgdesc='Terminfo for Termite, a simple VTE-based terminal'
  provides=('termite-terminfo' 'termite-terminfo-git')
  conflicts=('termite-terminfo' 'termite-terminfo-git')

  cd $_gitname
  install -d "$pkgdir/usr/share/terminfo"
  tic -x termite.terminfo -o "$pkgdir/usr/share/terminfo"
}
