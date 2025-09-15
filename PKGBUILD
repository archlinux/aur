# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_gogname="riven"
#_downloadname="riven-remake"
pkgbase="riven-remake-gog-bin"
pkgname=(
  "riven-remake-data-gog-bin"
  "riven-remake-launcher"
)
pkgver=1.7.4+gog82922
pkgrel=1
epoch=0
arch=(
  'x86_64'
)
pkgdesc="2024 remake of the game 'Riven', a puzzle adventure game with superb landscape immersion. It is different from the original also in content. You need a GOG account and have purchased the file through GOG; PKGBUILD might ask you for GOG login."
url=""
groups=(
  'games'
  'myst'
  'riven'
)
makedepends=(
  'imagemagick' # to extract icon
  'innoextract'
  'lgogdownloader'
  'libarchive' # for 'bsdtar'
  'zopfli'  # For 'zopflipng'
)
checkdepends=()
source=(
  "riven-remake.sh"
  "riven-remake.desktop"
  "license-note-proprietary.txt"
)
sha256sums=(
  '2372cbefb31a6811ca3e489258dc2c1cfad16b413a9eb02af20df9e34d9ba962'  # riven-remake.sh
  '7f5ef0faf1204ec08b1f3e08ab1fda185a9e4d9613e60ca5b42b6c0b2f36607f'  # riven-remake.desktop
  '505309383841e7007ee3177d6955a44005fdcdfd332ae88b03d1ff601512ef08'  # license-note-proprietary.txt
)

_get_gameversion() {
  ## Argumens:
  #  $1: Gamename

  if [ "$#" -lt 1 ]; then
    error "${FUNCNAME[0]}: Need to specify one argument: GOG Game name (e.g. '${_gogname}')."
    return 11
  fi

  _gamename="${1#*://}" # Strip away possibly leading '://'.

  /usr/bin/lgogdownloader --game "^${_gamename}$" --platform windows --list details | grep -E -m1 '^[[:space:]]*version:' | awk '{print $2}'
}

_get_gogversion() {
  ## Argumens:
  #  $1: Gamename

  if [ "$#" -lt 1 ]; then
    error "${FUNCNAME[0]}: Need to specify one argument: GOG Game name (e.g. '${_gogname}')."
    return 11
  fi

  _gamename="${1#*://}" # Strip away possibly leading '://'.

  /usr/bin/lgogdownloader --game "^${_gamename}$" --platform windows --list details | grep -E -m1 '^[[:space:]]*path:' | sed -E 's|^.*_\(([0-9]*)\)\..*|\1|'
}

_get_version() {
  ## Argumens:
  #  $1: Gamename

  if [ "$#" -lt 1 ]; then
    error "${FUNCNAME[0]}: Need to specify one argument: GOG Game name (e.g. '${_gogname}')."
    return 11
  fi

  printf '%s' "$(_get_gameversion "$1")+gog$(_get_gogversion "$1")"
}

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

  /usr/bin/lgogdownloader --threads 2 --verbosity 2 --directory "${_targetdir}" --no-color --save-serials --save-logo --save-icon --save-game-details-json --save-product-json --include all --include-hidden-products --exclude patches --lowspeed-timeout 60 --lowspeed-rate 128 --progress-interval 2000 --platform windows --game "^${_gamename}$" --no-fast-status-check --download
}

_get_archivename() {
  ## Argumens:
  #  $1: Gamename

  if [ "$#" -lt 1 ]; then
    error "${FUNCNAME[0]}: Need to specify one argument: GOG Game name (e.g. '${_gogname}')."
    return 11
  fi

  _gamename="${1#*://}" # Strip away possibly leading '://'.

  basename "$(/usr/bin/lgogdownloader --game "^${_gamename}$" --platform windows --list details | grep -E -m1 '^[[:space:]]*path:' | awk '{print $2}')"
}

_check_artofriven() {
  # Returns "0" if "The Art of Riven" is included in the download, "1" otherwise.
  if [ -d "${srcdir}/${_gogname}/dlc/the_art_of_riven" ]; then
    return 0
  else
    return 1
  fi
}

_check_rivencompanion() {
  # Returns "0" if "The Riven Companion" is included in the download, "1" otherwise.
  if [ -d "${srcdir}/${_gogname}/dlc/the_riven_companion" ]; then
    return 0
  else
    return 1
  fi
}

_get_artofrivenfile() {
  # Returns to stdout the path of the "The Art of Riven" download archive.
  if _check_artofriven; then
    ls -1 "${srcdir}/${_gogname}/dlc/the_art_of_riven/extras"/*.zip
  else
    return 1
  fi
}

_get_rivencompanionfile() {
  # Returns to stdout the path of the "The Riven Comanion" download archive.
  if _check_rivencompanion; then
    ls -1 "${srcdir}/${_gogname}/dlc/the_riven_companion/extras"/*.zip
  else
    return 1
  fi
}

_get_artofriven_version() {
  # Returns to stdout the version of "The Art of Riven", if it can be determined. Otherwise empty string. Exits with exitcode "1" if it is not present at all.
  if _check_artofriven; then
    basename "$(_get_artofrivenfile | tail -n1)" .zip | sed -En 's|^.*_v([^_]*)$|\1|p' | tr -d '\n'
  else
    printf '%s' ''
    return 1
  fi
}

_get_rivencompanion_version() {
  # Returns to stdout the version of "The Riven Companion", if it can be determined. Otherwise empty string. Exits with exitcode "1" if it is not present at all.
  if _check_rivencompanion; then
    basename "$(_get_rivencompanionfile | tail -n1)" .zip | sed -En 's|^.*_v([^_]*)$|\1|p' | tr -d '\n'
  else
    printf '%s' ''
    return 1
  fi
}

prepare() {
  cd "${srcdir}"
  if [ -e "${_gogname}" ]; then
    rm "${_gogname}"
  fi

  if [ -e "unpack" ]; then
    rm -Rf "unpack"
  fi

  msg2 "Downloading GOG game '${_gogname}' ..."
  _download_game "${_gogname}" "${SRCDEST}"
  ln -s "${SRCDEST}/${_gogname}" "${srcdir}/${_gogname}"

  local _archivename
  _archivename="$(_get_archivename "${_gogname}")"

  mkdir -p unpack/game

  msg2 "Extracting game data ..."
  innoextract --color off --progress --output-dir "${srcdir}/unpack/game" --extract "${srcdir}/${_gogname}/${_archivename}"

  if _check_artofriven; then
    msg2 "Extracting 'The Art of Riven' ..."
    bsdtar -C "${srcdir}/unpack" -xvf $(_get_artofrivenfile)
  fi

  if _check_rivencompanion; then
    msg2 "Extracting 'The Riven Companion' ..."
    bsdtar -C "${srcdir}/unpack" -xvf $(_get_rivencompanionfile)
  fi

  find "${srcdir}/unpack" -name '*.exe' -or -name '*.com' -or -name '*.bat' | while read _exe; do
    chmod a+x "${_exe}"
  done
}

pkgver() {
  _get_version "${_gogname}"
}

build() {
  ## 'icon.png' downloaded from GOG directly may be corrupt.
  if [ -e "${srcdir}/${_gogname}/icon.png" ]; then
    rm -f "${srcdir}/${_gogname}/icon.png"
  fi
  msg2 "Generating 'icon.png' ..."
  magick "${srcdir}/unpack/game/app"/goggame*.ico[6] "${srcdir}/${_gogname}/icon.png"
  zopflipng -m -y "${srcdir}/${_gogname}/icon.png" "${srcdir}/${_gogname}/icon.png"
}

package_riven-remake-data-gog-bin() {
  pkgdesc="2024 remake of the game 'Riven', a puzzle adventure game with superb landscape immersion. It is different from the original also in content. You need a GOG account and have purchased the file through GOG; PKGBUILD might ask you for GOG login."
  arch=('x86_64')
  license=(
    'LicenseRef-Proprietary'
    'LicenseRef-GOG_User_Agreement'
  )
  depends=()
  optdepends=(
    "riven-remake-launcher: To launch the game via wine by executing '/usr/bin/riven-remake'."
    'riven-remake-companion: For a strategy guide with hints and storytelling.'
    'the-art-of-riven-remake: For artwork and concept sketches.'
    "riven-original-data: To also play the original (1997) game 'Riven: The Sequel to Myst'."
  )
  provides=(
    "riven-remake-data=${pkgver}"
  )
  conflicts=(
    "riven-remake-data"
  )

  local _rivendir
  _rivendir='/usr/lib/riven-remake'

  install -dvm755 "${pkgdir}/${_rivendir}"
  cp -rv "${srcdir}/unpack/game"/{Engine,Riven} "${pkgdir}/${_rivendir}"/

  install -Dvm644 "${srcdir}/${_gogname}/icon.png" "${pkgdir}/usr/share/pixmaps/riven-remake.png"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/riven-remake" "${srcdir}/${_gogname}"/{logo_riven.jpg,game-details.json,product_riven.json} "${srcdir}/unpack/game"/{version.txt,Manifest*.txt,goggame*.info}

  ### If extra material has been purchased, it got downloaded. Check if it is there, and if so, install it and add it to the 'provides' array.
  if _check_artofriven; then
    provides+=("the-art-of-riven-remake")
    conflicts+=("the-art-of-riven-remake")
    install -Dvm644 -t "${pkgdir}/usr/share/doc/riven-remake/the_art_of_riven" "${srcdir}/${_gogname}/dlc/the_art_of_riven"/{logo_the_art_of_riven.jpg,product_the_art_of_riven.json}
    install -Dvm644 -t "${pkgdir}/usr/share/doc/riven-remake/the_art_of_riven" "${srcdir}/unpack"/the_art_of_riven*/*
  fi
  if _check_rivencompanion; then
    provides+=("riven-remake-companion")
    conflicts+=("riven-remake-companion")
    install -Dvm644 -t "${pkgdir}/usr/share/doc/riven-remake/the_riven_companion" "${srcdir}/${_gogname}/dlc/the_riven_companion"/{logo_the_riven_companion.jpg,product_the_riven_companion.json}
    install -Dvm644 -t "${pkgdir}/usr/share/doc/riven-remake/the_riven_companion" "${srcdir}/unpack"/the_riven_companion*/*
  fi

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/license-note-proprietary.txt"
  install -Dvm644 "${srcdir}/unpack/game/tmp/EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/GOG-EULA.txt"
}

package_riven-remake-launcher() {
  pkgdesc="Launcher script for the 2024 remake of the game 'Riven'."
  arch=('any')
  license=('GPL-3.0-or-later')
  depends=(
    "sh"
    "riven-remake-data"
    "wine"
  )
  optdepends=(
    "riven-original: To also play the original (1997) game 'Riven: The Sequel to Myst'."
  )
  provides=(
    "riven-remake=${pkgver}"
  )
  conflicts=()

  install -Dvm755 "${srcdir}/riven-remake.sh" "${pkgdir}/usr/bin/riven-remake"
  install -Dvm644 "${srcdir}/riven-remake.desktop" "${pkgdir}/usr/share/applications/riven-remake.desktop"

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "/usr/share/licenses/spdx/GPL-3.0-or-later.txt" .
}
