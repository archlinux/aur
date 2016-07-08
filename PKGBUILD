pkgname=mingw-w64-jsoncpp
pkgver=1.7.3
pkgrel=1
pkgdesc='A C++ library for interacting with JSON (mingw-w64)'
url='https://github.com/open-source-parsers/jsoncpp'
license=('MIT' 'custom:Public_Domain')
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=(jsoncpp-${pkgver}.tar.gz::"https://github.com/open-source-parsers/jsoncpp/archive/${pkgver}.tar.gz")
md5sums=('aff6bfb5b81d9a28785429faa45839c5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd jsoncpp-${pkgver}
  for _arch in $_architectures; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
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

