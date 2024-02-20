# Maintainer: Dobroslaw Kijowski <dobo90_at_gmail.com>

_commit='c7af5d5b1e8ddcb9ac71ba6f07640de678501c6f'
pkgname=amd-zen-ucode-platomav
pkgver=r286
pkgrel=1
arch=(any)
pkgdesc="Microcode update image for AMD Zen CPUs (family 17h and 19h) from platomav's github"
url='https://github.com/platomav/CPUMicrocodes'
license=(custom)
conflicts=(amd-ucode)
provides=(amd-ucode)
source=("https://github.com/platomav/CPUMicrocodes/archive/${_commit}.zip"
        'https://raw.githubusercontent.com/dobo90/amd-ucodegen/7a3c51e821df96910ecb05b22f3e4866b4fb85b2/amd-ucodegen.c')
sha256sums=('3f556dcd3f7fd79217bda992573dd2752f713a4211fb7b266d1cd56249755962'
            'e3e21e155c2e9df96b378bc1d48ae183f1d8dfab310f86bb0bfb9296289eabf6')

build() {
  gcc amd-ucodegen.c -o amd-ucodegen
  ./amd-ucodegen "CPUMicrocodes-${_commit}"/AMD/cpu??8??F??_* # Family=0x17: Base Family=0xF + Extended Family=0x8
  ./amd-ucodegen "CPUMicrocodes-${_commit}"/AMD/cpu??A??F??_* # Family=0x19: Base Family=0xF + Extended Family=0xA

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
}

package() {
  install -Dt "${pkgdir}/boot" -m644 amd-ucode.img

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "CPUMicrocodes-${_commit}/AMD/LICENSE"
}
