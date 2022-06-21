# Maintainer: Jonathon Fernyhough <jonathon+mx2+dev>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_pkgbase=linux-firmware
pkgbase=linux-firmware-uncompressed
pkgname=(linux-firmware-uncompressed amd-ucode-uncompressed
         linux-firmware-{nfp,mellanox,marvell,qcom,liquidio,qlogic,bnx2x}-uncompressed
)
_tag=20220610
pkgver=20220610.7b71b75
pkgrel=1
pkgdesc="Firmware files for Linux (without module compression)"
url="https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary"
license=('GPL2' 'GPL3' 'custom')
arch=('any')
makedepends=('git')
options=(!strip)
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git#tag=${_tag}?signed"
         0001-Add-support-for-compressing-firmware-in-copy-firmware.patch)
sha256sums=('SKIP'
            'aa11b2eed9c0be42571b45eb7153908a43290f02a5fc715aefcaa81030a1832f')
validpgpkeys=('4CDE8575E547BF835FE15807A31B6BD72486CFD6') # Josh Boyer <jwboyer@fedoraproject.org>

_backports=(
)

prepare() {
  cd ${_pkgbase}

  local _c
  for _c in "${_backports[@]}"; do
    git log --oneline -1 "${_c}"
    git cherry-pick -n "${_c}"
  done

  # add firmware compression support - patch taken from Fedora
  patch -Np1 -i ../0001-Add-support-for-compressing-firmware-in-copy-firmware.patch
}

pkgver() {
  cd ${_pkgbase}

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

build() {
  mkdir -p kernel/x86/microcode
  cat ${_pkgbase}/amd-ucode/microcode_amd*.bin > kernel/x86/microcode/AuthenticAMD.bin

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

#package_linux-firmware-whence() {
#  pkgdesc+=" - contains the WHENCE license file which documents the vendor license details"
#
#  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ${_pkgbase}/WHENCE
#}

package_linux-firmware-uncompressed() {
  depends=('linux-firmware-whence')
  conflicts=('linux-firmware')
  provides=('linux-firmware')
  
  cd ${_pkgbase}

  make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install

  # Trigger a microcode reload for configurations not using early updates
  echo 'w /sys/devices/system/cpu/microcode/reload - - - - 1' |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICEN*

  # split
  cd "$pkgdir"
  _pick linux-firmware-nfp usr/lib/firmware/netronome
  _pick linux-firmware-nfp usr/share/licenses/${pkgname}/LICENCE.Netronome

  _pick linux-firmware-mellanox usr/lib/firmware/mellanox

  _pick linux-firmware-marvell usr/lib/firmware/{libertas,mwl8k,mwlwifi,mrvl}
  _pick linux-firmware-marvell usr/share/licenses/${pkgname}/LICENCE.{Marvell,NXP}

  _pick linux-firmware-qcom usr/lib/firmware/{qcom,a300_*}
  _pick linux-firmware-qcom usr/share/licenses/${pkgname}/LICENSE.qcom

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

  install -Dt "${pkgdir}/boot" -m644 amd-ucode.img

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ${_pkgbase}/LICENSE.amd-ucode
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

# vim:set sw=2 et:
