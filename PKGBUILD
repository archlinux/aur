# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Edmunt Pienkowsky <roed@onet.eu>

pkgname=rpi-eeprom
pkgver=2020.04.16
_pkghash=137ad
pkgrel=1
pkgdesc='Raspberry Pi4 boot EEPROM updater'
arch=('any')
url='http://github.com/raspberrypi/rpi-eeprom'
license=('custom')
depends=(
  'python'
)
optdepends=(
  'raspberrypi-firmware: Use this on an armv7h (32bit) system.'
  'raspberrypi-userland-aarch64: Use this on an aarch64 (64bit) system.'
)

backup=('etc/default/rpi-eeprom-update')
source=("rpi-eeprom-${pkgver}-${_pkghash}.tar.gz::https://github.com/raspberrypi/rpi-eeprom/archive/v${pkgver}-${_pkghash}.tar.gz"
        'rpi-eeprom-update.patch')
sha256sums=('e1b89463ee72e404a7985e0456c4001c1e4355194485a4141c6e1bdd04c90a3c'
            'd716ef30c4a486019a4778579305a84c0f31593d5840850aefa9742dc6f9760f')
options=(!strip)

package() {
  # Create and install the binaries in /usr/bin
  install -d -m 755 "${pkgdir}/usr/bin"
  install -D -m 755 rpi-eeprom-${pkgver}-${_pkghash}/firmware/vl805 "${pkgdir}/usr/bin/vl805"
  install -D -m 755 rpi-eeprom-${pkgver}-${_pkghash}/rpi-eeprom-config "${pkgdir}/usr/bin/rpi-eeprom-config"

  # Patch /opt/vc/bin into PATH in script due to weird install location of raspberrypi-firmware
  install -D -m 755 rpi-eeprom-${pkgver}-${_pkghash}/rpi-eeprom-update "${pkgdir}/usr/bin/rpi-eeprom-update"
  patch "${pkgdir}/usr/bin/rpi-eeprom-update" "${srcdir}/rpi-eeprom-update.patch"

  # Copy all the firmware and files to the right place
  install -d -m 755 "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader"
  cp -a rpi-eeprom-${pkgver}-${_pkghash}/firmware/* "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader"

  # Copy the override in place
  install -d -m 755 "${pkgdir}/etc/default"
  install -D -m 644 rpi-eeprom-${pkgver}-${_pkghash}/rpi-eeprom-update-default "${pkgdir}/etc/default/rpi-eeprom-update"
}
