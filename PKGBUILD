pkgname=rpi-imager-latest
pkgver=2.0.3
pkgrel=2
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
sha256sums=('71143495c6a228557f763249de4da3050cf8d0f7eaadde6b5e64819699fb7f45')

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

