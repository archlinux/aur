
pkgname=mingw-w64-libaacs
pkgver=0.7.1
pkgrel=1
pkgdesc="Advanced Access Content System (mingw-w64)"
url="http://www.videolan.org/libaacs"
arch=('any')
license=('LGPL')
depends=('mingw-w64-crt' 'mingw-w64-libgpg-error')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=(ftp://ftp.videolan.org/pub/videolan/libaacs/${pkgver}/libaacs-${pkgver}.tar.bz2)
sha1sums=('09eb61bcfceca77cd779c4475093dd22a0cb5510')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd libaacs-$pkgver
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/libaacs-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-all "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
