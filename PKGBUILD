# Maintainer: TheDcoder <TheDcoder@protonmail.com>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_pkgupstream=linux-firmware
pkgbase=linux-firmware-xz
pkgname=(linux-firmware-whence-xz linux-firmware-xz amd-ucode-xz
         linux-firmware-{nfp,mellanox,marvell,qcom,liquidio,qlogic,bnx2x}-xz
)
_tag=20230625
pkgver=20230625.ee91452d
pkgrel=4
pkgdesc="Firmware files for Linux"
url="https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary"
license=('GPL2' 'GPL3' 'custom')
arch=('any')
makedepends=('git')
options=(!strip)
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git#tag=${_tag}?signed")
sha256sums=('SKIP')
validpgpkeys=('4CDE8575E547BF835FE15807A31B6BD72486CFD6') # Josh Boyer <jwboyer@fedoraproject.org>

_backports=(
  d3f66064cf43bd7338a79174bd0ff60c4ecbdf6d
)

prepare() {
  cd ${_pkgupstream}

  local _c
  for _c in "${_backports[@]}"; do
    git log --oneline -1 "${_c}"
    git cherry-pick -n "${_c}"
  done
}

pkgver() {
  cd ${_pkgupstream}

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

build() {
  mkdir -p kernel/x86/microcode
  cat ${_pkgupstream}/amd-ucode/microcode_amd*.bin > kernel/x86/microcode/AuthenticAMD.bin

  # Reproducibility: set the timestamp on the bin file
  if [[ -n ${SOURCE_DATE_EPOCH} ]]; then
    touch -d @${SOURCE_DATE_EPOCH} kernel/x86/microcode/AuthenticAMD.bin
  fi

  # Reproducibility: strip the inode and device numbers from the cpio archive
  echo kernel/x86/microcode/AuthenticAMD.bin |
    bsdtar --uid 0 --gid 0 -cnf - -T - |
    bsdtar --null -cf - --format=newc @- > amd-ucode.img
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_linux-firmware-whence-xz() {
  pkgdesc+=" - contains the WHENCE license file which documents the vendor license details"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ${_pkgupstream}/WHENCE
}

package_linux-firmware-xz() {
  depends=('linux-firmware-whence-xz')
  provides=('linux-firmware')

  cd ${_pkgupstream}

  make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install-xz

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICEN*

  cd "${pkgdir}"

  # remove amd firmware since the files conflict with $_pkgupstream
  rm -rf usr/lib/firmware/amd-ucode

  # remove arm64 firmware https://bugs.archlinux.org/task/76583
  rm usr/lib/firmware/mrvl/prestera/mvsw_prestera_fw_arm64-v4.1.img.xz

  # split
  _pick linux-firmware-nfp usr/lib/firmware/netronome
  _pick linux-firmware-nfp usr/share/licenses/${pkgname}/LICENCE.Netronome

  _pick linux-firmware-mellanox usr/lib/firmware/mellanox

  _pick linux-firmware-marvell usr/lib/firmware/{libertas,mwl8k,mwlwifi,mrvl}
  _pick linux-firmware-marvell usr/share/licenses/${pkgname}/LICENCE.{Marvell,NXP}

  _pick linux-firmware-qcom usr/lib/firmware/{qcom,a300_*}
  _pick linux-firmware-qcom usr/share/licenses/${pkgname}/LICENSE.qcom*

  _pick linux-firmware-liquidio usr/lib/firmware/liquidio
  _pick linux-firmware-liquidio usr/share/licenses/${pkgname}/LICENCE.cavium_liquidio

  _pick linux-firmware-qlogic usr/lib/firmware/{qlogic,qed,ql2???_*,c{b,t,t2}fw-*}
  _pick linux-firmware-qlogic usr/share/licenses/${pkgname}/LICENCE.{qla1280,qla2xxx}

  _pick linux-firmware-bnx2x usr/lib/firmware/bnx2x*
}

package_amd-ucode-xz() {
  pkgdesc="Microcode update image for AMD CPUs"
  license=(custom)
  provides=('amd-ucode')

  install -Dt "${pkgdir}/boot" -m644 amd-ucode.img

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ${_pkgupstream}/LICENSE.amd-ucode
}

package_linux-firmware-nfp-xz() {
  pkgdesc+=" - nfp / Firmware for Netronome Flow Processors"
  depends=('linux-firmware-whence-xz')
  provides=('linux-firmware-nfp')

  mv -v linux-firmware-nfp/* "${pkgdir}"
}

package_linux-firmware-mellanox-xz() {
  pkgdesc+=" - mellanox / Firmware for Mellanox Spectrum switches"
  depends=('linux-firmware-whence-xz')
  provides=('linux-firmware-mellanox')

  mv -v linux-firmware-mellanox/* "${pkgdir}"
}

package_linux-firmware-marvell-xz() {
  pkgdesc+=" - marvell / Firmware for Marvell devices"
  depends=('linux-firmware-whence-xz')
  provides=('linux-firmware-marvell')

  mv -v linux-firmware-marvell/* "${pkgdir}"
}

package_linux-firmware-qcom-xz() {
  pkgdesc+=" - qcom / Firmware for Qualcomm SoCs"
  depends=('linux-firmware-whence-xz')
  provides=('linux-firmware-qcom')

  mv -v linux-firmware-qcom/* "${pkgdir}"
}

package_linux-firmware-liquidio-xz() {
  pkgdesc+=" - liquidio / Firmware for Cavium LiquidIO server adapters"
  depends=('linux-firmware-whence-xz')
  provides=('linux-firmware-liquidio')

  mv -v linux-firmware-liquidio/* "${pkgdir}"
}

package_linux-firmware-qlogic-xz() {
  pkgdesc+=" - qlogic / Firmware for QLogic devices"
  depends=('linux-firmware-whence-xz')
  provides=('linux-firmware-qlogic')

  mv -v linux-firmware-qlogic/* "${pkgdir}"
}

package_linux-firmware-bnx2x-xz() {
  pkgdesc+=" - bnx2x / Firmware for Broadcom NetXtreme II 10Gb ethernet adapters"
  depends=('linux-firmware-whence-xz')
  provides=('linux-firmware-bnx2x')

  mv -v linux-firmware-bnx2x/* "${pkgdir}"
}

# vim:set sw=2 et:
