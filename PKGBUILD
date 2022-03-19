# Maintainer: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Contributor: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libqhy
pkgver=1.9.5
pkgrel=2
pkgdesc="libqhy used by INDI QHY drivers. Please note that for sake of simplicity package version follows libindi versionning."
url="http://www.indilib.org/index.php?title=Main_Page"
license=(MIT)
arch=(i686 x86_64)
conflicts=(libqhy-git)
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("a4a7db8ff9998ffe0688eab6657e132b82a64b3f7a3b5cc7309b9c900edbd0df")

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
