# Maintainer: Oleg Rakhmanov <oleg@archlinuxarm.org>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Edmunt Pienkowsky <roed@onet.eu>

pkgname=rpi-eeprom-git
pkgver=r157.ad18a5b
pkgrel=1
pkgdesc='Raspberry Pi4 boot EEPROM updater, latest git version'
arch=('armv6h' 'armv7h' 'aarch64')
url='http://github.com/raspberrypi/rpi-eeprom'
license=('custom')
depends=('python')
optdepends=('raspberrypi-firmware' 'raspberrypi-userland-aarch64')
conflicts=('rpi-eeprom')
backup=('etc/default/rpi-eeprom-update')
source=("git+https://github.com/raspberrypi/rpi-eeprom.git")
md5sums=('SKIP')
options=(!strip)

pkgver() {
  cd "${srcdir}/rpi-eeprom"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${srcdir}/rpi-eeprom/firmware/vl805" "${pkgdir}/usr/bin/vl805"
  install -Dm755 "${srcdir}/rpi-eeprom/rpi-eeprom-config" "${pkgdir}/usr/bin/rpi-eeprom-config"
  install -Dm755 "${srcdir}/rpi-eeprom/rpi-eeprom-update" "${pkgdir}/usr/bin/rpi-eeprom-update"
  sed -i 's/#!\/bin\/sh/#!\/bin\/sh\nPATH=\"$PATH:\/opt\/vc\/bin\"\n/g' "${pkgdir}/usr/bin/rpi-eeprom-update"
  install -dm755 "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader"
  cp -a rpi-eeprom/firmware/* "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader"

  install -dm755 "${pkgdir}/etc/default"
  install -Dm644 "${srcdir}/rpi-eeprom/rpi-eeprom-update-default" "${pkgdir}/etc/default/rpi-eeprom-update"
}
