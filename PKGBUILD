# Maintainer: Mattia Procopio (astro.matto) <matto.astro at gmail dot com>
pkgname=indi-3rdparty-libs
pkgver=2.2.0
pkgrel=1
pkgdesc="Indi 3rd party libraries"
arch=(x86_64 aarch64)
url="https://indilib.org"
license=(LGPLv2)
depends=(ffmpeg
         libftdi
         libgphoto2
         libindi
         pipewire-jack
         wireplumber)
makedepends=(cmake)
source=(https://github.com/indilib/indi-3rdparty/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('2f5f329326bf6e468e6313724679e2934314dcee234715cbc5cac39279142f04')
options=(!lto)

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
        -DQHY_FIRMWARE_INSTALL_DIR=/usr/lib/firmware \
        -DBUILD_LIBS=1 \
        ../indi-3rdparty-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  sed -e 's|-D $env{DEVNAME}|-p $env{BUSNUM},$env{DEVNUM}|' -i "$pkgdir"/usr/lib/udev/rules.d/85-qhyccd.rules
}
