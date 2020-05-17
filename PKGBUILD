# Based on linux-firmware by Thomas BÃ¤chler <thomas@archlinux.org>
# Maintainer: Elichai Turkel <elichai.turkel@gmail.com>

pkgname=linux-firmware-iwlwifi-git
pkgrel=1
pkgdesc="iwlwifi firmware files for linux"
makedepends=('git')
arch=('any')
url="git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git"
license=('GPL2' 'GPL3' 'custom')
conflicts=('linux-firmware-git-iwlwifi'
           'linux-firmware-git'
           'linux-firmware'
           'kernel26-firmware'
           'ar9170-fw'
           'iwlwifi-1000-ucode'
           'iwlwifi-3945-ucode'
           'iwlwifi-4965-ucode'
           'iwlwifi-5000-ucode'
           'iwlwifi-5150-ucode'
           'iwlwifi-6000-ucode'
           'rt2870usb-fw'
           'rt2x00-rt61-fw'
           'rt2x00-rt71w-fw'
           'amd-ucode')
pkgver=20191128.4bebf45
provides=("linux-firmware=$pkgver")
options=(!strip)
source=("$pkgname::git+https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git")
sha256sums=('SKIP')

pkgver() {
  # Mimics pkgver from ABS
  cd ${pkgname}
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

check() {
  cd ${pkgname}
  make check
}

package() {
  cd ${pkgname}

  make -j 4 DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/usr/share/licenses/linux-firmware"
  install -Dm644 LICEN* WHENCE "${pkgdir}/usr/share/licenses/linux-firmware/"

  # Trigger a microcode reload for configurations not using early updates
  echo 'w /sys/devices/system/cpu/microcode/reload - - - - 1' |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

}
# vim:set ts=2 sw=2 et:
