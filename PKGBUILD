# Maintainer: Will Gauvin <wgauvin@gmail.com>

pkgname=libindi-gphoto
pkgver=1.9.1
pkgrel=1
pkgdesc="3rd party drivers for INDI, support for DSLR camers using gphoto"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=(libindi=${pkgver} libgphoto2)
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=('5918c3cf7f907201d6cf159ea7cbadf618fda197ba35dff3c0d4b37f2d67f695')

prepare() {
  mkdir -p build
  cd  indi-3rdparty-${pkgver}

  #set all to off by default
  sed -i -e '/option(WITH_.*On/s/ On/ Off/' CMakeLists.txt

  # Allow installing outside of /lib
  find ./ -name CMakeLists.txt -exec sed -i -e 's|"\/lib|"${CMAKE_INSTALL_PREFIX}/lib|g' {} \;
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_GPHOTO=On \
    ../indi-3rdparty-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
