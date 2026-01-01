# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_gogname="viewfinder"
#_downloadname="viewfinder-remake"
pkgbase="viewfinder-gog-bin"
pkgname=(
  "viewfinder-data-gog-bin"
  "viewfinder-launcher"
)
pkgver=1.0.6+gog80943
pkgrel=1
epoch=0
arch=(
  'x86_64'
)
pkgdesc="A puzzle video game based on mapping photographs or other two-dimension works onto the three-dimensional space of the game's world, creating new geometries and layouts. You need a GOG account and have purchased the file through GOG; PKGBUILD might ask you for GOG login."
url="https://thunderfulgames.com/games/viewfinder/"
# url="https://en.wikipedia.org/wiki/Viewfinder_(video_game)"
groups=(
  'games'
)
makedepends=(
  #'imagemagick' # to extract icon
  'innoextract'
  'lgogdownloader'
  #'libarchive'  # for 'bsdtar'
  #'zopfli'      # For 'zopflipng'
)
checkdepends=()
source=(
  "viewfinder.sh"
  "viewfinder.desktop"
  "license-note-proprietary.txt"
  "thunderfulgames-EULA.html::https://thunderfulgames.com/privacy-policy/thunderfulgames-end-user-licence-agreement/"
)
sha256sums=(
  '603702ba7c13e982f2d36eacbe16930639ad49d893b9ef6e0f44dee2d3728fd9'  # viewfinder.sh
  'cdd4d852c651f228121455a97c3f293b63a79e629bd0c2706a2871f31296738c'  # viewfinder.desktop
  '911d46210699f7e6f453bb2ed7a6d8f1baeeabd6b724e04d8a83361e2e18da4c'  # license-note-proprietary.txt
  'SKIP'  # thunderfulgames-EULA.html
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

  local _exe
  find "${srcdir}/unpack" -name '*.exe' -or -name '*.com' -or -name '*.bat' | while read _exe; do
    chmod a+x "${_exe}"
  done
}

pkgver() {
  _get_version "${_gogname}"
}

build() {
  ## 'icon.png' downloaded from GOG directly may be corrupt.
  if [ -e "${srcdir}/${_gogname}/icon_viewfinder.png" ]; then
    rm -f "${srcdir}/${_gogname}/icon_viewfinder.png"
  fi
  msg2 "Generating 'icon.png' ..."
  magick "${srcdir}/unpack/game/app"/goggame*.ico[6] "${srcdir}/${_gogname}/icon_viewfinder.png"
  zopflipng -m -y "${srcdir}/${_gogname}/icon_viewfinder.png" "${srcdir}/${_gogname}/icon_viewfinder.png"
}

package_viewfinder-data-gog-bin() {
  pkgdesc="A puzzle video game based on mapping photographs or other two-dimension works onto the three-dimensional space of the game's world, creating new geometries and layouts."
  arch=('x86_64')
  license=(
    'LicenseRef-Proprietary'
    'LicenseRef-GOG_User_Agreement'
  )
  depends=()
  optdepends=(
    "viewfinder-launcher: To launch the game via wine by executing '/usr/bin/viewfinder'."
  )
  provides=(
    "viewfinder-data=${pkgver}"
  )
  conflicts=(
    "viewfinder-data"
  )

  local _viewfinderdir
  _viewfinderdir='/usr/lib/viewfinder'

  install -dvm755 "${pkgdir}/${_viewfinderdir}"
  #cp -rv "${srcdir}/unpack/game"/{Viewfinder_Data,Viewfinder.exe,UnityPlayer.dll,GameAssembly.dll,baselib.dll,UnityCrashHandler64.exe,GalaxyConfig.json} "${pkgdir}/${_viewfinderdir}"/
  cp -rv "${srcdir}/unpack/game"/* "${pkgdir}/${_viewfinderdir}"/

  install -Dvm644 "${srcdir}/${_gogname}/icon_viewfinder.png" "${pkgdir}/usr/share/pixmaps/viewfinder.png"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/viewfinder" "${srcdir}/${_gogname}"/{logo_viewfinder.jpg,game-details.json,product_viewfinder.json} "${srcdir}/unpack/game"/{goggame*.info,goggame*.script}

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/license-note-proprietary.txt" "${srcdir}/thunderfulgames-EULA.html"
  install -Dvm644 "${srcdir}/unpack/game/tmp/EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/GOG-EULA.txt"
}

package_viewfinder-launcher() {
  pkgdesc="Launcher script for the game 'Viewfinder'."
  arch=('any')
  license=('GPL-3.0-or-later')
  depends=(
    "sh"
    "viewfinder-data"
    "wine"
  )
  optdepends=()
  provides=(
    "viewfinder=${pkgver}"
  )
  conflicts=()

  install -Dvm755 "${srcdir}/viewfinder.sh" "${pkgdir}/usr/bin/viewfinder"
  install -Dvm644 "${srcdir}/viewfinder.desktop" "${pkgdir}/usr/share/applications/viewfinder.desktop"

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv "/usr/share/licenses/spdx/GPL-3.0-or-later.txt" .
}
