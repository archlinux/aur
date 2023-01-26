# Maintainer: Evgeniy Dombek <edombek@yandex.ru>

pkgname=libindi-git
pkgver=v1.9.9.58.ge512f2b06
pkgrel=1
pkgdesc='A distributed control protocol designed to operate astronomical instrumentation'
url='https://www.indilib.org/index.php?title=Main_Page'
license=(GPL2)
arch=(x86_64)
depends=(libnova cfitsio libjpeg gsl libtheora fftw libev rtl-sdr)
makedepends=(cmake qt5-base)
provides=('libindi')
conflicts=('libindi')
source=('git+https://github.com/indilib/indi')
sha512sums=('SKIP')
options=("staticlibs")

pkgver() {
  cd "indi"
  git describe --long --tags | sed 's/-/./;s/-/./'
}

build() {
  cmake -B build -S indi \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINDI_BUILD_QT5_CLIENT=ON \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects -Wp,-U_GLIBCXX_ASSERTIONS"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
