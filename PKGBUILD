# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-double-conversion
_pkgname=double-conversion
pkgver=3.1.2
pkgrel=1
pkgdesc="Binary-decimal and decimal-binary routines for IEEE doubles (mingw-w64)"
arch=(any)
url='https://github.com/google/double-conversion'
license=(BSD)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("double-conversion-${pkgver}.tar.gz::https://github.com/google/double-conversion/archive/v${pkgver}.tar.gz")
sha256sums=('2a9795dd9e56fbc616f8d51833fbd706a10c965ec588d1a5557af8b129cdb5b0')

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
