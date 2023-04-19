# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Sebastien Duthil <duthils@free.fr>
# Contributor: mickael9 <mickael9@gmail.com>

pkgname=factorio-experimental
pkgver=1.1.81
pkgrel=1
pkgdesc="A 2D game about building and maintaining factories (experimental branch)."
arch=('x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
conflicts=('factorio' 'factorio-demo')
provides=("factorio=$pkgver")
depends=('libxcursor' 'gcc-libs' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')
makedepends=('jq')
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
  # or if we should download the game using FACTORIO_LOGIN and FACTORIO_PASSWORD / FACTORIO_TOKEN

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

  local file="${SRCDEST}/${_gamepkg}"
  local token_file="$HOME/.factorio/player-data.json"
  local use_token=1
  local used_token=

  while [[ -z ${pkgpath} ]] ; do
    local username=$FACTORIO_LOGIN
    local password=$FACTORIO_PASSWORD
    local token=$FACTORIO_TOKEN

    if [[ -n $username && ( -n $password || -n $token) ]]; then
      msg "Downloading using credentials from environment"
    elif [[ -n $use_token && -r $token_file && -z $username && -z $token ]]; then
      username=$(jq -r '."service-username" | strings' "$token_file") || username=
      token="$(jq -r '."service-token" | strings' "$token_file")" || token=

      if [[ -n $username && -n $token ]]; then
        msg "Downloading using token from $token_file"
        used_token=1
      fi
    fi

    if [[ -z $token ]]; then
      if [[ -z $username || -z $password ]]; then
        [[ ! -t 0 ]] && return

        msg "Downloading using Factorio credentials"

        msg2 "Please provide your Factorio username/email along with your game token or password"
        msg2 "Your token can be found in your factorio profile and grants limited access to your account."

        read -rp "Username or email: " username
        [[ -z $username ]] && break

        read -rp "Game token (leave blank for password authentication): " token

        if [[ -z $token ]]; then
          read -rsp "Password: " password ; echo
          [[ -z $password ]] && break
        fi
      fi
    fi

    if [[ -z $token ]]; then
      msg2 "Logging in..."

      local output
      if output=$(curl --silent \
                       https://auth.factorio.com/api-login \
                       --data-urlencode username="$username" \
                       --data-urlencode password="$password" \
                       --data-urlencode require_game_ownership=true \
                       --data-urlencode api_version=2
      ) && token=$(echo "$output" | jq -r '.token | strings') \
        && username=$(echo "$output" | jq -r '.username | strings') \
        && [[ -n $token && -n $username ]]
      then
        if [[ -t 0 && (! -e $token_file || -w $token_file) ]]; then
          read -n1 -p "Store game token in $token_file for in-game authentication? (Y/n) " ; echo
          if [[ -z $REPLY || $REPLY == [yY] ]]; then
            local player_data='{}'
            [[ -r "$token_file" ]] && player_data=$(< "$token_file")
            if player_data=$(echo "$player_data" |
                               jq -r '."service-username" = $user | ."service-token" = $token' \
                                  --arg user "$username" \
                                  --arg token "$token")
            then
              echo "$player_data" > "$token_file"
            else
              error "Could not store game token (player-data.json corrupted?)"
            fi
          fi
        fi
      else
        msg=$(echo "$output" | jq -r .message) || msg="unknown error"
        error "Login failed: $msg"

        [[ ! -t 0 ]] && break
        read -n1 -p "Retry login? (Y/n) " try_again ; echo
        if [[ "${try_again,,*}" == "n" ]]; then
          break
        else
          continue
        fi
      fi
    fi

    msg2 "Downloading ${_gamepkg} from ${_url} ..."

    code=$(curl -G --retry 10 --retry-delay 3 \
         --fail --location \
         --continue-at - \
         --output "${file}.part" \
         "${_url}" \
         --data-urlencode username="$username" \
         --data-urlencode token="$token" \
         --write-out '%{http_code}'
    ) || rm -f "${file}.part"

    if [[ ! -f "${file}.part" ]]; then
      error "Download failed"
      if [[ $code == 403 && -n $used_token ]]; then
        msg "Trying again without token from player-data.json"
        use_token=
        continue
      fi
      break
    fi

    msg2 "Download successful"
    mv "${file}"{.part,}
    pkgpath="${SRCDEST}"
  done
}
