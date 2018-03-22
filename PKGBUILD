# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Sebastien Duthil <duthils@free.fr>
# Contributor: mickael9 <mickael9@gmail.com>

pkgname=factorio-experimental
pkgver=0.16.34
pkgrel=1
pkgdesc="A 2D game about building and maintaining factories (experimental branch)."
arch=('x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
conflicts=('factorio' 'factorio-demo')
provides=("factorio=$pkgver")
depends=('libxcursor' 'gcc-libs' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')
md5sums=('5cacd198a3156c157a482aeab368e9a1'
         '22fce67d66c080fa5c89ab437b3d8724')
source=(factorio.desktop LICENSE)
options=(!strip)
_url=https://www.factorio.com/get-download/${pkgver}/alpha/linux64
_gamepkg=factorio_alpha_x64_${pkgver}.tar.xz

build() {
  msg "You need a full copy of this game in order to install it"

  while true; do
    _find_pkgpath_from_dir
    [[ -f "${pkgpath}/${_gamepkg}" ]] && break

    # could not find the path automatically, ask the user
    _find_pkgpath_from_input
    [[ -f "${pkgpath}/${_gamepkg}" ]] && break

    # if user entered nothing, try to download
    _find_pkgpath_from_download
    [[ -f "${pkgpath}/${_gamepkg}" ]] && break

    error "Unable to find game package."
    [[ ! -t 0 ]] && return 1

    read -n1 -p "Try again? (Y/n) " try_again ; echo
    [[ "${try_again,,*}" == "n" ]] && return 1
  done

  # unpack game tarball
  msg "Found game package, unpacking..."
  tar xf "${pkgpath}/${_gamepkg}" -C "${srcdir}"
}

# no modifications needed, the executable looks for:
# - data in /usr/share/factorio
# - config in ~/.factorio

package() {
  cd "${srcdir}/factorio"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/factorio"
  install -d "${pkgdir}/usr/share/licenses/factorio"

  install -m755 "bin/x64/factorio" "${pkgdir}/usr/bin/factorio"
  cp -r data/* "${pkgdir}/usr/share/factorio"
  install -m644 "${srcdir}/factorio.desktop" "${pkgdir}/usr/share/applications/factorio.desktop"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/factorio/LICENSE"
}

_find_pkgpath_from_dir() {
  local pkgpaths_tries=()
  [[ $SRCDEST != $startdir ]] && pkgpaths_tries+=("$SRCDEST")
  pkgpaths_tries+=("$startdir" "$HOME" "${XDG_DOWNLOAD_DIR:-$HOME/Downloads}")

  msg "Searching for ${_gamepkg} in:"

  for pkgpath_try in "${pkgpaths_tries[@]}"; do
    msg2 "$pkgpath_try"
    if [[ -f "${pkgpath_try}/${_gamepkg}" ]]; then
      pkgpath=${pkgpath_try}
      break
    fi
  done

  if [[ -z $pkgpath ]]; then
    warning "Game package not found"
  else
    msg "Game package found"
  fi
}

_find_pkgpath_from_input() {
  # don't interact if standard input isn't a terminal
  # or if we should download the game using FACTORIO_LOGIN and FACTORIO_PASSWORD

  [[ ! -t 0 || -n "$FACTORIO_LOGIN" ]] && return

  while [[ ! -f "${pkgpath}/${_gamepkg}" ]]; do
    read -rp "Please provide the path to the directory containing ${_gamepkg} or leave blank to download it using your Factorio credentials: " pkgpath
    [[ -z $pkgpath ]] && break

    # perform tilde expansion
    pkgpath="${pkgpath/#"~/"/$HOME/}"
    [[ $pkgpath = "~" ]] && pkgpath="$HOME"

    # also accept a full path to the file if it has the right name
    if [[ -f $pkgpath && ${pkgpath##*/} = ${_gamepkg} ]]; then
      pkgpath=${pkgpath%/*}
    fi

    if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
      error "${_gamepkg} not found in ${pkgpath}"
    fi
  done
}

_find_pkgpath_from_download() {
  msg "Downloading game using Factorio credentials"

  local cookie=$(mktemp)

  while [[ -z "${pkgpath}" ]] ; do
    local login="$FACTORIO_LOGIN"
    local password="$FACTORIO_PASSWORD"
    local file="${SRCDEST}/${_gamepkg}"

    if [[ -z $login || -z $password ]]; then
      [[ ! -t 0 ]] && return
      read -rp "Username or email: " login
      [[ -z "${login}" ]] && break
      read -rsp "Password: " password ; echo
      [[ -z "${password}" ]] && break
    fi

    msg2 "Logging in..."
    local csrf_token=$(
      curl --silent --fail \
           --cookie-jar "$cookie" \
           https://www.factorio.com/login \
      | grep -Po '(?<=name="csrf_token" type="hidden" value=")[^"]+'
    )

    if [[ -z "$csrf_token" ]]; then
      error "Could not find the CSRF token. This script might be broken."
      break
    fi

    local output=$(
      curl --dump-header - \
           --silent --fail \
           --cookie-jar "$cookie" \
           --cookie "$cookie" \
           https://www.factorio.com/login \
           --data-urlencode username_or_email="$login" \
           --data-urlencode password="$password" \
           --data-urlencode csrf_token="$csrf_token" \
    )

    if ! echo "$output" | grep -q '^Location: '; then
      error "Login failed"
      read -n1 -p "Retry login? (Y/n) " try_again ; echo
      if [[ "${try_again,,*}" == "n" ]]; then
        break
      else
        continue
      fi
    fi

    msg2 "Downloading ${_gamepkg} from ${_url} ..."

    curl --retry 10 --retry-delay 3 \
         --fail --location \
         --cookie "${cookie}" \
         --continue-at - \
         --output "${file}.part" \
         "${_url}" \
    || rm -f "${file}.part"

    if [[ ! -f "${file}.part" ]]; then
      error "Download failed"
      break
    fi

    msg2 "Download successful"
    mv "${file}"{.part,}
    pkgpath="${SRCDEST}"
  done

  rm $cookie
}
