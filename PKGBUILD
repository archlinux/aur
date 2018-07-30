# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libdvdcss
pkgver=1.4.2
pkgrel=1
pkgdesc="Portable abstraction library for DVD decryption (mingw-w64)"
url="https://www.videolan.org/developers/libdvdcss.html"
arch=('any')
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://download.videolan.org/pub/libdvdcss/${pkgver}/libdvdcss-${pkgver}.tar.bz2")
sha256sums=('78c2ed77ec9c0d8fbed7bf7d3abc82068b8864be494cfad165821377ff3f2575')

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
