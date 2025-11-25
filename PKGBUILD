# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>
# Contributor: Tad <tad@spotco.us>
pkbase=amd-real-ucode-git
pkgname=(amd-real-ucode-git amd-real-ucode-resigned-git)
pkgver=20251116.ea1ed78
pkgrel=1
pkgdesc="Actually provides the latest CPU microcode for AMD"
arch=('any')
license=('custom')
makedepends=('git' 'perl-rename')
conflicts=('amd-ucode')
provides=('amd-ucode')
url='https://github.com/divestedcg/real-ucode'
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/real-ucode"
  git log -1 --pretty='format:%cd.%h' --date=format:'%Y%m%d'
}

build-amd-variant() {
  set -euo pipefail
  variant=$1

  mkdir -p firmware-$variant
  cd firmware-$variant
  cp ../real-ucode/microcode/amd-ucode/microcode_amd*.bin.$variant .
  perl-rename "s/\.$variant//" microcode_amd*.bin.$variant
  # this directory and exact name matters
  # https://gitlab.archlinux.org/archlinux/packaging/packages/linux-firmware/-/blob/main/PKGBUILD?ref_type=heads#L43
  mkdir -p kernel/x86/microcode
  cat microcode_amd*.bin > kernel/x86/microcode/AuthenticAMD.bin

  # Reproducibility: set the timestamp on the bin file
  if [[ -n ${SOURCE_DATE_EPOCH} ]]; then
    touch -d @${SOURCE_DATE_EPOCH} kernel/x86/microcode/AuthenticAMD.bin
  fi

  # Reproducibility: strip the inode and device numbers from the cpio archive
  echo kernel/x86/microcode/AuthenticAMD.bin |
    bsdtar --uid 0 --gid 0 -cnf - -T - |
    bsdtar --null -cf - --format=newc @- > amd-ucode.img
  cd ..
}

build() {
  set -euo pipefail
  build-amd-variant official
  build-amd-variant resigned
}

package-amd-variant () {
  set -euo pipefail
  variant=$1
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 real-ucode/LICENSE.amd-ucode
  cd firmware-$variant
  install -Dt "${pkgdir}/boot" -m644 amd-ucode.img
  install -Dt "${pkgdir}/usr/lib/firmware/amd-ucode" -m644 microcode_amd*.bin
}

package_amd-real-ucode-git () {
  set -euo pipefail
  package-amd-variant official
}

package_amd-real-ucode-resigned-git () {
  set -euo pipefail
  package-amd-variant resigned
}
