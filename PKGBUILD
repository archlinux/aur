# Based on linux-firmware by Thomas BÃ¤chler <thomas@archlinux.org>
# Maintainer: Matthew Pallissard <matthew.paul@pallissard.net>

pkgname=linux-firmware-git-iwlwifi
pkgrel=4
pkgdesc="Emmanuel Grumbach's fork of linux-firmware.git"
makedepends=('git')
arch=('any')
url="git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git"
license=('GPL2' 'GPL3' 'custom')
conflicts=('linux-firmware-git'
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
pkgver=20160425.75cc3ef
provides=("linux-firmware=$pkgver")
options=(!strip)
source=("$pkgname::git+https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git")
md5sums=('SKIP')

pkgver() {
  # Mimics pkgver from ABS
  cd "${srcdir}/${pkgname}"
  echo $(date -d "$(git show --format='%cD' -q master)" '+%Y%m%d').$(git rev-parse --short master)
}

package() {
  cd "${srcdir}/${pkgname}"

  make -j 4 DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install
  rm "${pkgdir}/usr/lib/firmware/"{Makefile,README,configure,GPL-3}

  install -d "${pkgdir}/usr/share/licenses/linux-firmware"
  install -Dm644 LICEN* WHENCE "${pkgdir}/usr/share/licenses/linux-firmware/"

  # Trigger a microcode reload for configurations not using early updates
  install -d "${pkgdir}/usr/lib/tmpfiles.d"
  echo 'w /sys/devices/system/cpu/microcode/reload - - - - 1' \
    >"${pkgdir}/usr/lib/tmpfiles.d/linux-firmware.conf"
}
# vim:set ts=2 sw=2 et:
