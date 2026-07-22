# Maintainer: darkwater <darkwater124 at gmail>
# essentially a copy of rpi-imager-git with an extra `sed` in build()

pkgname=rpi-imager-git-non-root
pkgver=2.0.11.rc1
pkgrel=1
pkgdesc="Raspberry Pi imaging utility - patched to not require root privileges"
arch=('i686' 'x86_64')
url="https://github.com/raspberrypi/rpi-imager"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++' 'curl' 'gnutls' 'hicolor-icon-theme' 'libarchive' 'qt6-base' 'qt6-declarative' 'qt6-svg' 'xz')
makedepends=('git' 'cmake' 'nettle3' 'qt6-tools' 'sed')
optdepends=('dosfstools: SD card bootloader support'
            'udisks2: Needed if you want to be able to run rpi-imager as a regular user')
provides=("rpi-imager=$pkgver")
conflicts=('rpi-imager')
source=("git+https://github.com/raspberrypi/rpi-imager.git")
sha256sums=('SKIP')


pkgver() {
  cd "rpi-imager"

  git describe --tags --abbrev=8 | sed 's/^v//; s/-/./g'
}

build() {
  cd "rpi-imager"

  sed -r -i 's/return .*gete?uid.*== 0/return true/' src/linux/platformquirks_linux.cpp

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_CHECK_VERSION=OFF \
    -DNETTLE_INCLUDE_DIR="/usr/include/nettle3" \
    -DNETTLE_LIBRARY="/usr/lib/nettle3" \
    src
  cmake --build "_build"
}

package() {
  cd "rpi-imager"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "doc/man/rpi-imager.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "debian/changelog" -t "$pkgdir/usr/share/doc/rpi-imager"
  install -Dm644 "license.txt" -t "$pkgdir/usr/share/licenses/rpi-imager"
}
