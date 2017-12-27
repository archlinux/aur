# $Id$
# Maintainer: unit73e <unit73e at gmail dot com>
# Contributor: blimpy <0087yugbocaj@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

_reponame="termite"
pkgname=('termite-nocsd')
pkgver=13
pkgrel=1
arch=('x86_64')
url="https://github.com/thestinger/termite/"
license=('LGPL')
conflicts=('termite')
makedepends=('git' 'vte3-ng' 'ncurses')
source=("git+https://github.com/thestinger/$_reponame#tag=v$pkgver" "termite.patch")
sha256sums=('SKIP'
            '4319296a88502b0a0397704177047cf7b0d39816b87d0f477a92ced4d1f16715')

build() {
  cd $_reponame
  git submodule update --init
  make
}

prepare() {
  cd $_reponame
  patch -Np1 -i "${srcdir}/termite.patch" "${srcdir}/termite/termite.cc" 
}

package_termite-nocsd() {
  pkgdesc="A simple VTE-based terminal without GTK client side decorations. Perfect for wayland+sway users."
  depends=('vte3-ng' 'termite-terminfo')
  backup=(etc/xdg/termite/config)

  cd $_reponame
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/share/terminfo"
  install -Dm644 config "$pkgdir/etc/xdg/termite/config"
}

