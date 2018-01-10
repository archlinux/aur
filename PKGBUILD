# $Id: PKGBUILD 310392 2017-11-18 19:46:19Z eworm $
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=intel-ucode-xeon-x5570
pkgver=20180108
# Some random "download id" that intel has in their downloadcenter
_dlid=27337
pkgrel=1
pkgdesc="Microcode update files for Intel CPUs"
conflicts=(intel-ucode)
provides=(intel-ucode)
arch=('any')
install=intel-ucode.install
url="https://downloadcenter.intel.com/product/37111/Intel-Xeon-Processor-X5570-8M-Cache-2-93-GHz-6-40-GT-s-Intel-QPI-"
replaces=('microcode_ctl')
license=('custom')
source=("https://downloadmirror.intel.com/27431/eng/microcode-20180108.tgz"
        'LICENSE'
        'intel-microcode2ucode.c')
sha256sums=('063f1aa3a546cb49323a5e0b516894e4b040007107b8c8ff017aca8a86204130'
            '6983e83ec10c6467fb9101ea496e0443f0574c805907155118e2c9f0bbea97b6'
            '5af76d7e23768c94ab03fbf0d280b30fccd9c1ce697111c9999f6d51955c5a98');

build() {
  cd "$srcdir"

  gcc -Wall ${CFLAGS} -o intel-microcode2ucode intel-microcode2ucode.c

  ./intel-microcode2ucode ./microcode.dat
}

package() {
  cd "$srcdir"

  install -d -m755 "${pkgdir}"/boot

  mkdir -p kernel/x86/microcode
  mv microcode.bin kernel/x86/microcode/GenuineIntel.bin
  echo kernel/x86/microcode/GenuineIntel.bin | bsdcpio -o -H newc -R 0:0 > "${pkgdir}"/boot/intel-ucode.img

  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
