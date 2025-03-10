# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributpr: enricostn (https://aur.archlinux.org/account/enricostn)

_gogname="day_of_the_tentacle_remastered"
pkgbase="day-of-the-tentacle-remastered-gog-bin"
pkgname=(
  "day-of-the-tentacle-remastered-bin"
)
_pkgver_game="1.4.1"
_pkgver_gog="2.1.0.2"
pkgver=1.4.1+gog2.1.0.2
pkgrel=10
epoch=1
arch=(
  'i686'
  'x86_64'
)
pkgdesc="Day of the Tentacle Remastered. You need a GOG account and have purchased the file through GOG; PKGBUILD might ask you for GOG login."
url="https://www.doublefine.com/games/day-of-the-tentacle-remastered"
license=(
  'LicenseRef-Proprietary'
  'LicenseRef-GOG_User_Agreement'
  'Zlib'
  'GPL-2.0-or-later'
  'GPL-3.0-or-later'
)
groups=('games')
makedepends=(
  'gogextract'
  'lgogdownloader'
  'zopfli'  # for 'zopflipng'
  # 'wyvern'
)
checkdepends=()
changelog="dott.changelog"
_archivename="gog_day_of_the_tentacle_remastered_${_pkgver_gog}.sh"
source=(
  "dott.desktop"
  "dott.changelog"
  "license-note-proprietary.txt"
)
sha256sums=(
  'f3f6ce50a0dabaa344b66d7c70c828714a45944f2043170530b0cba715328d0d'  # dott.desktop
  'b3cc9cfcc82ac701a9a543c4b8d351786b0c8e24c38386d762a9ad6ffa167cb4'  # dott.changelog
  'c75b0fc50592bf1bccbd9556efdd52894c08ffde633d35e6f2f1dfc50ce1b55e'  # license-note-proprietary.txt
)

_download_game() {
  ## Argumens:
  #  $1: Gamename
  #  $2: Output directory

  if [ "$#" -lt 2 ]; then
    error "${FUNCNAME[0]}: Need to specify two arguments: 1.: GOG Game name (e.g. '${_gogname}'), 2.: Output directory (use '\${SRCDEST}')."
    return 11
  fi

  local _gamename
  local _targetdir

  _gamename="${1#*://}" # Strip away possibly leading '://'.
  _targetdir="$2"

  /usr/bin/lgogdownloader --verbosity 2 --directory "${_targetdir}" --no-color --save-serials --save-logo --save-icon --save-game-details-json --save-product-json --include i,p,l --include-hidden-products --lowspeed-timeout 60 --lowspeed-rate 128 --progress-interval 2000 --platform linux --game "${_gamename}" --download
}

prepare() {
  cd "${srcdir}"
  if [ -e "${_gogname}" ]; then
    rm "${_gogname}"
  fi
  if [ -e "data.zip" ]; then
    rm "data.zip"
  fi
  if [ -e "unpack" ]; then
    rm -Rf "unpack"
  fi

  msg2 "Downloading GOG game '${_gogname}' ..."
  _download_game "${_gogname}" "${SRCDEST}"
  ln -s "${SRCDEST}/${_gogname}" "${srcdir}/${_gogname}"

  mkdir -p unpack

  msg2 "Extracting game data ..."
  gogextract -g "${srcdir}/unpack" "${srcdir}/${_gogname}/${_archivename}"
}

pkgver() {
  cd "${srcdir}/unpack"
  source support/gog_com.shlib
  _ver_developer="$(get_gameinfo 3)"
  _ver_gog="$(get_gameinfo 2)"
  printf '%s' "${_ver_developer}+gog${_ver_gog}"
}

build() {
  msg2 "Size-optimising 'icon.png' ..."
  zopflipng -m -y "${srcdir}/unpack/support/icon.png" "${srcdir}/unpack/support/icon.png"
}

package_day-of-the-tentacle-remastered-bin() {
  pkgdesc="Day of the Tentacle Remastered. You need a GOG account and have purchased the file through GOG; PKGBUILD might ask you for GOG login."
  arch=(
    'i686'
    'x86_64'
  )
  depends=()
  depends_i686=(
    'alsa-lib'
    'mesa-libgl'
  )
  depends_x86_64=(
    'lib32-alsa-lib'
    'lib32-libudev0-shim'
    'lib32-mesa-libgl'
  )
  optdepends_i686=(
    'libxrandr: multi-monitor support'
    'libxinerama: multi-monitor support'
  )
  optdepends_x86_64=(
    'lib32-libxrandr: multi-monitor support'
    'lib32-libxinerama: multi-monitor support'
  )
  provides=(
    "dott=20161228"  # Originally, this package was named 'dott', version 20161228.
    "day-of-the-tentacle-remastered-gog-bin=${pkgver}"
    "day-of-the-tentacle-remastered=${pkgver}"
    "day-of-the-tentacle"
  )
  conflicts=(
    "dott"
    "day-of-the-tentacle-remastered-gog-bin"
    "day-of-the-tentacle-remastered"
    "day-of-the-tentacle"
  )
  replaces=(
    "day-of-the-tentacle-remastered-gog-bin=1.4.1+gog2.1.0.2"  # Since we made a split package, we now name the actual package not anymore with `-gog`, only the package base. Since GOG specifities are only relevant for source download and extraction, not for installation.
    "dott<=20161228"  # Originally, this package was named 'dott', version 20161228.
  )

  install -Dvm755 -t "${pkgdir}/usr/lib/dott"     "${srcdir}/unpack/game/Dott"
  install -Dvm644 -t "${pkgdir}/usr/lib/dott"     "${srcdir}/unpack/game"/{tenta.cle,controllerdef.txt}
  install -Dvm755 -t "${pkgdir}/usr/lib/dott/lib" "${srcdir}/unpack/game/lib"/*

  install -dvm755 "${pkgdir}/usr/bin"
  ln -sv "/usr/lib/dott/Dott" "${pkgdir}/usr/bin/dott"

  install -Dvm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/dott.desktop"
  install -Dvm644 "${srcdir}/unpack/support/icon.png" "${pkgdir}/usr/share/pixmaps/dott.png"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/dott" "${srcdir}/${_gogname}"/{game-details.json,product.json,logo.jpg} "${srcdir}/unpack"/{gameinfo,docs/installer_readme.txt,support/support_notice.txt,game/readme.txt}
  install -Dvm644  "${srcdir}/unpack/docs/End User License Agreement.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/Tools_End_User_License_Agreements.txt"
  install -Dvm644  "${srcdir}/license-note-proprietary.txt"                "${pkgdir}/usr/share/licenses/${pkgname}/license-note-proprietary.txt"
  ln -svr          "${pkgdir}/usr/share/licenses/${pkgname}"/*             "${pkgdir}/usr/share/doc/dott"/
}
