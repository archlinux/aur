# $Id$
# Maintainer: Arthur Heymans <arthur@aheymans.xyz>

pkgname=intel-ucode-platomav-git
pkgver=r28.360b8e9
pkgrel=1
pkgdesc='Microcode update files for Intel CPUs'
arch=('any')
url='https://github.com/platomav/CPUMicrocodes'
replaces=('microcode_ctl')
conflicts=('intel-ucode')
makedepends=('iucode-tool')
license=('custom')
source=("git+https://github.com/platomav/CPUMicrocodes.git"
        "LICENSE")
sha256sums=('SKIP'
            '6983e83ec10c6467fb9101ea496e0443f0574c805907155118e2c9f0bbea97b6')

invalid=('cpu106C0_plat01_ver00000007_2007-08-24_PRD_923CDFA3.bin')

pkgver() {
  cd "$srcdir"/CPUMicrocodes
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  rm -rf kernel/x86/microcode/GenuineIntel.bin

  for i in $invalid
  do
    msg2 'Removing invalid microcode %s' $i
    rm CPUMicrocodes/Intel/$i
  done

  mkdir -p kernel/x86/microcode
  iucode_tool -w kernel/x86/microcode/GenuineIntel.bin CPUMicrocodes/Intel
  echo kernel/x86/microcode/GenuineIntel.bin | bsdcpio -o -H newc -R 0:0 > intel-ucode.img
}

package() {
  cd "$srcdir"

  install -D -m0644 intel-ucode.img $pkgdir/boot/intel-ucode.img
  install -D -m0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
