# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contriburor: Jonathon Fernyhough <jonathon+mx2+dev>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgbase=linux-firmware
pkgname=(linux-firmware-whence linux-firmware amd-ucode
         linux-firmware-{nfp,mellanox,marvell,qcom,liquidio,qlogic,bnx2x}
)
_tag=20250509
#_commit=c979a06518069901e4c43e0019d3a15b435b7e16
pkgver=20250508.788aadc8
pkgrel=2
pkgdesc="Firmware files for Linux"
pkgdesc+=' (without module compression)'
url="https://gitlab.com/kernel-firmware/linux-firmware"
license=(
  GPL-2.0-only
  GPL-2.0-or-later
  GPL-3.0-only
  custom
)
arch=('any')
makedepends=(
  git
  parallel
  python
  rdfind
)
options=(
  !strip
  !debug
)
source=("git+$url.git?signed#tag=${_tag}")
b2sums=('6e606e0b656c8fb177064a71dc7542661141efb2eb4824479f569b2284aac2b14e0afb1bbbf0c1fe6edd442663b4cb971aa537039da17fad34c4dc1c56fae320')
validpgpkeys=('4CDE8575E547BF835FE15807A31B6BD72486CFD6') # Josh Boyer <jwboyer@fedoraproject.org>

_pkgbase="${pkgbase}"
pkgbase+='-uncompressed'
pkgname=("${pkgname[@]/%/-uncompressed}")
pkgname=("${pkgname[@]:1}") # remove whence

_backports=(
)

_reverts=(
  360fd45301707daa3d95be32d84132481b17db46 # revert ath12k: https://bugzilla.kernel.org/show_bug.cgi?id=220108
)

prepare() {
  local pkgbase="${_pkgbase}"
  cd ${pkgbase}

  local _c
  for _c in "${_backports[@]}"; do
    git log --oneline -1 "${_c}"
    git cherry-pick -n "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    git log --oneline -1 "${_c}"
    git revert -n "${_c}"
  done
}

pkgver() {
  local pkgbase="${_pkgbase}"
  cd ${pkgbase}

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

build() {
  mkdir -p kernel/x86/microcode
  local pkgbase="${_pkgbase}"
  cat ${pkgbase}/amd-ucode/microcode_amd*.bin > kernel/x86/microcode/AuthenticAMD.bin

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

package_linux-firmware-whence-uncompressed() {
  pkgdesc+=" - contains the WHENCE license file which documents the vendor license details"

  local pkgbase="${_pkgbase}"
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ${pkgbase}/WHENCE
}

package_linux-firmware-uncompressed() {
  depends=('linux-firmware-whence')
  conflicts=('linux-firmware')
  provides=('linux-firmware')
  local pkgbase="${_pkgbase}"

  cd ${pkgbase}

  ZSTD_CLEVEL=19 make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install #-zst
  make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware dedup

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICEN*

  cd "${pkgdir}"

  # remove arm64 firmware https://bugs.archlinux.org/task/76583
  rm -f usr/lib/firmware/mrvl/prestera/mvsw_prestera_fw_arm64-v4.1.img*

  # split
  _pick amd-ucode usr/lib/firmware/amd-ucode

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

package_amd-ucode-uncompressed() {
  pkgdesc="Microcode update image for AMD CPUs"
  license=(custom)
  conflicts=('amd-ucode')
  provides=('amd-ucode')
  local pkgbase="${_pkgbase}"
  local pkgname="${pkgname%-uncompressed}"

  mv -v $pkgname/* "$pkgdir"

  install -Dt "${pkgdir}/boot" -m644 amd-ucode.img

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ${pkgbase}/LICENSE.amd-ucode
}

package_linux-firmware-nfp-uncompressed() {
  pkgdesc+=" - nfp / Firmware for Netronome Flow Processors"
  depends=('linux-firmware-whence')
  conflicts=('linux-firmware-nfp')
  provides=('linux-firmware-nfp')

  mv -v linux-firmware-nfp/* "${pkgdir}"
}

package_linux-firmware-mellanox-uncompressed() {
  pkgdesc+=" - mellanox / Firmware for Mellanox Spectrum switches"
  depends=('linux-firmware-whence')
  conflicts=('linux-firmware-mellanox')
  provides=('linux-firmware-mellanox')

  mv -v linux-firmware-mellanox/* "${pkgdir}"
}

package_linux-firmware-marvell-uncompressed() {
  pkgdesc+=" - marvell / Firmware for Marvell devices"
  depends=('linux-firmware-whence')
  conflicts=('linux-firmware-marvell')
  provides=('linux-firmware-marvell')

  mv -v linux-firmware-marvell/* "${pkgdir}"
}

package_linux-firmware-qcom-uncompressed() {
  pkgdesc+=" - qcom / Firmware for Qualcomm SoCs"
  depends=('linux-firmware-whence')
  conflicts=('linux-firmware-qcom')
  provides=('linux-firmware-qcom')

  mv -v linux-firmware-qcom/* "${pkgdir}"
}

package_linux-firmware-liquidio-uncompressed() {
  pkgdesc+=" - liquidio / Firmware for Cavium LiquidIO server adapters"
  depends=('linux-firmware-whence')
  conflicts=('linux-firmware-liquidio')
  provides=('linux-firmware-liquidio')

  mv -v linux-firmware-liquidio/* "${pkgdir}"
}

package_linux-firmware-qlogic-uncompressed() {
  pkgdesc+=" - qlogic / Firmware for QLogic devices"
  depends=('linux-firmware-whence')
  conflicts=('linux-firmware-qlogic')
  provides=('linux-firmware-qlogic')

  mv -v linux-firmware-qlogic/* "${pkgdir}"
}

package_linux-firmware-bnx2x-uncompressed() {
  pkgdesc+=" - bnx2x / Firmware for Broadcom NetXtreme II 10Gb ethernet adapters"
  depends=('linux-firmware-whence')
  conflicts=('linux-firmware-bnx2x')
  provides=('linux-firmware-bnx2x')

  mv -v linux-firmware-bnx2x/* "${pkgdir}"
}
