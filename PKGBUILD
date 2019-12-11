# Maintainer: Fraser P. Newton <fpnewton90@gmail.com>

pkgname=moonlight-embedded-git
pkgver=2.4.10.522.ecf09e8
pkgrel=1
pkgdesc="Gamestream client for embedded devices"
arch=('armv6h' 'armv7h' 'x86_64')
url="https://github.com/irtimmer/moonlight-embedded"
license=('GPL')
depends=('curl' 'avahi' 'curl' 'libevdev' 'enet' 'ffmpeg')
makedepends=('libcec')
makedepends_armv7h=('raspberrypi-firmware-tools' 'imx-vpu' 'linux-imx6-headers' 'v4l-utils' 'aml-libs-c1')
makedepends_armv6h=('raspberrypi-firmware-tools')
optdepends=('raspberrypi-firmware-tools: Raspberry Pi support'
            'imx-vpu: i.MX6 support'
            'aml-libs-c1: ODROID-C1 support'
            'libcec: CEC support')
makedepends=('git' 'cmake')
provides=('moonlight')
conflicts=('moonlight')
source=(${pkgname}::git+https://github.com/irtimmer/moonlight-embedded.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|sed 's|\-|.|g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  git submodule update --init
}

build() {
  cd ${pkgname}
  cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="$pkgdir/" install
}
