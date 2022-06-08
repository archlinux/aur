# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=intel-ucode-git
pkgver=20220510.r2.g6c0c469
pkgrel=1
pkgdesc='Microcode update files for Intel CPUs'
arch=('any')
url='https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files'
replaces=('microcode_ctl')
makedepends=('iucode-tool' 'git')
conflicts=('intel-ucode')
provides=('intel-ucode')
license=('custom')
source=("git+https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files")
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
