# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hardinfo2-git
pkgver=2.2.13.r34.g02e537d
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
  'git'
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
install="${pkgname%-git}.install"
provides=("${pkgname%-git}" 'hardinfo')
conflicts=("${pkgname%-git}" 'hardinfo')
source=('git+https://github.com/hardinfo2/hardinfo2.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -Wno-dev
  cmake --build build
}

check() {
  desktop-file-validate "build/${pkgname%-git}.desktop"
  appstreamcli validate --no-net "build/org.${pkgname%-git}.${pkgname%-git}.metainfo.xml"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
