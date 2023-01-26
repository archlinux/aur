# Maintainer: Evgeniy Dombek <edombek@yandex.ru>

partyname=gphoto
_partyname=GPHOTO
pkgname=libindi-$partyname-git
pkgver=v1.9.9.36.gf0e823d7
pkgrel=1
pkgdesc="3rd party drivers for INDI, support for DSLR camers using gphoto"
url="http://www.indilib.org/index.php"
license=(GPL3)
arch=(x86_64)
depends=(libindi libgphoto2)
makedepends=(cmake)
provides=(libindi-$partyname)
conflicts=(libindi-$partyname)

source=('git+https://github.com/indilib/indi-3rdparty')
sha512sums=('SKIP')
options=("staticlibs")

pkgver() {
  cd "indi-3rdparty"
  git describe --long --tags | sed 's/-/./;s/-/./'
}

prepare() {
  #set all to off by default
  sed -i -e '/option(WITH_.*On)$/s/ On)$/ Off)/' indi-3rdparty/CMakeLists.txt
}

build() {
  cmake -B build -S indi-3rdparty \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_$_partyname=On \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects -Wp,-U_GLIBCXX_ASSERTIONS"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
