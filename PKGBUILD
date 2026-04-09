pkgname=rpi-imager-latest
pkgver=2.0.8
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
sha256sums=('e85c45008d5b1f12684532450159f74713545cfd6663b0d229d319b09878f7b0')

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

