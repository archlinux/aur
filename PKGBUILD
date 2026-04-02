# Maintainer: DimmKG <dirkg361@gmail.com>
# Contributor: wereii <wereii@wereii.cz>
# Contributor: Base pkgbuild files provided by Damian Blanco <blanco.damian@gmail.com>
# Contributor: franciscod <demartino.francisco@gmail.com>

pkgname=simulide-stable-git
pkgver=1.1.0_r260402
pkgrel=1
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers). Stable v1.0 development branch"
arch=("x86_64")
url="https://github.com/Arcachofo/SimuliDE-1"
provides=('simulide')
conflicts=('simulide')
license=("AGPL-3.0-only")
source=(
  "${pkgname}::git+https://github.com/Arcachofo/SimuliDE-1.git"
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
)

makedepends=(
  "git"
  "qt5-tools"
)


build() {
  cd "${srcdir}/${pkgname}/build_XX"
  qmake
  make
}

package() {
  install -D -m644 simulide.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${srcdir}/${pkgname}/build_XX/executables/"
  # don't care about release prefix, move to single folder SimulIDE_${version}
  cd $(ls -d */|head -n 1)

  # binary
  mkdir -p "${pkgdir}/usr/bin"
  cp simulide "${pkgdir}/usr/bin/"
  # data
  mkdir -p "${pkgdir}/usr/share/simulide"
  cp -r ./ "${pkgdir}/usr/share/simulide"
  rm ${pkgdir}/usr/share/simulide/simulide
 
  # icon
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256"
  cp -r ${srcdir}/${pkgname}/resources/icons/simulide.png* "${pkgdir}/usr/share/icons/hicolor/256x256/simulide.png"

}

pkgver() {
  cd "${srcdir}/${pkgname}/"
  VERSION=$(awk -F= '/^VERSION/{gsub(/ /, "", $0); gsub(/"/, "", $0); print $2}' SimulIDE.pro)
  REVNO=$(date +%y%m%d)
  if [[ -n "$VERSION" ]]; then
    echo "${VERSION}_r${REVNO}"
  else
    echo "r${REVNO}"
  fi

  #echo "r${REVNO}"
}
