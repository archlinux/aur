# Maintainer: Dan Johansen <strit@archlinux.org>
# Co-Maintainer: smiley <smiley@aur.archlinux.org>

_pkgname=wayqt
pkgname=('dfl-wayqt')
pkgver=0.3.0
pkgrel=2
pkgdesc="A Qt-based wrapper for various wayland protocols"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=(
        'qt6-base'
        'qt6-wayland'
        'wayland-protocols'
        'wayland'
)
makedepends=(
            'meson'
            'ninja'
)
source=(
  "$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz"
  'build-compatibility-fixes.patch'
)
sha256sums=(
  'd1c8abe7c104c81db7535360dbba6ecd2558156a8b76b6b66ad411605009fbd0'
  '54a4069d05e98d9744bbcd99da76dbaf97cf85d2e804b3181c4b37d77769a659'
)

prepare() {
  cd "${_pkgname}-v${pkgver}"
  patch -Np1 -i "$srcdir/build-compatibility-fixes.patch"
}

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT6 version..."
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
