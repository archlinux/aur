pkgname=rpi-imager-latest
pkgver=2.0.5
pkgrel=1
pkgdesc="Raspberry Pi Imager – flash images to SD cards and USB drives"
arch=(x86_64 aarch64)
url="https://www.raspberrypi.com/software/"
license=(Apache)
depends=(
  qt6-base
  qt6-svg
  qt6-declarative
  qt6-tools
  libarchive
  curl
  hicolor-icon-theme
)
makedepends=(
  git
  cmake
  qt6-tools
)
provides=('rpi-imager')
conflicts=('rpi-imager-git')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/raspberrypi/rpi-imager/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('7d7e7fbe45de82e8cb113920741b87382162651e0c92d6e3580fdbade9667571')

prepare() {
  # Patch CMakeLists.txt to force the correct version
  cd "$srcdir/rpi-imager-$pkgver/src"
  sed -i "s|0.0.0-unknown|$pkgver|g" CMakeLists.txt
}

build() {
  cmake -B build -S "$srcdir/rpi-imager-$pkgver/src" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_LIBARCHIVE=ON \
    -DUSE_SYSTEM_CURL=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

