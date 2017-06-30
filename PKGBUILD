# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Sebastien Duthil <duthils@free.fr>

pkgname=factorio-experimental
pkgver=0.15.26
pkgrel=1
pkgdesc="A 2D game about building and maintaining factories (experimental branch)"
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

  local pkgpaths_tries=()
  [[ $SRCDEST != $startdir ]] && pkgpaths_tries+=("$SRCDEST")
  pkgpaths_tries+=("$startdir" "$HOME" "${XDG_DOWNLOAD_DIR:-$HOME/Downloads}")

  for pkgpath_try in "${pkgpaths_tries[@]}"; do
    [[ -z "$pkgpath_try" ]] && continue

    msg "Searching for ${_gamepkg} in \"${pkgpath_try}\""
    if [[ -f "${pkgpath_try}/${_gamepkg}" ]]; then
      pkgpath="${pkgpath_try}"
      break
    fi
  done

  while [[ ! -f "${pkgpath}/${_gamepkg}" ]]; do
    error "Game package not found."
    if [[ -n $FACTORIO_LOGIN && -n $FACTORIO_PASSWORD ]]; then
      msg "Using Factorio credentials from environ: username is $FACTORIO_LOGIN"
      _download && pkgpath="$SRCDEST" || true
      break
    else
      read -rp "Please provide the path to the directory containing ${_gamepkg} or leave blank to download the game using your Factorio credentials:" pkgpath
    fi

    if [[ -z "$pkgpath" ]]; then
      _download && pkgpath="$SRCDEST" || true
    fi
  done

  msg "Found game package, unpacking..."
  tar xf "${pkgpath}/${_gamepkg}" -C "${srcdir}"
}

# no modifications needed, the executable looks for:
# - data in /usr/share/factorio
# - config in ~/.factorio

package() {
  cd "$srcdir/factorio"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/factorio"
  install -d "${pkgdir}/usr/share/licenses/factorio"
  install -d -m777 "${pkgdir}/usr/share/factorio/scenario-pack"

  install -m755 "bin/x64/factorio" "$pkgdir/usr/bin/factorio"
  cp -r data/* "$pkgdir/usr/share/factorio"
  install -m644 "${srcdir}/factorio.desktop" "${pkgdir}/usr/share/applications/factorio.desktop"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/factorio/LICENSE"
}

_download() {
  local cookie=$(mktemp)
  local ret=1

  while true; do
    local login="$FACTORIO_LOGIN"
    local password="$FACTORIO_PASSWORD"
    local file="${SRCDEST}/${_gamepkg}"

    if [[ -z $login || -z $password ]]; then
      read -rp "Username or email: " login
      [[ -n $login ]] && read -rsp "Password: " password ; echo
    fi

    if [[ -n $login && -n $password ]]; then
      msg "Logging in..."
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

      if echo "$output" | grep -q '^Location: '; then
        msg2 "Logged in"
        msg "Downloading ${_gamepkg} from $_url ..."

        curl --retry 10 --retry-delay 3 \
             --fail --location \
             --cookie "$cookie" \
             --continue-at - \
             --output "${file}.part" \
             "$_url" \
        || rm -f "${file}.part"

        if [[ -f "${file}.part" ]]; then
          ret=0
          msg2 "Download successful"
          mv "${file}"{.part,}
        else
          error "Download failed"
        fi
        break
      else
        error "Login failed"
        #echo "$output"
        read -rp "Try again? (Y/n)"
        [[ $REPLY == n ]] && break
      fi
    else
      break
    fi
  done

  rm $cookie
  return $ret
}
