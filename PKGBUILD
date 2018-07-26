
pkgname=mingw-w64-nlopt
pkgver=2.5.0
pkgrel=1
pkgdesc="nonlinear optimization library (mingw-w64)"
arch=(any)
url="http://ab-initio.mit.edu/wiki/index.php/NLopt"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/stevengj/nlopt/archive/v${pkgver}.tar.gz")
sha256sums=('c6dd7a5701fff8ad5ebb45a3dc8e757e61d52658de3918e38bab233e7fd3b4ae')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/nlopt-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DNLOPT_MATLAB=OFF -DNLOPT_SWIG=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/nlopt-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
