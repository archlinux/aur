# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>
# Contributor: Tad <tad@spotco.us>
pkgname=amd-real-ucode-git
pkgver=20231021.ba8eaf5
pkgrel=1
pkgdesc="Actually provides the latest CPU microcode for AMD"
arch=('any')
license=('custom')
makedepends=('linux-firmware' 'git')
conflicts=('amd-ucode')
provides=('amd-ucode')
source=('CPUMicrocodes::git+https://github.com/platomav/CPUMicrocodes' 'real-ucode::git+https://github.com/divestedcg/real-ucode#commit=c93c9ed85eb3c0566a76d8c3accebd6ee82c1ca9' 'amd-ucodegen::git+https://github.com/AndyLavr/amd-ucodegen#commit=0d34b54e396ef300d0364817e763d2c7d1ffff02')
sha256sums=(SKIP SKIP SKIP)

pkgver() {
  cd "${srcdir}/CPUMicrocodes"
  git log -1 --pretty='format:%cd.%h' --date=format:'%Y%m%d'
}

build() {
	set -eo pipefail

	cd amd-ucodegen
	patch -p1 < ../real-ucode/amd-ucodegen-tweak.diff
	make
	cd ../CPUMicrocodes
	mv ../amd-ucodegen/amd-ucodegen .
	../real-ucode/process-amd.sh
	cd ..
	mkdir -p firmware
	cd firmware
	cp /usr/lib/firmware/amd-ucode/microcode_amd*.bin .
	cp ../CPUMicrocodes/microcode_amd*.bin .
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
    bsdtar --null -cf - --format=newc @- > ../amd-ucode.img
}

package() {
	install -Dt "${pkgdir}/boot" -m644 amd-ucode.img

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 real-ucode/LICENSE.amd-ucode
}
