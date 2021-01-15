# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Dumitru Ursu <dima@ceata.org>

_pkgname=OpenColorIO
pkgname=${_pkgname,,}-git
pkgver=1.0.8.r572.gd71748bf
pkgrel=1
pkgdesc="A color management framework for visual effects and animation"
arch=('x86_64')
url="https://opencolorio.org"
license=('BSD')
depends=('freeglut' 'glew' 'lcms2' 'openexr' 'pystring' 'tinyxml' 'yaml-cpp')
makedepends=('boost' 'cmake' 'git' 'pybind11' 'python')
optdepends=('python: python bindings')
provides=('opencolorio')
conflicts=('opencolorio')
source=("git+https://github.com/AcademySoftwareFoundation/OpenColorIO")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare(){
  mkdir -p $_pkgname/build
  sed -i '/Global CMake options/ a find_package(Threads REQUIRED)' $_pkgname/CMakeLists.txt
}

build() {
  cd $_pkgname/build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DOCIO_BUILD_APPS=OFF \
    -DOCIO_BUILD_TESTS=OFF \
    -DOCIO_BUILD_GPU_TESTS=OFF
  make
}

package() {
  cd "$_pkgname"/build

  make DESTDIR="$pkgdir" install

  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
