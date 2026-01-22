# Maintainer: DimmKG <dirkg361@gmail.com>
# Contributor: wereii <wereii@wereii.cz>
# Contributor: Base pkgbuild files provided by Damian Blanco <blanco.damian@gmail.com>
# Contributor: franciscod <demartino.francisco@gmail.com>
# Based on: https://aur.archlinux.org/packages/simulide

pkgname=simulide-git
pkgver=r260122
#_realver=${pkgver//.r*/}
pkgrel=2
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers). Development version."
arch=("x86_64")
url="https://github.com/eeTools/SimulIDE-dev"
provides=('simulide')
conflicts=('simulide')
license=("AGPL-3.0-or-later")
source=(
  "${pkgname}::git+https://github.com/eeTools/SimulIDE-dev.git"
  "simulide.desktop"
  "simulide-mime.xml")
sha256sums=(
  SKIP
  '7e9d4a7a40c45a1aaea2b96dc01af628df3356b0e2b2ced1425cf3ecea22ff19'
  '2eef8de822c14ca8377458bb2f268db756ec620bedde363740bb556f2948a7f3')

depends=(
  "qt6-base"
  "qt6-multimedia"
  "qt6-serialport"
  "qt6-svg"
)

makedepends=('git' 'qt6-tools')

build() {
  cd "${srcdir}/${pkgname}/build_XX"
  qmake6
  PATH="/usr/lib/qt6/bin:$PATH" make
}

package() {
  install -D -m644 "${srcdir}/simulide.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # mime-type
  install -D -m644 "${srcdir}/simulide-mime.xml" "${pkgdir}/usr/share/mime/packages/simulide.xml"

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
  install -D -m644 "${srcdir}/${pkgname}/resources/icons/simulide.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/simulide.png"
}

pkgver() {
  # Upstream uses "%m%d" format, but the revision number resets in next year
  # Additionally, the VERSION variable may be empty in build file
  # cd "${pkgname}"
  #VERSION=$(awk -F= '/^VERSION/{gsub(/ /, "", $0); gsub(/"/, "", $0); print $2}' SimulIDE.pri)
  #RELEASE=$(awk -F= '/^RELEASE/{gsub(/ /, "", $0); gsub(/"/, "", $0); print $2}' SimulIDE.pri)
  REVNO=$(date +%y%m%d)
  #echo "${VERSION}_${RELEASE}_r${REVNO}"
  echo "r${REVNO}"

}
