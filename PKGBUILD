# $Id: PKGBUILD 192021 2016-10-12 09:28:47Z jgc $
# Maintainer: blimpy <0087yugbocaj@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=('termite-nocsd' 'termite-terminfo')
pkgver=12
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/thestinger/termite/"
license=('LGPL')
makedepends=('git' 'vte3-ng' 'ncurses')
source=("git://github.com/thestinger/termite#tag=v$pkgver" "termite.patch")
md5sums=('SKIP' 'd0a7aa26ca1ef40951726ac1a24bf0f1')

build() {
  cd termite
  git submodule update --init
  make
}
prepare() {
  cd termite
  patch -Np1 -i "${srcdir}/termite.patch" "${srcdir}/termite/termite.cc" 
}

package_termite-nocsd() {
  pkgdesc="A simple VTE-based terminal without GTK client side decorations. Perfect for wayland+sway users."
  depends=('vte3-ng' 'termite-terminfo')
  backup=(etc/xdg/termite/config)

  cd termite
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/share/terminfo"
  install -Dm644 config "$pkgdir/etc/xdg/termite/config"
}

package_termite-terminfo() {
  pkgdesc='Terminfo for Termite, a simple VTE-based terminal'

  cd termite
  install -d "$pkgdir/usr/share/terminfo"
  tic -x termite.terminfo -o "$pkgdir/usr/share/terminfo"
}
