# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Sebastien Duthil <duthils@free.fr>

pkgname=factorio-experimental
pkgver=0.13.2
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

  local pkgpaths_tries=("$startdir" "$srcdir" "${XDG_DOWNLOAD_DIR:-$HOME/Downloads}")
  [[ $SRCDEST != $startdir ]] && pkgpath_tries+=("$SRCDEST")

  for pkgpath_try in "${pkgpaths_tries[@]}"; do
    [[ -z "$pkgpath_try" ]] && continue

    msg "Searching for ${_gamepkg} in \"${pkgpath_try}\""
    if [[ -f "${pkgpath_try}/${_gamepkg}" ]]; then
      pkgpath="${pkgpath_try}"
      break
    fi
  done

  if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
    read -s -n1 -p "Do you want to use your factorio credentials to download the game ? (y/N)" ; echo

    if [[ $REPLY == y ]]; then
      _download && pkgpath=$srcdir || true
    fi
  fi

  if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
    error "Game package not found, please type absolute path to ${_gamepkg} (/home/joe):"
    read pkgpath
    if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
      error "Unable to find game package." && return 1
    fi
  fi

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
    local file="${srcdir}/${_gamepkg}"

    read -p "Username or email: " login
    [[ -n $login ]] && read -sp "Password: " password ; echo

    if [[ -n $login && -n $password ]]; then
      msg "Logging in..."

      if curl -D - -o /dev/null -s -f -c "$cookie" https://www.factorio.com/login -d username-or-email="$login" -d password="$password" | grep -q '^Location: /'; then
        msg2 "Logged in"
        msg "Downloading ${_gamepkg} from $_url ..."
        curl -f -b "$cookie" -L -o "${file}.part" "$_url" || rm -f "${file}.part"

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
        read -s -n1 -p "Try again? (y/N)" ; echo
        [[ $REPLY != y ]] && break
      fi
    else
      break
    fi
  done

  rm $cookie
  return $ret
}
