# Maintainer: Mattia Procopio (astro.matto) <matto.astro at gmail dot com>
pkgname=indi-3rdparty-drivers
pkgver=2.0.1
pkgrel=1
pkgdesc="Indi 3rd party drivers"
arch=(x86_64 aarch64)
url="https://indilib.org"
license=('LGPLv2')
depends=('indi-3rdparty-libs' 'limesuite' 'libdc1394' 'fxload')
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be98a84ab6166321fe5aa74fca132cd866ae4e6910ef3b97e3502a44c59d277d')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
	-DFIRMWARE_INSTALL_DIR=/usr/lib/firmware \
	../indi-3rdparty-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/lib/firmware

  # Move all firmwares to /usr/lib/firmware
  mv "$pkgdir"/lib/firmware/* "$pkgdir"/usr/lib/firmware

  # Move all devrules to /usr/lib/udev/rules.d/
  mv "$pkgdir"/lib/udev/rules.d/* "$pkgdir"/usr/lib/udev/rules.d

  # Replace all occurences of /lib/firmware with /usr/lib/firmware in all devrules
  sed -e 's|/lib/firmware|/usr/lib/firmware|' -i "$pkgdir"/usr/lib/udev/rules.d/*.rules

  # Remove now all folders where devrules and firmwares were originally stored
  rmdir "$pkgdir/lib/udev/rules.d"
  rmdir "$pkgdir/lib/udev"
  rmdir "$pkgdir/lib/firmware"
  rmdir "$pkgdir/lib"
}
