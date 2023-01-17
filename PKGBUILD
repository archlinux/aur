pkgname=mingw-w64-mpfr
_pkgver=4.2.0
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
sha256sums=('06a378df13501248c1b2db5aa977a2c8126ae849a9d9b7be2546fb4a9c26d993'
            'SKIP')
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D'
              'A534BE3F83E241D918280AEB5831D11A0D4DB02A') # Vincent Lefevre <vincent@vinc17.net>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"/mpfr-${_pkgver}
}

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
