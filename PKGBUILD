# Maintainer: Mattia Procopio (astro.matto) <matto.astro at gmail dot com>
pkgname=indi-3rdparty-libs
pkgver=2.2.1.1
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
source=(https://github.com/indilib/indi-3rdparty/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('b336df05a4e4313b02264e6cd59ecc78f0b37ac68eb895ffb617ae553a7db12a')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DBUILD_LIBS=1 \
        ../indi-3rdparty-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  sed -e 's|-D $env{DEVNAME}|-p $env{BUSNUM},$env{DEVNUM}|' -i "$pkgdir"/usr/lib/udev/rules.d/85-qhyccd.rules
}
