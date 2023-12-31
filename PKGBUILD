
pkgname=mingw-w64-tinyxml2
pkgver=10.0.0
pkgrel=1
pkgdesc='Simple, small, C++ XML parser that can be easily integrated into other programs (mingw-w64)'
url="https://github.com/leethomason/tinyxml2"
arch=('any')
license=('zlib')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!strip' '!buildflags')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('3bdf15128ba16686e69bce256cc468e76c7b94ff2c7f391cc5ec09e40bff3839')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/tinyxml2-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/tinyxml2-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
