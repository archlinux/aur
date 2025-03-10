# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

pkgbase="maniac-mansion-dott-bin"
pkgname=(
  "maniac-mansion-data-bin"
  "maniac-mansion"
)
_pkgver_game="2"
pkgver="${_pkgver_game}"
pkgrel=2
epoch=1
arch=(
  'any'
)
pkgdesc='Maniac Mansion ("version 2"/ "release 3" from 1989), extracted from "Day of the Tentacle Remastered".'
url="http://www.maniacmansionfan.50webs.com/versions.html"
license=(
  'LicenseRef-Proprietary'
)
groups=('games')
makedepends=(
  'day-of-the-tentacle-remastered'
  'zopfli'  # for 'zopflipng'
  'untangle'
)
checkdepends=()
_archivename="gog_day_of_the_tentacle_remastered_${_pkgver_gog}.sh"
source=(
  "maniac-mansion.sh"
  "Maniac_Mansion_Icon.png::https://www.classicgaming.cc/pc/maniac-mansion/images/icons/icon-maniac-mansion-logo-128x128.png"
  "maniac-mansion.desktop"
  "license-note-proprietary.txt"
)
sha256sums=(
  '387d1bdd548a3beb142216b8ae60144102275666238edf07c183999003a865ac'  # maniac-mansion.sh
  '7a6cf4eee9695250bd38754bc93f3ddecc0ce69dcfb149d750ec1d162dfa1d30'  # Maniac_Mansion_Icon.png
  '54e01410d29c2ed264837f92acbc16173b4bd1987697ddc74c1be6221b9a3c4a'  # maniac-mansion.desktop
  '60e12a5ca3a012e0379819d2239c0b8c6157286e144f30978643895c7162af52'  # license-note-proprietary.txt
)

prepare() {
  cd "${srcdir}"
  if [ -e "maniac-mansion" ]; then
    rm -Rf "maniac-mansion"
  fi
  mkdir -p maniac-mansion

  msg2 "Extracting Maniac Mansion ..."
  cd maniac-mansion
  untangle -x -F 'maniac/*' "/usr/lib/dott/tenta.cle"
}

build() {
  msg2 "Size-optimising 'Maniac_Mansion_Icon.png' ..."
  zopflipng -m -y "${srcdir}/Maniac_Mansion_Icon.png" "${srcdir}/maniac-mansion.png"
}

package_maniac-mansion-data-bin() {
  pkgdesc='Data files of "Maniac Mansion", version 2/ release 3, from 1989. To be played with ScummVM.'
  arch=('any')
  optdepends=(
    "maniac-mansion: To run the game via '/usr/bin/maniac-mansion'."
    'scummvm: To run the game manually with ScummVM.'
  )
  provides=(
    "maniac-mansion-data=v2"
    "maniac-mansion-data=release3"
  )
  conflicts=(
    "maniac-mansion-data"
    "maniac-mansion-original-data-bin=1.4.1+gog2.1.0.2"  # Due to package renaming.
  )
  replaces=(
    "maniac-mansion-original-data-bin=1.4.1+gog2.1.0.2"  # Due to package renaming.
  )

  install -Dvm644 -t "${pkgdir}/usr/lib/maniac-mansion" "${srcdir}/maniac-mansion/maniac"/*
  install -Dvm644  "${srcdir}/maniac-mansion.png"            "${pkgdir}/usr/share/pixmaps/maniac-mansion.png"
  install -Dvm644  "${srcdir}/license-note-proprietary.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/license-note-proprietary.txt"
}

package_maniac-mansion() {
  pkgdesc='Standalone ScummVM based launcher script for the original game "Maniac Mansion" (any version).'
  arch=('any')
  license=("GPL-3.0-or-later")
  depends=(
    "maniac-mansion-data"
    "scummvm"
    "sh"
  )
  provides=(
    "maniac-mansion"
  )
  conflicts=(
    "maniac-mension"
    "maniac-mansion-original=1.4.1+gog2.1.0.2"  # Due to package renaming.
  )
  replaces=(
    "maniac-mansion-original=1.4.1+gog2.1.0.2"  # Due to package renaming.
  )

  install -Dvm755 "${srcdir}/maniac-mansion.sh"  "${pkgdir}/usr/bin/maniac-mansion"
  install -Dvm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/maniac-mansion.desktop"
}
