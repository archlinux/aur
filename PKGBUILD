# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=intel-ucode-git
_pkgname=intel-ucode
pkgver=20191115.r0.g33b7b2f
pkgrel=2
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
  iucode_tool --write-earlyfw=intel-ucode.img intel-ucode{,-with-caveats}/
}

package() {
  cd Intel-Linux-Processor-Microcode-Data-Files

  install -D -m0644 intel-ucode.img "${pkgdir}"/boot/intel-ucode.img
  install -D -m0644 license "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
