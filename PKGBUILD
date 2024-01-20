# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Eric Bélanger <eric at archlinux dot org>
pkgname=hardinfo-git
pkgver=0.6.alpha.1413.gb3c1f91
pkgrel=1
pkgdesc="A system information and benchmark tool."
arch=('x86_64')
url="https://github.com/lpereira/hardinfo"
license=('GPL-2.0-or-later')
depends=('gtk3' 'libsoup')
makedepends=('cmake' 'git')
optdepends=('dmidecode: Memory Devices module'
            'fwupd: Firmware module'
            'lm_sensors: Sensors module'
            'pciutils: PCI Devices module'
            'sysbench: SysBench CPU benchmark'
            'usbutils: USB Devices module')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lpereira/hardinfo.git'
        'benchmark.patch')
sha256sums=('SKIP'
            '5a352377abce848dbb20b5e35d86feba9b62011d1a7cd075c0d14d54e91f3286')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^release-//;s/^0.5-/0.6-alpha-/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # https://github.com/lpereira/hardinfo/issues/640
  # https://github.com/lpereira/hardinfo/pull/646
  patch -Np1 -i ../benchmark.patch
}

build() {
  cmake -B build -S "${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE='Debug' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DHARDINFO_GTK3='ON' \
    -DHARDINFO_DEBUG='$(usex debug 1 0)' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
