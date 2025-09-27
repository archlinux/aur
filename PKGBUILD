pkgname=mingw-w64-vinecopulib
pkgver=0.7.3
pkgrel=1
pkgdesc="C++ vine copula library (mingw-w64)"
license=(MIT)
arch=(any)
url="https://github.com/vinecopulib/vinecopulib"
depends=('mingw-w64-boost' 'mingw-w64-eigen' 'mingw-w64-libwdm')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/vinecopulib/vinecopulib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2130d5e381e62d13c409a6e44454f171b57bcc2eca049ebe8184a1acf599c7a0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd vinecopulib-${pkgver}
  sed -i "s|EIGEN3_FOUND|Eigen3_FOUND|g" cmake/findDependencies.cmake
}

build() {
  cd vinecopulib-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DVINECOPULIB_PRECOMPILED=ON -DBUILD_TESTING=OFF -DOPT_ASAN=OFF -DCMAKE_UNITY_BUILD=ON -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir"/vinecopulib-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
  done
}
