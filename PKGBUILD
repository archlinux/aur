# Maintainer: Bertrand Lemasle <blemasle@gmail.com>

pkgname=libindi-astrolink4
pkgver=1.9.4
pkgrel=1
pkgdesc="3rd party drivers for INDI, support for Astrolink 4 mini devices"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=(libindi=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=('10ed5e6c3a306bd77c8e39d40a942dd166ae623b12bcd6bd52b871b7ba8c908b')

prepare() {
  mkdir -p build
  cd  indi-3rdparty-${pkgver}

  #set all to off by default
  sed -i -e '/option(WITH_.*On)$/s/ On)$/ Off)/' CMakeLists.txt

  # Allow installing outside of /lib
  find ./ -name CMakeLists.txt -exec sed -i -e 's|"\/lib|"${CMAKE_INSTALL_PREFIX}/lib|g' {} \;
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_ASTROLINK4=On \
    ../indi-3rdparty-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
