# Mostly a copy of linux-firmware PKGBUILD by Thomas Bächler <thomas@archlinux.org>
# And linux-firmware-git PKGBUILD by Victor Dmitriev <mrvvitek@gmail.com> with contributions from xduugu
# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgbase=linux-firmware-amd-staging-um5606-git
pkgname=(linux-firmware-whence-amd-staging-um5606-git linux-firmware-amd-staging-um5606-git amd-ucode-amd-staging-um5606-git
  linux-firmware-{nfp,mellanox,marvell,qcom,liquidio,qlogic,bnx2x}-amd-staging-um5606-git
)
epoch=1
pkgver=20240913.a34e7a5f
pkgrel=1
pkgdesc="A package that combines the latest AMD staging Linux firmware targeting the new Ryzen AI laptops, including the latest ipu (NPU) firmware."
url="https://gitlab.com/kernel-firmware/linux-firmware"
license=('GPL2' 'GPL3' 'custom')
arch=('any')
makedepends=('git' 'rdfind')
optdepends=('linux-mainline-um5606: kernel with ipu (NPU) drivers for the HX 365/370')
options=(!strip)
#source=("${pkgbase}::git+${url}.git?signed")
# NOTE: upstream doesn't sign most commits anymore, but still signs all tags.
# Packages in the official repos package tags.
# You can check signatures with the following commands:
#git log --format=raw --show-signature main
#git tag -v $(git tag)
source=(
  "${pkgbase}::git+${url}.git"
  "https://raw.githubusercontent.com/ThatOneCalculator/linux-firmware-amd-ipu-staging-patch/main/amd-ipu-staging.patch"
)
sha256sums=('SKIP'
            'fcada970801979a87a3f974a07fca18345ae9cc8a7b0e9cfe82eb00a80df6bb0')
validpgpkeys=('4CDE8575E547BF835FE15807A31B6BD72486CFD6') # Josh Boyer <jwboyer@fedoraproject.org>

pkgver() {
  cd ${pkgbase}

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd ${pkgbase}
	echo "Applying patch..."
	git apply -3 --whitespace=nowarn ${srcdir}/amd-ipu-staging.patch
	echo "Patch applied!"
}

build() {
  mkdir -p kernel/x86/microcode
  cat ${pkgbase}/amd-ucode/microcode_amd*.bin >kernel/x86/microcode/AuthenticAMD.bin

  # Reproducibility: set the timestamp on the bin file
  if [[ -n ${SOURCE_DATE_EPOCH} ]]; then
    touch -d @${SOURCE_DATE_EPOCH} kernel/x86/microcode/AuthenticAMD.bin
  fi

  # Reproducibility: strip the inode and device numbers from the cpio archive
  echo kernel/x86/microcode/AuthenticAMD.bin |
    bsdtar --uid 0 --gid 0 -cnf - -T - |
    bsdtar --null -cf - --format=newc @- >amd-ucode.img
}

_pick() {
  local p="$1" f d
  shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_linux-firmware-whence-amd-staging-um5606-git() {
  conflicts=("${pkgname%-git}" "${pkgname%-amd-staging-um5606-git}" 'linux-firmware<=20211216.f682ecb')
  provides=("${pkgname%-amd-staging-um5606-git}=$pkgver")
  pkgdesc+=" - contains the WHENCE license file which documents the vendor license details"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname%-amd-staging-um5606-git}" -m644 ${pkgbase}/WHENCE
}

package_linux-firmware-amd-staging-um5606-git() {
  conflicts=("${pkgname%-git}" "${pkgname%-amd-staging-um5606-git}")
  provides=("${pkgname%-amd-staging-um5606-git}=$pkgver")
  depends=('linux-firmware-whence')

  cd ${pkgbase}

  ZSTD_CLEVEL=19 make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install-zst

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname%-amd-staging-um5606-git}" -m644 LICEN*

  cd "${pkgdir}"

  # remove arm64 firmware https://bugs.archlinux.org/task/76583
  rm usr/lib/firmware/mrvl/prestera/mvsw_prestera_fw_arm64-v4.1.img.zst

  # split
  _pick amd-ucode usr/lib/firmware/amd-ucode

  _pick linux-firmware-nfp usr/lib/firmware/netronome
  _pick linux-firmware-nfp usr/share/licenses/${pkgname%-amd-staging-um5606-git}/LICENCE.Netronome

  _pick linux-firmware-mellanox usr/lib/firmware/mellanox

  _pick linux-firmware-marvell usr/lib/firmware/{libertas,mwl8k,mwlwifi,mrvl}
  _pick linux-firmware-marvell usr/share/licenses/${pkgname%-amd-staging-um5606-git}/LICENCE.{Marvell,NXP}

  _pick linux-firmware-qcom usr/lib/firmware/{qcom,a300_*}
  _pick linux-firmware-qcom usr/share/licenses/${pkgname%-amd-staging-um5606-git}/LICENSE.qcom*

  _pick linux-firmware-liquidio usr/lib/firmware/liquidio
  _pick linux-firmware-liquidio usr/share/licenses/${pkgname%-amd-staging-um5606-git}/LICENCE.cavium_liquidio

  _pick linux-firmware-qlogic usr/lib/firmware/{qlogic,qed,ql2???_*,c{b,t,t2}fw-*}
  _pick linux-firmware-qlogic usr/share/licenses/${pkgname%-amd-staging-um5606-git}/LICENCE.{qla1280,qla2xxx}

  _pick linux-firmware-bnx2x usr/lib/firmware/bnx2x*
}

package_amd-ucode-amd-staging-um5606-git() {
  conflicts=("${pkgname%-git}" "${pkgname%-amd-staging-um5606-git}")
  provides=("${pkgname%-amd-staging-um5606-git}=$pkgver")
  pkgdesc="Microcode update image for AMD CPUs"
  license=(custom)

  mv -v amd-ucode/* "${pkgdir}"

  install -Dt "${pkgdir}/boot" -m644 amd-ucode.img

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname%-amd-staging-um5606-git}" -m644 ${pkgbase}/LICENSE.amd-ucode
}

package_linux-firmware-nfp-amd-staging-um5606-git() {
  conflicts=("${pkgname%-git}" "${pkgname%-amd-staging-um5606-git}" 'linux-firmware<=20211216.f682ecb')
  provides=("${pkgname%-amd-staging-um5606-git}=$pkgver")
  pkgdesc+=" - nfp / Firmware for Netronome Flow Processors"
  depends=('linux-firmware-whence')

  mv -v linux-firmware-nfp/* "${pkgdir}"
}

package_linux-firmware-mellanox-amd-staging-um5606-git() {
  conflicts=("${pkgname%-git}" "${pkgname%-amd-staging-um5606-git}" 'linux-firmware<=20211216.f682ecb')
  provides=("${pkgname%-amd-staging-um5606-git}=$pkgver")
  pkgdesc+=" - mellanox / Firmware for Mellanox Spectrum switches"
  depends=('linux-firmware-whence')

  mv -v linux-firmware-mellanox/* "${pkgdir}"
}

package_linux-firmware-marvell-amd-staging-um5606-git() {
  conflicts=("${pkgname%-git}" "${pkgname%-amd-staging-um5606-git}" 'linux-firmware<=20211216.f682ecb')
  provides=("${pkgname%-amd-staging-um5606-git}=$pkgver")
  pkgdesc+=" - marvell / Firmware for Marvell devices"
  depends=('linux-firmware-whence')

  mv -v linux-firmware-marvell/* "${pkgdir}"
}

package_linux-firmware-qcom-amd-staging-um5606-git() {
  conflicts=("${pkgname%-git}" "${pkgname%-amd-staging-um5606-git}" 'linux-firmware<=20211216.f682ecb')
  provides=("${pkgname%-amd-staging-um5606-git}=$pkgver")
  pkgdesc+=" - qcom / Firmware for Qualcomm SoCs"
  depends=('linux-firmware-whence')

  mv -v linux-firmware-qcom/* "${pkgdir}"
}

package_linux-firmware-liquidio-amd-staging-um5606-git() {
  conflicts=("${pkgname%-git}" "${pkgname%-amd-staging-um5606-git}" 'linux-firmware<=20211216.f682ecb')
  provides=("${pkgname%-amd-staging-um5606-git}=$pkgver")
  pkgdesc+=" - liquidio / Firmware for Cavium LiquidIO server adapters"
  depends=('linux-firmware-whence')

  mv -v linux-firmware-liquidio/* "${pkgdir}"
}

package_linux-firmware-qlogic-amd-staging-um5606-git() {
  conflicts=("${pkgname%-git}" "${pkgname%-amd-staging-um5606-git}" 'linux-firmware<=20211216.f682ecb')
  provides=("${pkgname%-amd-staging-um5606-git}=$pkgver")
  pkgdesc+=" - qlogic / Firmware for QLogic devices"
  depends=('linux-firmware-whence')

  mv -v linux-firmware-qlogic/* "${pkgdir}"
}

package_linux-firmware-bnx2x-amd-staging-um5606-git() {
  conflicts=("${pkgname%-git}" "${pkgname%-amd-staging-um5606-git}" 'linux-firmware<=20211216.f682ecb')
  provides=("${pkgname%-amd-staging-um5606-git}=$pkgver")
  pkgdesc+=" - bnx2x / Firmware for Broadcom NetXtreme II 10Gb ethernet adapters"
  depends=('linux-firmware-whence')

  mv -v linux-firmware-bnx2x/* "${pkgdir}"
}

# vim:set sw=2 et:
