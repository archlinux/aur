pkgname=mingw-w64-vinecopulib
pkgver=1.0.0
pkgrel=1
pkgdesc="C++ vine copula library (mingw-w64)"
license=(MIT)
arch=(any)
url="https://github.com/vinecopulib/vinecopulib"
depends=('mingw-w64-boost' 'mingw-w64-eigen' 'mingw-w64-libwdm')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/vinecopulib/vinecopulib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c4decb2d6bde4bef460ad257c28609033aaa15b284bed8c86d609fc9015c57af')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd vinecopulib-${pkgver}
}

build() {
  cd vinecopulib-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DVINECOPULIB_PRECOMPILED=ON -DBUILD_TESTING=OFF -DCMAKE_UNITY_BUILD=ON -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd vinecopulib-${pkgver}
  for _arch in $_architectures; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
  done
}
