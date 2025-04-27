# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hardinfo2
pkgver=2.2.10
pkgrel=1
pkgdesc="System Information and Benchmark for Linux Systems."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://www.hardinfo2.org"
license=('GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.1-or-later')
depends=(
  'dmidecode'
  'gawk'
  'gtk3'
  'iperf3'
  'libsoup3'
  'lm_sensors'
  'mesa-utils'
  'pciutils'
  'qt5-base'
  'sysbench'
  'udisks2'
  'usbutils'
  'vulkan-tools'
  'xdg-utils'
)
makedepends=('cmake')
checkdepends=('appstream')
optdepends=(
  'fwupd: Firmware module'
  'xorg-xrandr: read monitor setup'
)
provides=('hardinfo')
conflicts=('hardinfo')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/hardinfo2/hardinfo2/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('050231efc8a6ff50637872765f31c99367dc43b49f553fa7de93110864515fa9')

build() {
  cmake -B build -S "$pkgname-release-$pkgver" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -Wno-dev
  cmake --build build
}

check() {
  desktop-file-validate "build/$pkgname.desktop"
  appstreamcli validate --no-net "build/org.$pkgname.$pkgname.metainfo.xml"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
