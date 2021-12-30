pkgname=mingw-w64-jsoncpp
pkgver=1.9.5
pkgrel=1
pkgdesc='A C++ library for interacting with JSON (mingw-w64)'
url='https://github.com/open-source-parsers/jsoncpp'
license=('MIT' 'custom:Public_Domain')
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=(jsoncpp-${pkgver}.tar.gz::"https://github.com/open-source-parsers/jsoncpp/archive/${pkgver}.tar.gz")
sha256sums=('f409856e5920c18d0c2fb85276e24ee607d2a09b5e7d5f0a371368903c275da2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd jsoncpp-${pkgver}
  for _arch in $_architectures; do
    ${_arch}-cmake \
      -DBUILD_STATIC_LIBS=ON \
      -DJSONCPP_WITH_TESTS=OFF \
      -DJSONCPP_WITH_CMAKE_PACKAGE=ON \
      -B build-${_arch} .
    make -C build-${_arch}
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

