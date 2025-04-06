# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gsvgtk
pkgver=0.11.0
pkgrel=1
pkgdesc="Library providing Gtk+ widgets to view and modify SVG documents"
arch=(x86_64)
url="https://gitlab.com/gsvg/gsvgtk"
license=(LGPL-2.1-only)
depends=(gxml gsvg gtk4)
makedepends=(git meson vala gobject-introspection gtktester)
checkdepends=(xorg-server-xvfb)
options=(!lto)
source=("git+https://gitlab.com/gsvg/gsvgtk.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  export CFLAGS+=" -Wno-implicit-function-declaration"
  export CXXFLAGS+=" -Wno-implicit-function-declaration"

  arch-meson $pkgname build
  ninja -C build
}

check() {
  #meson test -C build --print-errorlogs
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
