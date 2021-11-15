# Maintainer: Chris Tam <LChris314 at gmail dot com>

_pkgname=Overmix
pkgname=overmix
_pkgver=0.4.0-alpha3
pkgver="${_pkgver/-/}"
pkgrel=3
pkgdesc='Automatic anime screenshot stitching in high quality'
arch=('x86_64')
url='https://github.com/spillerrec/Overmix'
license=('GPL3')
depends=(
  'qt5-base'
  'qt5-x11extras'
  'ffmpeg'
  'zlib'
  'xz'
  'libpng'
  'libjpeg'
  'libraw'
  'fftw'
  'pugixml'
  'lcms2'
  'eigen'
  'qcustomplot'
  'libxcb'
)
makedepends=('cmake' 'boost' 'png++')

source=("https://github.com/spillerrec/Overmix/archive/refs/tags/v${_pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('759e1b32d2c95e0b5ff6b3b938034d25ac54dea65a84deffd88d533056378b25'
            'e9e71bf5523fb4acfd7e01d0db90f42626ed9cd7fb20f57efa8fe40a69639627')

prepare() {
    sed -i -E 's/^#include\s+<exception>$/&\n#include <stdexcept>/' "${_pkgname}-${_pkgver}/src/containers/DelegatedContainer.hpp"
    cmake \
        -B build \
        -S "${_pkgname}-${_pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_FLAGS="$CFLAGS" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
        -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgname}-${_pkgver}/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
