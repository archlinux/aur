pkgname=mingw-w64-jansson
pkgver=2.7
pkgrel=1
pkgdesc="C library for encoding, decoding and manipulating JSON data (mingw-w64)"
arch=(any)
url="http://www.digip.org/jansson/"
license=("MIT")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("http://www.digip.org/jansson/releases/jansson-${pkgver}.tar.gz")
sha1sums=('7d8686d84fd46c7c28d70bf2d5e8961bc002845e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/jansson-${pkgver}" 
  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd 
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/jansson-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

