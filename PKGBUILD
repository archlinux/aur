# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-glib-networking
pkgver=2.62.3
pkgrel=1
pkgdesc='Network-related giomodules for glib'
arch=(x86_64)
url=https://git.gnome.org/browse/glib-networking/
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
  lib32-openssl
)
checkdepends=(
  ca-certificates
)
optdepends=(
  'lib32-openssl: Alternative backend'
)
source=(git+https://gitlab.gnome.org/GNOME/glib-networking.git#tag=aa028cf86c71474cf0ecbf399241053e82ac4fb9)
sha256sums=(SKIP)

pkgver() {
  cd glib-networking

  git describe --tags
}

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  arch-meson glib-networking build \
    --libdir=/usr/lib32 \
    -D openssl=enabled
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  rm -rf "${pkgdir}"/usr/{lib,share}
}

# vim: ts=2 sw=2 et:
