# Maintainer: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Contributor: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libqhy
pkgver=2.1.1
pkgrel=1
pkgdesc="libqhy used by INDI QHY drivers. Please note that for sake of simplicity package version follows libindi versionning."
url="http://www.indilib.org/index.php?title=Main_Page"
license=(MIT)
arch=(i686 x86_64 aarch64)
conflicts=(libqhy-git)
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("17ae94f77171887920f91a78e322de49e55cc24a068e86b1091fa50978d3a127")

prepare() {
  mkdir -p build
  cd indi-3rdparty-${pkgver}
  find ./ -name CMakeLists.txt -exec sed -i -e 's|"\/lib|"${CMAKE_INSTALL_PREFIX}/lib|g' {} \;        # Allow installing outside of /lib
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    ../indi-3rdparty-${pkgver}/libqhy
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
