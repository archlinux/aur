# Mostly a copy of linux-firmware PKGBUILD by Thomas Bächler <thomas@archlinux.org>
# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# Contributor: xduugu

pkgbase=linux-firmware-git
pkgname=(linux-firmware-git amd-ucode-git)
pkgver=20190118.a8b75ca
pkgrel=1
pkgdesc="Firmware files for Linux"
makedepends=('git')
arch=('any')
url="http://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary"
license=('GPL2' 'GPL3' 'custom')
options=(!strip)
#branch=master
source=("${pkgbase}::git+https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase}"

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}"
  mkdir -p kernel/x86/microcode
  cat "${pkgbase}/amd-ucode/microcode_amd"*.bin > kernel/x86/microcode/AuthenticAMD.bin
  # Make the .bin reproducible
  [ ! -z $SOURCE_DATE_EPOCH ] && touch -d @$SOURCE_DATE_EPOCH kernel/x86/microcode/AuthenticAMD.bin
  echo kernel/x86/microcode/AuthenticAMD.bin | bsdcpio -o -H newc -R 0:0 > amd-ucode.img
}

package_linux-firmware-git() {
  conflicts=('linux-firmware')
  provides=("linux-firmware=$pkgver")

  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install
  rm "${pkgdir}/usr/lib/firmware/"{Makefile,README,configure,GPL-3}

  install -d "${pkgdir}/usr/share/licenses/linux-firmware"
  install -Dm644 LICEN* WHENCE "${pkgdir}/usr/share/licenses/linux-firmware/"

  # Trigger a microcode reload for configurations not using early updates
  install -d "${pkgdir}/usr/lib/tmpfiles.d"
  echo 'w /sys/devices/system/cpu/microcode/reload - - - - 1' \
    >"${pkgdir}/usr/lib/tmpfiles.d/linux-firmware.conf"
}

package_amd-ucode-git() {
  conflicts=('amd-ucode')
  provides=("amd-ucode=$pkgver")
  pkgdesc='Microcode update files for AMD CPUs'

  cd "${srcdir}"
  install -D -m0644 amd-ucode.img "${pkgdir}/boot/amd-ucode.img"
  install -D -m0644 "${srcdir}/${pkgbase}/LICENSE.amd-ucode" "${pkgdir}/usr/share/licenses/amd-ucode/LICENSE"
}

# vim:set ts=2 sw=2 et:
