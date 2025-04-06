# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=gtktester
pkgver=2.0.1
pkgrel=1
pkgdesc="Library with widgets for Gtk+ widget tests"
arch=(x86_64)
url="https://gitlab.com/gsvg/gtktester"
license=(GPL-3.0-only)
depends=(gtk4 glibc glib2 gxml gresg)
makedepends=(git meson vala gobject-introspection gobject-introspection-runtime)
checkdepends=(xorg-server-xvfb gvfs)
source=("git+https://gitlab.com/gsvg/gtktester.git#tag=${pkgver}")
sha256sums=('e185e466ac1e57302bf90461a14c4c8519fe5153b439dce589bd3776eb942962')

pkgver() {
  cd gtktester
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson gtktester build
  ninja -C build
}

check() {
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local'  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
