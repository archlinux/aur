pkgname=mingw-w64-nlopt
pkgver=2.10.1
pkgrel=1
pkgdesc="nonlinear optimization library (mingw-w64)"
arch=(any)
url="http://ab-initio.mit.edu/wiki/index.php/NLopt"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/stevengj/nlopt/archive/v${pkgver}.tar.gz")
sha256sums=('30d13ce16da119db3e987784f7864e35a562ec62c186352fae55cd003e6c58ff')

_architectures=${MINGW_W64_QT6_ARCHS:-x86_64-w64-mingw32}

build() {
  cd "$srcdir/nlopt-$pkgver"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DNLOPT_GUILE=OFF -DNLOPT_OCTAVE=OFF -DNLOPT_PYTHON=OFF -DNLOPT_JAVA=OFF -DCMAKE_UNITY_BUILD=ON -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir/nlopt-$pkgver"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
