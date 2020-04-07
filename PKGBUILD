# Mostly a copy of linux-firmware PKGBUILD by Thomas Bächler <thomas@archlinux.org>
# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# Contributor: xduugu

pkgbase=linux-firmware-git
pkgname=(linux-firmware-git amd-ucode-git)
pkgver=20200320.edf390c
pkgrel=1
pkgdesc="Firmware files for Linux"
makedepends=('git')
arch=('any')
url="https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary"
license=('GPL2' 'GPL3' 'custom')
options=(!strip)
#branch=master
source=("${pkgbase}::git+https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git?signed")
sha256sums=('SKIP')
validpgpkeys=('4CDE8575E547BF835FE15807A31B6BD72486CFD6') # Josh Boyer <jwboyer@fedoraproject.org>

pkgver() {
  cd "${srcdir}/${pkgbase}"

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}"
  mkdir -p kernel/x86/microcode
  cat "${pkgbase}/amd-ucode/microcode_amd"*.bin > kernel/x86/microcode/AuthenticAMD.bin

  # Reproducibility: set the timestamp on the bin file
  if [[ -n $SOURCE_DATE_EPOCH ]]; then
    touch -d @$SOURCE_DATE_EPOCH kernel/x86/microcode/AuthenticAMD.bin
  fi

  # Reproducibility: strip the inode and device numbers from the cpio archive
  echo kernel/x86/microcode/AuthenticAMD.bin |
    bsdtar --uid 0 --gid 0 -cnf - -T - |
    bsdtar --null -cf - --format=newc @- > amd-ucode.img
}

package_linux-firmware-git() {
  conflicts=('linux-firmware')
  provides=("linux-firmware=$pkgver")

  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install

  install -Dt "${pkgdir}/usr/share/licenses/linux-firmware" -m644 LICEN* WHENCE

  # Trigger a microcode reload for configurations not using early updates
  echo 'w /sys/devices/system/cpu/microcode/reload - - - - 1' |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/linux-firmware.conf"
}

package_amd-ucode-git() {
  conflicts=('amd-ucode')
  provides=("amd-ucode=$pkgver")
  pkgdesc='Microcode update files for AMD CPUs'

  install -Dt "${pkgdir}/boot" -m644 "${srcdir}/amd-ucode.img"
  install -Dm644 "${srcdir}/${pkgbase}/LICENSE.amd-ucode" "${pkgdir}/usr/share/licenses/amd-ucode/LICENSE"
}

# vim:set ts=2 sw=2 et:
