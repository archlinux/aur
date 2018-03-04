pkgname=mingw-w64-jsoncpp
pkgver=1.8.4
pkgrel=1
pkgdesc='A C++ library for interacting with JSON (mingw-w64)'
url='https://github.com/open-source-parsers/jsoncpp'
license=('MIT' 'custom:Public_Domain')
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=(jsoncpp-${pkgver}.tar.gz::"https://github.com/open-source-parsers/jsoncpp/archive/${pkgver}.tar.gz")
sha256sums=('c49deac9e0933bcb7044f08516861a2d560988540b23de2ac1ad443b219afdb6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd jsoncpp-${pkgver}
  for _arch in $_architectures; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DJSONCPP_WITH_TESTS=OFF \
      -DJSONCPP_WITH_CMAKE_PACKAGE=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir/jsoncpp-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

