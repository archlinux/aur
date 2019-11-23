# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Edmunt Pienkowsky <roed@onet.eu>

pkgname=rpi-eeprom
pkgver=r84.9a447ae
pkgrel=1
pkgdesc='Raspberry Pi4 boot EEPROM updater'
arch=('any')
url='http://github.com/raspberrypi/rpi-eeprom'
license=('custom')
depends=('raspberrypi-firmware' 'binutils' 'sed' 'grep')
optdepends=('flashrom')
backup=('etc/default/rpi-eeprom-update')
source=('rpi-eeprom::git+https://github.com/raspberrypi/rpi-eeprom.git'
        'rpi-eeprom-update.patch')
sha256sums=('SKIP'
            'd716ef30c4a486019a4778579305a84c0f31593d5840850aefa9742dc6f9760f')
options=(!strip)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d -m 755 "${pkgdir}/usr/bin"
  install -D -m 755 rpi-eeprom/firmware/vl805 "${pkgdir}/usr/bin/vl805"
  install -D -m 755 rpi-eeprom/rpi-eeprom-config "${pkgdir}/usr/bin/rpi-eeprom-config"

  install -D -m 755 rpi-eeprom/rpi-eeprom-update "${pkgdir}/usr/bin/rpi-eeprom-update"
  patch "${pkgdir}/usr/bin/rpi-eeprom-update" "${srcdir}/rpi-eeprom-update.patch"

  install -d -m 755 "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader"
  cp -a rpi-eeprom/firmware/* "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader"

  install -d -m 755 "${pkgdir}/etc/default"
  install -D -m 644 rpi-eeprom/rpi-eeprom-update-default "${pkgdir}/etc/default/rpi-eeprom-update"
}
