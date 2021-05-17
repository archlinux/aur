# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgver=2.11.05
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
source_x86_64=($pkgname-$pkgver-x86_64.deb::https://deconz.dresden-elektronik.de/ubuntu/stable/$pkgname-$pkgver-qt5.deb)
source_armv6h=($pkgname-$pkgver-armv6h.deb::https://deconz.dresden-elektronik.de/raspbian/stable/$pkgname-$pkgver-qt5.deb)
source_armv7h=($pkgname-$pkgver-armv7h.deb::https://deconz.dresden-elektronik.de/raspbian/stable/$pkgname-$pkgver-qt5.deb)
source_aarch64=(${pkgname}_${pkgver}-debian-stretch-stable_arm64.deb::https://deconz.dresden-elektronik.de/debian/stable/${pkgname}_${pkgver}-debian-stretch-stable_arm64.deb)
sha256sums_x86_64=('4cc669ed5a9ebc40f4cc91d2920a87df43d90733624cfb12295a82ed35bceecc')
sha256sums_armv6h=('fd678687b25d185a58c30a54d3f70654c5f87bc09630c05b44a45415e7710406')
sha256sums_armv7h=('fd678687b25d185a58c30a54d3f70654c5f87bc09630c05b44a45415e7710406')
sha256sums_aarch64=('93409114b6ddcde3a0993c2dd37ff64814f9cc87145fe76d39b06e2a0c601445')
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
