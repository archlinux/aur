# Maintainer: dreieck

_pkgbase="riven-original"
pkgbase="${_pkgbase}"
pkgname=(
  "riven-original"
  "riven-original-data"
  "riven-original-strategyguide"
  "riven-original-makingof"
)
pkgdesc="'Riven: The Sequel to Myst' is a 1997 point-and-click puzzle adventure game with superb landscape immersion. This is the original game, not the remake."
groups=(
  'myst'
  'riven'
)
arch=('any')
url='https://cyan.com/games/riven/'
epoch="0"
pkgver='1.2_20030721_dvd' # Obtained from the file 'Read Instructions First'.
pkgrel=6
_newestoriginalver='1.2_20231231_dvd' # Assumed highest possible version number of 'riven' that is for the original game.
makedepends=(
  'dos2unix'    # To convert text files with Mac and DOS new line standard to Unix new line standard.
  'ffmpeg'      # To convert the Making Of-movie to smaller filesize.
  'imagemagick' # To convert .ico to .png.
  'zopfli'      # To size-optimise PNG files.
  # 'littleutils' # For 'lowercase'.
)
options+=('emptydirs')

source=(
  'riven.dvd.iso::https://archive.org/download/riven_202001/Riven.iso'
  'riven-strategy-guide.pdf::https://www.allthingsuru.com/AllThingsUru/pdf/Riven%20The%20Sequel%20to%20Myst%20Prima%20Official%20eGuide.pdf' # http://web.archive.org/web/20231001122618/https://www.allthingsuru.com/AllThingsUru/pdf/Riven%20The%20Sequel%20to%20Myst%20Prima%20Official%20eGuide.pdf
  'riven.sh'
  'riven.desktop'
  'license-strategy-guide.txt'
  'license-note.txt'
)

sha256sums=(
  '90f4e43a4fcb6cddc50497eccd235b79590beaa4bf8e432ddb87755b8fbab0fe'  # riven.dvd.iso
  '523a9f5c9d29d05a9eb90339ac676f4b2f352e0317f399cc5ed71f7d6bfe731e'  # riven-strategy-guide.pdf
  'ee6a4ba3dbd61e7d0fb14476b64df0aced66a5486f4cfee3c9f09eb944e7852b'  # riven.sh
  '7b4d5fb2f60281cbd4c031f99923f8122ff7dd5996ce395cba99e498309dc270'  # riven.desktop
  'bb8aa13d8598a8c2e8466183481cd5b849afec44ce54ff68327a7650c8bdc99a'  # license-strategy-guide.txt
  'f92e92e57ae86a3d490c81d965e5d51779afef61c869ed4c9d9e0b6411c1789c'  # license-note.txt
)

prepare() {
  cd "${srcdir}"

  ## If 'riven-data' is not yet installed, then ask for confirmation:
  if ! (pacman -Qqi 'riven-original-data' > /dev/null 2>&1 || pacman -Qqi "riven-data<=${_newestoriginalver}" > /dev/null 2>&1); then
    ## Check if the user has a legal copy (by trusting the user).  
    #  Ideally, we want to have it before downloading stuff, but if we put it in the general part if the `PKGBUILD` then it is executed each time the `PKGBUILD` is parsed, so also at the creation of `.SRCINFO`.
    local _legalcopy
    msg2 "Please make sure you have obtained a legal copy of the game before continuing!"
    read -e -p "Enter 'i have a legal copy of riven original' (without quotes) to continue, anything else to abort and DELETE DOWNLOADED DATA: " _legalcopy
    if [ "${_legalcopy}x" != "i have a legal copy of riven original"x ]; then
      rm -fv "${SRCDEST}/${source[0]%%::*}"
      rm -Rfv "${srcdir}"/*
      error "No legal copy, aborting."
      return 22
    fi
  fi

  mkdir -p build
}

build() {
  cd "${srcdir}"

  mac2unix -n 'Read EULA First' 'build/Riven_license.txt'
  mac2unix -n 'Read Instructions First' 'build/Riven_Instructions.txt'
  dos2unix -n 'English/movie.txt' 'build/movie.txt'

  printf '%s\n' "Converting 'English/Icon.ICO' to 'riven.png' ..."
  convert 'English/Icon.ICO' 'build/riven.png'
  zopflipng -m -y 'build/riven.png' 'build/riven.png'

  printf '%s\n' "Converting 'The Making of Riven/Makingof.mov' to AV1 + OPUS codec ..."
  ffmpeg \
    -i "The Making of Riven/Makingof.mov" \
    -c:v libsvtav1 -crf 26 -preset 3 -g 300 \
    -c:a libopus -b:a 98304 -vbr on -compression_level 10 -frame_duration 60 -application audio \
    -y "build/Makingof.mkv"
}

package_riven-original() {
  pkgdesc="'Riven: The Sequel to Myst' is a 1997 point-and-click puzzle adventure game with superb landscape immersion. This is the original game, not the remake."
  # url='https://wiki.scummvm.org/index.php/Riven:_The_Sequel_to_Myst'
  url='https://cyan.com/games/riven/'
  license=('GPL-3.0-or-later')
  depends=(
    'riven-data'
    'scummvm'
  )
  optdepends=(
    "riven-makingof: Movie 'The Making of Riven'."
    "riven-soundtrack: Soundtrack of Riven."
  )
  provides=("riven=${pkgver}")
  conflicts=("riven<=${_newestoriginalver}")
  replaces=("riven<=${_newestoriginalver}")

  cd "${srcdir}"

  install -D -v -m755 "${srcdir}/riven.sh" "${pkgdir}/usr/bin/riven"
  install -D -v -m644 "${srcdir}/riven.desktop" "${pkgdir}/usr/share/applications/riven.desktop"
  install -D -v -m644 "${srcdir}/build/riven.png" "${pkgdir}/usr/share/pixmaps/riven.png"

  install -d -v -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "../spdx/GPL-3.0-or-later.txt" "Myst4-startscript-license.txt"
}

package_riven-original-data() {
  pkgdesc="Data files for the point-and-click adventure/ puzzle game 'Riven: The Sequel to Myst'. Can be directly used with ScummVM. This is the game data of the original game, not the remake."
  url='https://archive.org/details/riven_202001'
  license=('LicenseRef-proprietary:Cyan Worlds')
  optdepends=(
    "riven-original: To actually launch the game just by executing '/usr/bin/riven'."
    "riven-original-strategyguide: For help when you are stuck."
    "scummvm: To play the game by manually launching ScummVM and adding the game to ScummVM."
  )
  provides=("riven-data=${pkgver}")
  conflicts=("riven-data<=${_newestoriginalver}")
  replaces=("riven-data<=${_newestoriginalver}")


  cd "${srcdir}"

  local _mhk
  install -v -d -m755 "${pkgdir}/usr/lib/riven"
  for _mhk in Data/*.[mM][hH][kK]; do
    install -v -D -m644 "${_mhk}" "${pkgdir}/usr/lib/riven/$(basename "${_mhk}")"
  done
  for _mhk in ASSETS1/*.[mM][hH][kK]; do # Files in ASSETS1 might have better quality, so use them over the ones from Data1.
    install -v -D -m644 "${_mhk}" "${pkgdir}/usr/lib/riven/$(basename "${_mhk}")"
  done
  # lowercase "${pkgdir}/usr/lib/riven"/*

  # One of the following three may be used interchangeably for playing Riven with ScummVM:
  install -v -D -m755 "program/arcriven.z" "${pkgdir}/usr/lib/riven/arcriven.z"
  #install -v -D -m755 "English/Riven"     "${pkgdir}/usr/lib/riven/Riven"
  #install -v -D -m755 "English/Riven.exe" "${pkgdir}/usr/lib/riven/Riven.exe"

  install -v -D -m644 "${srcdir}/build/Riven_Instructions.txt" "${pkgdir}/usr/share/doc/${_pkgbase}/Riven_Instructions.txt"
  install -v -D -m644 "${srcdir}/English/Manual.pdf" "${pkgdir}/usr/share/doc/${_pkgbase}/Manual.pdf"

  install -v -D -m644 "${srcdir}/license-note.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-note.txt"
  install -v -D -m644 "${srcdir}/build/Riven_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Riven_license.txt"

  ln -sv "/usr/share/licenses/${pkgname}/Riven_license.txt" "${pkgdir}/usr/share/doc/${_pkgbase}/Riven_license.txt"
}

package_riven-original-strategyguide() {
  pkgdesc="Help guide for the point-and-click adventure/ puzzle game 'Riven: The Sequel to Myst'. This is the strategy guide for the original game, not the remake."
  url='https://www.allthingsuru.com/AllThingsUru/pdf/Riven%20The%20Sequel%20to%20Myst%20Prima%20Official%20eGuide.pdf'
  license=('LicenseRef-proprietary:Prima Games')
  optdepends=(
    "riven-original: To actually launch the game just by executing '/usr/bin/riven'."
    "riven-original-data: The game data files, to be played with ScummVM."
  )
  provides=("riven-strategyguide=${pkgver}")
  conflicts=("riven-strategyguide<=${_newestoriginalver}")
  replaces=("riven-strategyguide<=${_newestoriginalver}")

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" "${srcdir}/riven-strategy-guide.pdf"
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/license-strategy-guide.txt"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/license-strategy-guide.txt" "${pkgdir}/usr/share/doc/${_pkgbase}/license-strategy-guide.txt"
}

package_riven-original-makingof() {
  pkgdesc="Movie 'The Making of Riven', a point-and-click immersive puzzle adventure game. This is for the original game, not the remake."
  url='https://archive.org/details/riven_202001'
  license=('LicenseRef-proprietary')
  optdepends=(
    'riven-original: To play the game.'
    "riven-original-soundtrack: Soundtrack of the original game of Riven."
  )
  provides=("riven-makingof=${pkgver}")
  conflicts=("riven-makingof<=${_newestoriginalver}")
  replaces=("riven-makingof<=${_newestoriginalver}")


  cd "${srcdir}"

  # install -v -D -m644 "${srcdir}/The Making of Riven/Makingof.mov" "${pkgdir}/usr/share/doc/${_pkgbase}/The_Making_of_Riven/Makingof.mov"
  install -v -D -m644 "${srcdir}/build/Makingof.mkv" "${pkgdir}/usr/share/doc/${_pkgbase}/The_Making_of_Riven/Makingof.mkv"
  install -v -D -m644 "${srcdir}/build/movie.txt" "${pkgdir}/usr/share/doc/${_pkgbase}/The_Making_of_Riven/movie.txt"

  install -v -D -m644 "${srcdir}/build/movie.txt" "${pkgdir}/usr/share/licenses/${pkgname}/The_Making_of_Riven.license.txt"
}
