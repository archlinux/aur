# Maintainer: Mattia Procopio (astro.matto) <matto.astro at gmail dot com>
pkgname=indi-3rdparty-libs
pkgver=2.0.7
pkgrel=1
pkgdesc="Indi 3rd party libraries"
arch=(x86_64 aarch64)
url="https://indilib.org"
license=('LGPLv2')
depends=('libindi' 'ffmpeg' 'libgphoto2' 'pipewire-jack' 'wireplumber')
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fba99ea51d0573df37ed614b9300103976601216f29ac83e18fcf0e42221a5d6')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
        -DFIRMWARE_INSTALL_DIR=/usr/lib/firmware \
        -DQHY_FIRMWARE_INSTALL_DIR=/usr/lib/firmware \
        -DBUILD_LIBS=1 \
        ../indi-3rdparty-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  sed -e 's|/lib/firmware|/usr/lib/firmware|' -i "$pkgdir"/usr/lib/udev/rules.d/*.rules
  sed -e 's|/usr/lib/firmware/qhy|/usr/lib/firmware|' -i "$pkgdir"/usr/lib/udev/rules.d/85-qhyccd.rules
  sed -e 's|-D $env{DEVNAME}|-p $env{BUSNUM},$env{DEVNUM}|' -i "$pkgdir"/usr/lib/udev/rules.d/85-qhyccd.rules
}
