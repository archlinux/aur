pkgname=mingw-w64-cdt
pkgver=1.4.5
pkgrel=1
pkgdesc="Constrained Delaunay Triangulation (C++) (mingw-w64)"
license=('MPL-2.0')
arch=('any')
url="https://artem-ogre.github.io/CDT/"
depends=()
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/artem-ogre/CDT/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5b964a00147d17f5d6ffd9c800d4f12f1e540ce8e932655469f65aea9a3005d7')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare () {
  cd CDT-$pkgver/CDT
  sed -i "s|DESTINATION cmake)|DESTINATION lib/cmake/CDT)|g" CMakeLists.txt
}

build() {
  cd CDT-$pkgver/CDT
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd CDT-$pkgver/CDT
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
  done
}

