# Maintainer: DimmKG <dirkg361@gmail.com>
# Contributor: wereii <wereii@wereii.cz>
# Contributor: Base pkgbuild files provided by Damian Blanco <blanco.damian@gmail.com>
# Contributor: franciscod <demartino.francisco@gmail.com>
# Based on: https://aur.archlinux.org/packages/simulide

pkgname=simulide-bzr
pkgver=1.0.1.r1316
_realver=${pkgver//.r*/}
pkgrel=1
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers). Development version."
arch=("x86_64")
url="https://launchpad.net/simulide"
provides=('simulide')
conflicts=('simulide')
license=("GPL3")
source=(
  "${pkgname}::bzr+https://launchpad.net/simulide/trunk"
  "simulide.desktop")
sha256sums=(
  SKIP
  'a5b1f6b19d3fc2e93baa98beb000488a0e1f0fd93935cc7d86e8f0b345c11f23')

depends=(
  "qt5-base>=5.15.1"
  "qt5-multimedia"
  "qt5-serialport"
  "qt5-svg"
  "qt5-script"
  "qt5-tools"
  "libelf>=0.181"
)

optdepends=(
  "gpsim: needed for PIC simulation"
  "simavr: needed for AVR simulation"
)

makedepends=(
  "avr-libc"
  "avr-gcc"
  "python-dulwich"
)


build() {
  cd "${srcdir}/${pkgname}/build_XX"
  qmake
  make
}

package() {
  install -D -m644 simulide.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${srcdir}/${pkgname}/build_XX/executables/SimulIDE_${_realver}"
  # binary
  mkdir -p "${pkgdir}/usr/bin"
  cp simulide "${pkgdir}/usr/bin/"
  # data
  mkdir -p "${pkgdir}/usr/share/simulide"
  cp -r ./ "${pkgdir}/usr/share/simulide"
  rm ${pkgdir}/usr/share/simulide/simulide
 
  # icon
  mkdir -p "${pkgdir}/usr/share/icons"
  cp -r ${srcdir}/${pkgname}/resources/icons/* "${pkgdir}/usr/share/icons"

}

pkgver() {
  VERSION=$(grep -ohP '(?<=VERSION = \")(.*)(?=\")' "${srcdir}/${pkgname}/SimulIDE.pro")
  cd "${pkgname}"
  REVISON=$(bzr revno)
  echo "${VERSION}.r${REVISON}"
}
