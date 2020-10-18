# Maintainer: aig <aigmx@posteo.de>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Christoph Hoopmann <choopm at 0pointer.org>
# Contributor: Pascal E. <archlinux at hardfalcon dot net>
# Contributor: Andrej Gelenberg <andrej.gelenberg at udo dot edu>

# This package is derived from the official libnfc package and adds compilation with
# NXP pn71xx driver support provided by libnfc-nci from https://github.com/NXPNFCLinux/linux_libnfc-nci

pkgname=libnfc-pn71xx
pkgver=1.8.0
pkgrel=1
pkgdesc="Platform independent Near Field Communication (NFC) library. With NXP pn71xx support."
arch=(x86_64)
url="http://nfc-tools.org/"
license=(LGPL3)
depends=(glibc gcc-libs systemd-libs openssl libusb libusb-compat pcsclite libnfc-nci)
makedepends=()
provides=('libnfc=1.8.0')
conflicts=('libnfc')
optdepends=('acsccid: acr122_pcsc support')
source=(https://github.com/nfc-tools/libnfc/releases/download/libnfc-${pkgver}/libnfc-${pkgver}.tar.bz2)
sha256sums=('6d9ad31c86408711f0a60f05b1933101c7497683c2e0d8917d1611a3feba3dd5')

prepare() {
  # Use uaccess
  sed -i "s|MODE=\"0664\", GROUP=\"plugdev\"|TAG+=\"uaccess\"|g" libnfc-${pkgver}/contrib/udev/93-pn53x.rules
  mv libnfc-${pkgver}/contrib/udev/{93,70}-pn53x.rules
}

build() {
  cd libnfc-${pkgver}
  ./configure --prefix=/usr --with-drivers=acr122_pcsc,acr122_usb,acr122s,arygon,pcsc,pn532_i2c,pn532_spi,pn532_uart,pn53x_usb,pn71xx
  make
}

package() {
  cd libnfc-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 libnfc.conf.sample -t "${pkgdir}"/etc/nfc/
  install -Dm644 contrib/udev/70-pn53x.rules -t "${pkgdir}"/usr/lib/udev/rules.d/
  install -Dm644 contrib/linux/blacklist-libnfc.conf -t "${pkgdir}"/usr/lib/modprobe.d/
}
