# Maintainer: robertfoster
# Contributor: Oleg Rakhmanov <oleg@archlinuxarm.org>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Edmunt Pienkowsky <roed@onet.eu>

pkgname=rpi-eeprom-git
pkgver=r603.72cedfe
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
sha256sums=('SKIP'
            'd716ef30c4a486019a4778579305a84c0f31593d5840850aefa9742dc6f9760f')
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
  install -d -m 755 "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader-2711"
  cp -a rpi-eeprom/firmware-2711/* \
    "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader-2711"

  install -d -m 755 "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader-2712"
  cp -a rpi-eeprom/firmware-2712/* \
    "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader-2712"

  # Copy the override in place
  install -d -m 755 "${pkgdir}/etc/default"
  install -D -m 644 rpi-eeprom/rpi-eeprom-update-default \
    "${pkgdir}/etc/default/rpi-eeprom-update"
}
