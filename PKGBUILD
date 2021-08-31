pkgname=mingw-w64-eigen
pkgver=3.4.0
pkgrel=1
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra. (mingw-w64)"
arch=('any')
url='http://eigen.tuxfamily.org'
license=('MPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://gitlab.com/libeigen/eigen/-/archive/${pkgver}/eigen-${pkgver}.tar.bz2")
sha256sums=('b4c198460eba6f28d34894e3a5710998818515104d6e74e5cc331ce31e46e626')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"/eigen-${pkgver}
}

build() {
  cd "$srcdir"/eigen-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DINCLUDE_INSTALL_DIR:PATH="include/eigen3" ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/eigen-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
  done
}

