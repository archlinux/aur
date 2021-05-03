pkgname=fmilib
pkgver=2.3
pkgrel=1
pkgdesc="open-source implementation of the FMI open standard"
arch=('x86_64')
url="http://www.jmodelica.org/FMILibrary"
makedepends=('cmake')
depends=('minizip' 'expat')
license=('BSD')
source=("https://github.com/modelon-community/fmi-library/archive/${pkgver}.tar.gz")
sha256sums=('826bf4ee9ab52673e8993fe3e275505adeddd8d7c9ee3cb152c700108f82a05a')

prepare() {
  cd "$srcdir"/fmi-library-${pkgver}

  # do not override CMAKE_INSTALL_PREFIX
  sed -i "/CMAKE_INSTALL_PREFIX/d" CMakeLists.txt

  # install doc in /usr/share
  sed -i "s|DESTINATION doc)|DESTINATION share/doc/fmilib)|g" CMakeLists.txt
}

build() {
  cd "$srcdir"/fmi-library-${pkgver}
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir"/fmi-library-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
