pkgname=mingw-w64-jsoncpp
pkgver=1.9.8
pkgrel=1
pkgdesc='A C++ library for interacting with JSON (mingw-w64)'
url='https://github.com/open-source-parsers/jsoncpp'
license=('MIT' 'custom:Public_Domain')
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=(jsoncpp-${pkgver}.tar.gz::"https://github.com/open-source-parsers/jsoncpp/archive/${pkgver}.tar.gz")
sha256sums=('51828cf3574281d2b79ec2a1c56a9e4c20cc1103711321ea96384cffb8d2d904')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd jsoncpp-${pkgver}
  for _arch in $_architectures; do
    ${_arch}-cmake \
      -DBUILD_STATIC_LIBS=ON \
      -DJSONCPP_WITH_TESTS=OFF \
      -DJSONCPP_WITH_CMAKE_PACKAGE=ON \
      -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir/jsoncpp-${pkgver}"
  for _arch in $_architectures; do
    DESTDIR="${pkgdir}" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

