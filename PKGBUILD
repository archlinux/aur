pkgname=mingw-w64-mpfr
_pkgver=4.1.0
pkgver=$_pkgver
pkgrel=1
pkgdesc="Multiple-precision floating-point library (mingw-w64)"
arch=(any)
url="http://www.mpfr.org"
license=("LGPL")
makedepends=('mingw-w64-configure')
depends=("mingw-w64-gmp")
options=('staticlibs' '!strip' '!buildflags')
source=(http://www.mpfr.org/mpfr-${_pkgver}/mpfr-${_pkgver}.tar.xz{,.asc})
sha256sums=('0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f'
            'SKIP')
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"/mpfr-${_pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-shared \
      --disable-static \
      --enable-thread-safe
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/mpfr-${_pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
