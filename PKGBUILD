# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=tbe
pkgver=0.9.2.1
pkgrel=3
pkgdesc="The Butterfly Effect is a physics-based puzzle game"
arch=('i686' 'x86_64')
url='http://the-butterfly-effect.org/'
license=('GPL2')
depends=('qt4')
makedepends=('cmake')
source=("tbe-${pkgver}.tar.gz::https://github.com/kaa-ching/tbe/archive/v${pkgver}.tar.gz")
sha256sums=('afffea8df53c5e805a79963e0358fd1d6e8fdc735bbb4d4315cd4d1571c244b3')

prepare() {
  cd tbe-${pkgver}
  sed -i 's|games)|bin)|' CMakeLists.txt
  sed -i 's|games/tbe|tbe|' CMakeLists.txt
  sed -i 's|BINARY_DIRECTORY+"/../share/games|"/usr/share|' src/tbe_paths.h
}

build() {
  cd tbe-${pkgver}/i18n
  ./tbe_levels_i18n.sh && cd ..
  cmake \
    -DWITH_DOCS=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd tbe-${pkgver}
  make DESTDIR="${pkgdir}/" install
}
