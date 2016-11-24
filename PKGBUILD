# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Sebastien Duthil <duthils@free.fr>

pkgname=factorio-experimental
pkgver=0.14.21
pkgrel=1
pkgdesc="A 2D game about building and maintaining factories (experimental branch)"
arch=('i686' 'x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
conflicts=('factorio' 'factorio-demo')
depends=('libxcursor' 'gcc-libs' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')
md5sums=('5cacd198a3156c157a482aeab368e9a1'
         '22fce67d66c080fa5c89ab437b3d8724')
source=(factorio.desktop LICENSE)
options=(!strip)

if [ "${CARCH}" = "i686" ]; then
  _factorio_arch=i386
  _url=https://www.factorio.com/get-download/${pkgver}/alpha/linux32
else
  _factorio_arch=x64
  _url=https://www.factorio.com/get-download/${pkgver}/alpha/linux64
fi
_gamepkg=factorio_alpha_${_factorio_arch}_${pkgver}.tar.gz

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
    read -p "Please provide the path to the directory containing ${_gamepkg} or leave blank to download the game using your Factorio credentials:" pkgpath

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

  install -m755 "bin/${_factorio_arch}/factorio" "$pkgdir/usr/bin/factorio"
  cp -r data/* "$pkgdir/usr/share/factorio"
  install -m644 "${srcdir}/factorio.desktop" "${pkgdir}/usr/share/applications/factorio.desktop"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/factorio/LICENSE"
}

_download() {
  local cookie=$(mktemp)
  local ret=1

  while true; do
    local login
    local password
    local file="${SRCDEST}/${_gamepkg}"

    read -p "Username or email: " login
    [[ -n $login ]] && read -sp "Password: " password ; echo

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
        read -p "Try again? (Y/n)"
        [[ $REPLY == n ]] && break
      fi
    else
      break
    fi
  done

  rm $cookie
  return $ret
}
