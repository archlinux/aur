# $Id: PKGBUILD 192021 2016-10-12 09:28:47Z jgc $
# Maintainer: blimpy <0087yugbocaj@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=('termite-nocsd')
pkgver=12
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/thestinger/termite/"
license=('LGPL')
conflicts=('termite')
makedepends=('git' 'vte3-ng' 'ncurses')
source=("git+https://github.com/thestinger/termite#tag=v$pkgver" "termite.patch")
sha256sums=('SKIP'
            '4319296a88502b0a0397704177047cf7b0d39816b87d0f477a92ced4d1f16715')

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

