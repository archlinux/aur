# Maintainer: DimmKG <dirkg361@gmail.com>
# Contributor: wereii <wereii@wereii.cz>
# Contributor: Base pkgbuild files provided by Damian Blanco <blanco.damian@gmail.com>
# Contributor: franciscod <demartino.francisco@gmail.com>
# Based on: https://aur.archlinux.org/packages/simulide

pkgname=simulide-git
pkgver=r250113
#_realver=${pkgver//.r*/}
pkgrel=2
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers). Development version."
arch=("x86_64")
url="https://github.com/eeTools/SimulIDE-dev"
provides=('simulide')
conflicts=('simulide')
license=("GPL3")
source=(
  "${pkgname}::git+https://github.com/eeTools/SimulIDE-dev.git"
  "simulide.desktop")
sha256sums=(
  SKIP
  'da1a1812404ba64006f85e4b2c2b51cf8a11ab6949e20c1487a1b7738cc7e1ba')

depends=(
  "qt5-base>=5.15.1"
  "qt5-multimedia"
  "qt5-serialport"
  "qt5-svg"
  "qt5-script"
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
  cp -r ${srcdir}/${pkgname}/resources/ "${pkgdir}/usr/share/icons/hicolor/256x256/simulide.png"
  # mime-type
  mkdir -p "${pkgdir}/usr/share/mime/packages"
  cp -r ${srcdir}/${pkgname}/resources/simulide-mime.xml "${pkgdir}/usr/share/mime/packages/simulide.xml"

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
