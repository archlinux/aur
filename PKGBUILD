pkgname=mingw-w64-nlohmann-json
pkgver=3.11.2
pkgrel=1
pkgdesc='Header-only JSON library for Modern C++ (mingw-w64)'
url='https://github.com/nlohmann/json'
license=(MIT)
arch=(any)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/nlohmann/json/archive/v${pkgver}.tar.gz")
sha256sums=('d69f9deb6a75e2580465c6c4c5111b89c4dc2fa94e3a85fcd2ffcd9a143d9273')

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
