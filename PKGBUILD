# Maintainer: wereii <wereii@wereii.cz>
# Contributor: Base pkgbuild files provided by Damian Blanco <blanco.damian@gmail.com>
# Contributor: franciscod <demartino.francisco@gmail.com>

pkgname=simulide
pkgver=0.4.15_SR10
_realver=${pkgver//_/-}
pkgrel=2
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers)"
arch=("x86_64")
url="https://www.simulide.com/"
license=("GPL3")
source=(
        "https://launchpad.net/simulide/${pkgver//_*/}/${pkgver//_*/}-stable/+download/simulide_${_realver}_Sources.zip"
        "simulide.desktop"
        "changelog.txt")

sha256sums=('b108d804d4720daa5d3eb60e1d99b0cce57973cf8ba59546e7d389250f5eab8d'
            SKIP
            SKIP)

changelog="changelog.txt"
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
)


build() {
  cd "${srcdir}/simulide_${_realver}_Sources/build_XX"
  qmake
  make -j`nproc`
}

package() {
  install -D -m644 simulide.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  #cp "${srcdir}/simulide_${_realver}_Sources/changelog.txt" "${srcdir}/.."

  cd "${srcdir}/simulide_${_realver}_Sources/build_XX/executables/SimulIDE_${_realver}"
  test -s "bin/${pkgname}" && test -x "bin/${pkgname}"
  test -d "share/${pkgname}"

  mkdir -p "${pkgdir}/usr"
  cp -r ./* "${pkgdir}/usr" # usr/bin usr/share
}
