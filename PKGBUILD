# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgver=2.13.04
pkgrel=1
pkgdesc="A generic ZigBee monitoring and control tool"
url="https://www.dresden-elektronik.de"
license=('custom:"Copyright (c) dresden elektronik ingenieurtechnik GmbH"')
groups=()
depends=('hicolor-icon-theme'
         'libcap'
         'libpng'
         'qt5-base'
         'qt5-serialport'
         'qt5-websockets'
         'sqlite')
makedepends=('xz')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=($pkgname-$pkgver-x86_64.deb::https://deconz.dresden-elektronik.de/ubuntu/beta/$pkgname-$pkgver-qt5.deb)
source_armv6h=($pkgname-$pkgver-armv6h.deb::https://deconz.dresden-elektronik.de/raspbian/beta/$pkgname-$pkgver-qt5.deb)
source_armv7h=($pkgname-$pkgver-armv7h.deb::https://deconz.dresden-elektronik.de/raspbian/beta/$pkgname-$pkgver-qt5.deb)
source_aarch64=(${pkgname}_${pkgver}-debian-buster-beta_arm64.deb::https://deconz.dresden-elektronik.de/debian/beta/${pkgname}_${pkgver}-debian-buster-beta_arm64.deb)
sha256sums_x86_64=('2c2ff7d9c9c19d29779f80713a47c95fdc45113f1b12c01706cb447de9a81949')
sha256sums_armv6h=('745f2dec5d175d5465f1e7b55109d0e1750ae4e050b5275f33ae8a9909d15f8c')
sha256sums_armv7h=('745f2dec5d175d5465f1e7b55109d0e1750ae4e050b5275f33ae8a9909d15f8c')
sha256sums_aarch64=('51e65dbf52ae49902ce76fcaa4483c913118b9c9d7220ed48acf9711fd748821')
noextract=()

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  cp -rfv "${pkgdir}/lib" "${pkgdir}/usr"
  rm -rf "${pkgdir}/lib"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"

  # Run services with user deconz
  sed -e "s/User=1000/User=deconz/" -i ${pkgdir}/usr/lib/systemd/system/deconz.service ${pkgdir}/usr/lib/systemd/system/deconz-gui.service
  install -vDm 644 "../69-conbee.rules" "${pkgdir}/etc/udev/rules.d/69-conbee.rules"
  install -vDm 644 "../${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm 644 "../${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
