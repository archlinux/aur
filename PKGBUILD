# Maintainer: Michael Duell <michael.duell@rub.de> PGP-Key: 5566FF77 Fingerprint FF8C D50E 66E9 5491 F30C  B75E F32C 939C 5566 FF77

pkgname=rtl-sdr-git
pkgrel=1
pkgver=v0.5.3.r12.ge3c03f7
epoch=1
pkgdesc="Tuner for DVB-T sticks based on the Realtek RTL2832U, which can be used as a cheap SDR, since the chip allows transferring the raw I/Q samples to the host."
arch=('i686' 'x86_64')
url="http://sdr.osmocom.org/trac/wiki/rtl-sdr"
license=('GPL')
depends=('libusb>=1.0')
makedepends=('git' 'cmake')
provides=('rtl-sdr')
source=('rtl-sdr::git://git.osmocom.org/rtl-sdr.git')
sha384sums=('SKIP')

pkgver() {
  cd "${srcdir}/rtl-sdr"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/rtl-sdr"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DDETACH_KERNEL_DRIVER=ON -Wno-dev ../
  make
}

package() {
  cd "${srcdir}/rtl-sdr/build/"
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/rtl-sdr/rtl-sdr.rules" "${pkgdir}/usr/lib/udev/rules.d/10-rtl-sdr.rules"
}

# vim:set ts=2 sw=2 et:
