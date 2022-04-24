# Maintainer: dreieck

_pkgbase="riven"
pkgbase="${_pkgbase}"
pkgname=(
  "riven"
  "riven-data"
  "riven-makingof"
)
arch=('any')
epoch="0"
pkgver='1.2_20030721_dvd' # Obtained from the file 'Read Instructions First'.
pkgrel=1
makedepends=(
  'dos2unix'    # To convert text files with Mac and DOS new line standard to Unix new line standard.
  'imagemagick' # To convert .ico to .png.
)
options+=('emptydirs')

source=(
  'riven.dvd.iso::https://archive.org/download/riven_202001/Riven.iso'
  'riven.sh'
  'riven.desktop'
  'license-note.txt'
)

sha256sums=(
  '90f4e43a4fcb6cddc50497eccd235b79590beaa4bf8e432ddb87755b8fbab0fe'
  'd6fa553eadbab87700ef49cf609c5056740f9d1c53fe88c1e805d21920c04e37'
  '7b4d5fb2f60281cbd4c031f99923f8122ff7dd5996ce395cba99e498309dc270'
  'f92e92e57ae86a3d490c81d965e5d51779afef61c869ed4c9d9e0b6411c1789c'
)

prepare() {
  cd "${srcdir}"

  local _legalcopy
  msg2 "Please make sure you have obtained a legal copy of the game before continuing!"
  read -e -p "Enter 'i have a legal copy of riven' to continue, anything else to abort and delete downloaded data: " _legalcopy
  if [ "${_legalcopy}x" != "i have a legal copy of riven"x ]; then
    rm -fv "../${source[0]%%::*}"
    rm -Rfv "${srcdir}"/*
    error "No legal copy, aborting."
    return 22
  fi
}

build() {
  cd "${srcdir}"

  mac2unix -n 'Read EULA First' 'Riven_license.txt'
  mac2unix -n 'Read Instructions First' 'Riven_Instructions.txt'
  dos2unix -n 'English/movie.txt' 'movie.txt'

  printf '%s\n' "Converting 'English/Icon.ICO' to 'riven.png'"
  convert English/Icon.ICO riven.png
}

package_riven() {
  pkgdesc="'Riven: The sequel to Myst' is an in-depth point-and-click adventure game with superb landscape and immersive puzzles."
  # url='https://wiki.scummvm.org/index.php/Riven:_The_Sequel_to_Myst'
  url='https://cyan.com/games/riven/'
  license=('GPL3')
  depends=(
    'bash'
    'riven-data'
    'scummvm'
  )

  cd "${srcdir}"

  install -D -v -m755 "${srcdir}/riven.sh" "${pkgdir}/usr/bin/riven"
  install -D -v -m644 "${srcdir}/riven.desktop" "${pkgdir}/usr/share/applications/riven.desktop"
  install -D -v -m644 "${srcdir}/riven.png" "${pkgdir}/usr/share/pixmaps/riven.png"

  install -d -v -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "../common/GPL3/license.txt" "Riven-startscript-license.txt"
}

package_riven-data() {
  pkgdesc="Data files for the point-and-click adventure/ puzzle game 'Riven'."
  url='https://archive.org/details/riven_202001'
  license=('custom: proprietary')
  optdepends=(
    'riven: To actually play the game.'
    "riven-makingof: Movie 'The Making of Riven'."
  )

  cd "${srcdir}"

  install -v -d -m755 "${pkgdir}/usr/lib/riven"
  for _mhk in Data/*.[mM][hH][kK]; do
    install -v -D -m644 "${_mhk}" "${pkgdir}/usr/lib/riven/${_mhk}"
  done
  for _mhk in ASSETS1/*.[mM][hH][kK]; do # Files in ASSETS1 might have better quality, so use them over the ones from Data1.
    install -v -D -m644 "${_mhk}" "${pkgdir}/usr/lib/riven/${_mhk}"
  done
  install -v -D -m755 "program/arcriven.z" "${pkgdir}/usr/lib/riven/arcriven.z"
  # Alternatively, those could also be used instead of 'arcriven.z':
  #install -v -D -m755 "English/Riven"     "${pkgdir}/usr/lib/riven/riven"
  #install -v -D -m755 "English/Riven.exe" "${pkgdir}/usr/lib/riven/riven.exe"

  install -v -D -m644 "${srcdir}/Riven_Instructions.txt" "${pkgdir}/usr/share/doc/${_pkgbase}/Riven_Instructions.txt"
  install -v -D -m644 "${srcdir}/English/Manual.pdf" "${pkgdir}/usr/share/doc/${_pkgbase}/Manual.pdf"

  install -v -D -m644 "${srcdir}/license-note.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-note.txt"
  install -v -D -m644 "${srcdir}/Riven_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Riven_license.txt"

  ln -sv "/usr/share/licenses/${pkgname}/Riven_license.txt" "${pkgdir}/usr/share/doc/${_pkgbase}/Riven_license.txt"
}

package_riven-makingof() {
  pkgdesc="Movie 'The Making of Riven', a point-and-click adventure/ puzzle game."
  url='https://archive.org/details/riven_202001'
  license=('custom: proprietary')
  optdepends=(
    'riven-data: The game files.'
  )

  cd "${srcdir}"

  install -v -D -m644 "${srcdir}/The Making of Riven/Makingof.mov" "${pkgdir}/usr/share/doc/${_pkgbase}/The_Making_of_Riven/Makingof.mov"
  install -v -D -m644 "${srcdir}/movie.txt" "${pkgdir}/usr/share/doc/${_pkgbase}/The_Making_of_Riven/movie.txt"

  install -v -D -m644 "${srcdir}/movie.txt" "${pkgdir}/usr/share/licenses/${pkgname}/The_Making_of_Riven.license.txt"
}