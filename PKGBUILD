# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-glib-networking
pkgver=2.74.0
pkgrel=1
pkgdesc="Network extensions for GLib (32-bit)"
url="https://gitlab.gnome.org/GNOME/glib-networking"
arch=(x86_64)
license=(GPL2)
depends=(
  glib-networking
  lib32-glib2
  lib32-gnutls
  lib32-libproxy
)
makedepends=(
  git
  meson
)
checkdepends=(
  ca-certificates
)
_commit=d17632fe495c573612dd69e982a0c49af2952178  # tags/2.74.0^0
source=("git+https://gitlab.gnome.org/GNOME/glib-networking.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd glib-networking

  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  arch-meson glib-networking build --libdir=/usr/lib32
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
  rm -r "${pkgdir}"/usr/{lib,share}
}

# vim:set ts=2 sw=2 et:
