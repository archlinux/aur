pkgname=mingw-w64-vinecopulib
pkgver=0.7.1
pkgrel=1
pkgdesc="C++ vine copula library (mingw-w64)"
license=(MIT)
arch=(any)
url="https://github.com/vinecopulib/vinecopulib"
depends=('mingw-w64-boost' 'mingw-w64-eigen' 'mingw-w64-libwdm')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/vinecopulib/vinecopulib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef514eaa4691186bb90c9e0490187342ffd89c2bb9d180ae8e36989c1dec8f20')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd vinecopulib-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DVINECOPULIB_SHARED_LIB=ON -DBUILD_TESTING=OFF -DOPT_ASAN=OFF -DCMAKE_UNITY_BUILD=ON -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir"/vinecopulib-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
  done
}
