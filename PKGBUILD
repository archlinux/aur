pkgname=mingw-w64-vinecopulib
pkgver=0.6.3
pkgrel=1
pkgdesc="C++ vine copula library (mingw-w64)"
license=(MIT)
arch=(any)
url="https://github.com/vinecopulib/vinecopulib"
depends=('mingw-w64-boost' 'mingw-w64-eigen' 'mingw-w64-libwdm')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=(vinecopulib-${pkgver}.tar.gz::${url}/archive/refs/heads/dev.zip)
sha512sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd vinecopulib-dev
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DVINECOPULIB_SHARED_LIB=ON -DBUILD_TESTING=OFF -DOPT_ASAN=OFF -DCMAKE_UNITY_BUILD=ON -B build-${_arch} vinecopulib-dev
    cmake --build build-${_arch}
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir"/vinecopulib-dev/build-${_arch}
    make install DESTDIR="$pkgdir"
  done
}
