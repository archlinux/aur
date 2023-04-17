# Maintainer: Precise <Discord: Precise#1382>

pkgname=rtl-sdr-exp-git
pkgrel=1
pkgver=v2023.2.2.8e13e24
pkgdesc="Turns your Realtek RTL2832 based DVB dongle into a SDR receiver. Experimental R820T/R820T2 rtl-sdr tuner driver that tunes down to 13 MHz or lower. (From my experiments up to 3.4 MHz on R820T2)."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Mr-Precise/rtl-sdr"
license=('GPL2')
depends=('libusb>=1.0')
makedepends=('git' 'cmake' 'make' 'pkgconf')
provides=('rtl-sdr' 'rtl-sdr-git')
conflicts=('rtl-sdr' 'rtl-sdr-git')
options=('staticlibs')
source=('git+https://github.com/Mr-Precise/rtl-sdr.git')

pkgver() {
  cd "${srcdir}/rtl-sdr"
  printf "%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/rtl-sdr"
  mkdir -p build
  cd build
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DDETACH_KERNEL_DRIVER=ON \
    -DENABLE_ZEROCOPY=ON -Wno-dev ../
  make
}

package() {
  cd "${srcdir}/rtl-sdr/build/"
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/rtl-sdr/rtl-sdr.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/10-rtl-sdr.rules"
}

md5sums=('SKIP')
