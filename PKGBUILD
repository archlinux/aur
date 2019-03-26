# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=intel-ucode-git
_pkgname=intel-ucode
pkgver=20190312.r0.g7febfb9
pkgrel=1
pkgdesc='Microcode update files for Intel CPUs'
arch=('any')
url='https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files'
replaces=('microcode_ctl')
makedepends=('iucode-tool')
conflicts=('intel-ucode')
provides=('intel-ucode')
license=('custom')
source=("git://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files")
sha256sums=('SKIP')

pkgver() {
  cd Intel-Linux-Processor-Microcode-Data-Files

  git describe --long --tags | sed 's/^microcode-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd Intel-Linux-Processor-Microcode-Data-Files

  rm -f intel-ucode{,-with-caveats}/list
  mkdir -p kernel/x86/microcode
  iucode_tool -w kernel/x86/microcode/GenuineIntel.bin intel-ucode{,-with-caveats}/
  # Make intel-ucode.img reproducible
  [ ! -z $SOURCE_DATE_EPOCH ] && touch -d @$SOURCE_DATE_EPOCH kernel/x86/microcode/GenuineIntel.bin
  echo kernel/x86/microcode/GenuineIntel.bin | bsdcpio -o -H newc -R 0:0 > intel-ucode.img
}

package() {
  cd Intel-Linux-Processor-Microcode-Data-Files

  install -D -m0644 intel-ucode.img "${pkgdir}"/boot/intel-ucode.img
  install -D -m0644 license "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
