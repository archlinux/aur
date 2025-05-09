# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hardinfo2
pkgver=2.2.13
pkgrel=1
pkgdesc="System Information and Benchmark for Linux Systems."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://www.hardinfo2.org"
license=('GPL-2.0-or-later AND LGPL-2.1-or-later AND LGPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.1-only')
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
makedepends=(
  'cmake'
  'glslang'
  'shaderc'
  'vulkan-headers'
)
checkdepends=('appstream')
optdepends=(
  'apcupsd: apcaccess is used for UPS/battery information'
  'fwupd: Firmware module'
  'xorg-xrandr: Read monitor setup'
)
provides=('hardinfo')
conflicts=('hardinfo')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/hardinfo2/hardinfo2/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('a3dee51427aa1fe8cb33960cbb5c59471f571060758a1499d1bae022390d7ee0')

build() {
  cmake -B build -S "$pkgname-release-$pkgver" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
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
