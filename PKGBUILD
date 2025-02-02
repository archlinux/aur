# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hardinfo2-git
pkgver=2.2.7.r1.g5d060ca3
pkgrel=1
pkgdesc="System Information and Benchmark for Linux Systems."
arch=('x86_64')
url="https://www.hardinfo2.org"
license=('GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.1-or-later')
depends=(
  'gtk3'
  'libsoup3'
)
makedepends=(
  'cmake'
  'git'
  'qt5-base'
)
checkdepends=('appstream')
optdepends=(
  'dmidecode: Memory Devices / System DMI module'
  'fwupd: Firmware module'
  'gawk: determine System Type'
  'iperf3: Internal Network Speed benchmark'
  'lm_sensors: Sensors module'
  'mesa-utils: GLX info for Display module'
  'pciutils: PCI Devices module'
  'qt5-base: OpenGL benchmark'
  'sysbench: SysBench CPU benchmark'
  'udisks2: Storage module'
  'usbutils: USB Devices module'
  'vulkan-tools: display Vulkan information'
  'xdg-utils: open your browser for bugs, homepage & links'
  'xorg-xrandr: read monitor setup'
)
install="${pkgname%-git}.install"
provides=("${pkgname%-git}" 'hardinfo')
conflicts=("${pkgname%-git}" 'hardinfo')
source=('git+https://github.com/hardinfo2/hardinfo2.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
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
