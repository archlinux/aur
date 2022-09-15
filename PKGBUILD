pkgname=fmilib
pkgver=2.4.1
pkgrel=1
pkgdesc="open-source implementation of the FMI open standard"
arch=('x86_64')
url="http://www.jmodelica.org/FMILibrary"
makedepends=('cmake')
depends=('minizip' 'expat')
license=('BSD')
source=("https://github.com/modelon-community/fmi-library/archive/${pkgver}.tar.gz")
sha256sums=('8199d3e9423494b714b9c4e42f055248457a7c9162df3d4652000aa9a10b8316')

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
