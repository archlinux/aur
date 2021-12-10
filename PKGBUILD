# Maintainer: robertfoster
# Contributor: Oleg Rakhmanov <oleg@archlinuxarm.org>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Edmunt Pienkowsky <roed@onet.eu>

pkgname=rpi-eeprom-git
pkgver=r436.a4c259a
pkgrel=1
pkgdesc='Raspberry Pi4 boot EEPROM updater, latest git version'
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
provides=('rpi-eeprom')
conflicts=('rpi-eeprom')
backup=('etc/default/rpi-eeprom-update')
source=("git+https://github.com/raspberrypi/rpi-eeprom.git"
        'rpi-eeprom-update.patch')
md5sums=('SKIP'
         '9036901f8345f0e0cbf25f4440529213')
options=(!strip)

pkgver() {
  cd "${srcdir}/rpi-eeprom"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Create and install the binaries in /usr/bin
  install -d -m 755 "${pkgdir}/usr/bin"
  install -D -m 755 rpi-eeprom/rpi-eeprom-config \
    "${pkgdir}/usr/bin/rpi-eeprom-config"

  # Patch /opt/vc/bin into PATH in script due to weird install location of raspberrypi-firmware
  install -D -m 755 rpi-eeprom/rpi-eeprom-update \
    "${pkgdir}/usr/bin/rpi-eeprom-update"
  patch "${pkgdir}/usr/bin/rpi-eeprom-update" \
    "${srcdir}/rpi-eeprom-update.patch"

  # Copy all the firmware and files to the right place
  install -d -m 755 "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader"
  cp -a rpi-eeprom/firmware/* \
    "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader"

  # Copy the override in place
  install -d -m 755 "${pkgdir}/etc/default"
  install -D -m 644 rpi-eeprom/rpi-eeprom-update-default \
    "${pkgdir}/etc/default/rpi-eeprom-update"
}
