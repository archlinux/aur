pkgname=mingw-w64-nlohmann-json
pkgver=3.10.5
pkgrel=1
pkgdesc='Header-only JSON library for Modern C++ (mingw-w64)'
url='https://github.com/nlohmann/json'
license=(MIT)
arch=(any)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/nlohmann/json/archive/v${pkgver}.tar.gz")
sha256sums=('5daca6ca216495edf89d167f808d1d03c4a4d929cef7da5e10f135ae1540c7e4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/json-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DJSON_BuildTests=OFF -DJSON_MultipleHeaders=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/json-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  done
}
