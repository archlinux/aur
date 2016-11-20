# Maintainer: Sebastien Duthil <duthils@free.fr>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=factorio
pkgver=0.14.20
pkgrel=1
pkgdesc="A 2D game about building and maintaining factories."
arch=('i686' 'x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
conflicts=('factorio-demo' 'factorio-experimental' 'factorio-headless')
depends=('libxcursor' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')
source=(factorio.desktop
        LICENSE)
sha256sums=('5f62aa7763f9ad367a051371bc16f3c174022bb3380eb221ba06bac395bf9815'
            '67ec2f88afff5d7e0ca5fd3301b5d98655269c161a394368fa0ec49fbc0c0e21')
if test "$CARCH" == i686; then
  __factorio_arch=i386
  _url=https://www.factorio.com/get-download/${pkgver}/alpha/linux32
elif test "$CARCH" == x86_64; then
  __factorio_arch=x64
  _url=https://www.factorio.com/get-download/${pkgver}/alpha/linux64
fi
_gamepkg=factorio_alpha_${__factorio_arch}_$pkgver.tar.gz
_pkgpaths_tries=("$startdir"
                 "$SRCDEST"
                 "$HOME/Downloads")

build() {
  msg "You need a full copy of this game in order to install it"

  _find_pkgpath_from_dir

  # could not find the path automatically, ask the user
  if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
      _find_pkgpath_from_input
  fi

  # if user entered nothing, try to download
  if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
      _find_pkgpath_from_download
  fi

  # if download failed, ask the user again
  if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
      _find_pkgpath_from_input
  fi

  if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
      error "Unable to find game package."
      return 1
  fi

  # unpack game tarball
  msg "Found game package, unpacking..."
  tar xzf "${pkgpath}/${_gamepkg}" -C "${srcdir}"
}

# no modifications needed, the executable looks for:
# - data in /usr/share/factorio
# - config in ~/.factorio

package() {
  cd "$srcdir/factorio"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -g games -m 775 -d "${pkgdir}/usr/share/factorio"
  install -d "${pkgdir}/usr/share/licenses/factorio"

  install -m755 "bin/${__factorio_arch}/factorio" "$pkgdir/usr/bin/factorio"
  cp -r data/* "$pkgdir/usr/share/factorio"
  install -m644 "${srcdir}/factorio.desktop" "${pkgdir}/usr/share/applications/factorio.desktop"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/factorio/LICENSE"
}

_find_pkgpath_from_dir() {
  for pkgpath_try in "${_pkgpaths_tries[@]}" ; do
    msg "Searching for ${_gamepkg} in dir: \"${pkgpath_try}\""
    if [[ -f "${pkgpath_try}/${_gamepkg}" ]]; then
      pkgpath=${pkgpath_try}
      break
    fi
  done
  if [[ -z "${pkgpath}" ]] ; then
    error "Game package not found."
  fi
}

_find_pkgpath_from_input() {
    read -p "Please provide the path to the directory containing ${_gamepkg} (e.g. /home/joe). Leave blank to download from https://factorio.org: " pkgpath
}

_find_pkgpath_from_download() {
  local cookie=$(mktemp)

  while [[ -z "${pkgpath}" ]] ; do
    local login
    local password
    local file="${SRCDEST}/${_gamepkg}"

    read -p "Username or email: " login
    if [[ -z "${login}" ]]; then
      break
    fi
    read -sp "Password: " password ; echo
    if [[ -z "${password}" ]]; then
      break
    fi

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

    if ! echo "$output" | grep -q '^Location: '; then
      error "Login failed"
      read -p "Try again? (Y/n) " try_again
      if [[ "${try_again}" == "n" ]] ; then
        break
      else
        continue
      fi
    fi

    msg2 "Logged in"
    msg "Downloading ${_gamepkg} from $_url ..."

    curl --fail --location \
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
