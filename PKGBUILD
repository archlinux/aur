
pkgname=mingw-w64-libaacs
pkgver=0.11.0
pkgrel=1
pkgdesc="Advanced Access Content System (mingw-w64)"
url="https://www.videolan.org/developers/libaacs.html"
arch=('any')
license=('LGPL')
depends=('mingw-w64-crt' 'mingw-w64-libgcrypt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=(https://download.videolan.org/pub/videolan/libaacs/${pkgver}/libaacs-${pkgver}.tar.bz2)
sha256sums=('6d884381fbb659e2a565eba91e72499778635975e4b3d6fd94ab364a25965387')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd libaacs-$pkgver
  for _arch in ${_architectures}; do
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
