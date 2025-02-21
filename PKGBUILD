# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hardinfo2-git
pkgver=2.2.7.r17.g06746b67
pkgrel=1
pkgdesc="System Information and Benchmark for Linux Systems."
arch=('x86_64')
url="https://www.hardinfo2.org"
license=('GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.1-or-later')
depends=(
  'dmidecode'
  'gawk'
  'gtk3'
  'libsoup3'
  'lm_sensors'
  'mesa-utils'
  'pciutils'
  'udisks2'
  'usbutils'
  'vulkan-tools'
  'xdg-utils'
  'xorg-xrandr'
)
makedepends=(
  'cmake'
  'git'
  'qt5-base'
)
checkdepends=('appstream')
optdepends=(
  'fwupd: Firmware module'
  'iperf3: Internal Network Speed benchmark'
  'qt5-base: OpenGL benchmark'
  'sysbench: SysBench CPU benchmark'
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
  desktop-file-validate "build/${pkgname%-git}.desktop"
  appstreamcli validate --no-net "build/org.${pkgname%-git}.${pkgname%-git}.metainfo.xml" || :
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
