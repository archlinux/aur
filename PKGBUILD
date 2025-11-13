# Maintainer: Mattia Procopio (astro.matto) <matto.astro at gmail dot com>
pkgname=indi-3rdparty-drivers
pkgver=2.1.6.2
pkgrel=1
pkgdesc="Indi 3rd party drivers"
arch=(x86_64 aarch64)
url="https://indilib.org"
license=(LGPLv2)
depends=(dfu-util
         fxload
         gpsd
         indi-3rdparty-libs
         libdc1394
         limesuite
         urjtag
         zeromq)
depends_aarch64=(dfu-util
                 fxload
                 gpsd
                 indi-3rdparty-libs
                 libdc1394
                 limesuite
                 pigpio
                 urjtag
                 zeromq)
makedepends=(cmake)
makedepends_aarch64=(cmake libgpiod)
source=(https://github.com/indilib/indi-3rdparty/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(49af8285d996305ee649160473ce3b132144c3a4018b4e01288c32494091f2bd)
options=(!lto)
install=drivers.install

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	-DSKIP_SETCAP=yes \
	-DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
	-DFIRMWARE_INSTALL_DIR=/usr/lib/firmware \
	../indi-3rdparty-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/lib/firmware
  mv "$pkgdir"/lib/firmware/* "$pkgdir"/usr/lib/firmware
  mv "$pkgdir"/lib/udev/rules.d/* "$pkgdir"/usr/lib/udev/rules.d
  rmdir "$pkgdir/lib/udev/rules.d"
  rmdir "$pkgdir/lib/udev"
  rmdir "$pkgdir/lib/firmware"
  rmdir "$pkgdir/lib"
}
