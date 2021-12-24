# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-double-conversion
_pkgname=double-conversion
pkgver=3.1.7
pkgrel=1
pkgdesc="Binary-decimal and decimal-binary routines for IEEE doubles (mingw-w64)"
arch=(any)
url='https://github.com/google/double-conversion'
license=(BSD)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("double-conversion-${pkgver}.tar.gz::https://github.com/google/double-conversion/archive/v${pkgver}.tar.gz")
sha256sums=('a0204d6ab48223f2c8f53a932014e7f245125e7a5267764b1fbeebe4fa0ee8b9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    # shared
    mkdir -p build-${_arch}-shared && pushd build-${_arch}-shared
    ${_arch}-cmake ..
    make
    popd
    
    # static
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    # shared
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}-shared"
    make DESTDIR="${pkgdir}" install
    # static
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
