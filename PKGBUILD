# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-libdvdcss
pkgver=1.4.3
pkgrel=1
pkgdesc="Portable abstraction library for DVD decryption (mingw-w64)"
url="https://www.videolan.org/developers/libdvdcss.html"
arch=('any')
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("https://download.videolan.org/pub/libdvdcss/${pkgver}/libdvdcss-${pkgver}.tar.bz2")
sha256sums=('233cc92f5dc01c5d3a96f5b3582be7d5cee5a35a52d3a08158745d3d86070079')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${srcdir}/libdvdcss-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-doc
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/libdvdcss-${pkgver}/build-${_arch}
    make install DESTDIR="${pkgdir}"
    rm -rf "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
