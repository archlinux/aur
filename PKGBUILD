pkgname=mingw-w64-libwdm
pkgver=0.2.4
pkgrel=1
pkgdesc="Header-only C++ library for weighted dependence measures (mingw-w64)"
arch=(any)
url="https://github.com/tnagler/wdm"
license=(MIT)
depends=('mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5d860025ccb8014f039d4e8aa07834b35c28f1c47164a6e346a3f8d24907e472a1bbec60fc1eb14cd042beaa6b08d58c988299913270116beaa44e657d3fd5b9')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd wdm-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DBUILD_TESTING=OFF -DOPT_ASAN=OFF .
    cmake --build build-${_arch}
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir"/wdm-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
  done
}
