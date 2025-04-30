# Maintainer: Mattia Procopio (astro.matto) <matto.astro at gmail dot com>
pkgname=indi-3rdparty-libs
pkgver=2.1.3
pkgrel=1
pkgdesc="Indi 3rd party libraries"
arch=(x86_64 aarch64)
url="https://indilib.org"
license=('LGPLv2')
depends=('libindi' 'ffmpeg' 'libgphoto2' 'pipewire-jack' 'wireplumber' 'libftdi')
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bcb7cf2b9053c5b1e052a35247ec499a9d513f4ed257178b244c190394d0daa6')
options=(!lto)

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
