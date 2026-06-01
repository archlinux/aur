# Maintainer: Mattia Procopio (astro.matto) <matto.astro at gmail dot com>
pkgname=indi-3rdparty-libs
pkgver=2.2.2
pkgrel=1
pkgdesc='Indi 3rd party libraries'
arch=(x86_64 aarch64)
url='https://indilib.org'
license=(LGPLv2)
depends=(ffmpeg
         libgphoto2
         libindi
         pipewire-jack
         wireplumber)
makedepends=(cmake)
source=(${pkgname}-${pkgver}::https://github.com/indilib/indi-3rdparty/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('ea4e90f3549cb28860d0d2a5820734579d4aa5b8c04ba202bc413ce5ffdb0377')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DBUILD_LIBS=1 \
	-DQHY_FIRMWARE_INSTALL_DIR=/usr/lib/firmware/qhy \
        ../indi-3rdparty-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  sed -e 's|-D $env{DEVNAME}|-p $env{BUSNUM},$env{DEVNUM}|' -i "$pkgdir"/usr/lib/udev/rules.d/85-qhyccd.rules
  sed -e 's|/qhy/qhy|/qhy|' -i "$pkgdir"/usr/lib/udev/rules.d/85-qhyccd.rules
}
