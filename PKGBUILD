# Previous maintainer: Syaddad Ali Sulaiman Hakim <contact at mail dot whysadad dot com>
# Current  maintainer: Anton Samartsev <kycko at archlinux dot org>

_sname="upnote"
_pkgname=UpNote
_website="get${_sname}.com"
_deskfile="${_sname}.desktop"
_squashroot="squashfs-root"

pkgname=${_sname}-appimage
pkgver=9.21.0
pkgrel=3
_appimageOrig="${_pkgname}-${pkgver}.AppImage"

pkgdesc="Cross-platform note-taking application"
arch=('x86_64')
url="https://${_website}/"
license=('custom')
provides=("${_sname}")
conflicts=("${_sname}")
makedepends=('desktop-file-utils')
options=('!strip')
source=("${_appimageOrig}::https://download.${_website}/app/${_pkgname}.AppImage"
        "${_deskfile}")
sha256sums=('SKIP'
            '8977530cdac21641becea2b94f97a1ffc8995793008bafecf619cc9c112dcf57')
noextract=("${_appimageOrig}")

check() {
  cd "$srcdir"
  desktop-file-validate "${_deskfile}"
}

package() {
  cd "$srcdir"

  install -Dm755 "${_appimageOrig}" "$pkgdir/usr/bin/${_sname}"
  install -Dm644 "${_deskfile}"     "$pkgdir/usr/share/applications/${_deskfile}"

  chmod +x "${_appimageOrig}"
  ./"${_appimageOrig}" --appimage-extract &>/dev/null

  local _icon_found=0
  for _icon in "${_sname}.png" "${_sname}.svg" "icon.png"; do
    if [ -f "${_squashroot}/${_icon}" ]; then
      install -Dm644 "${_squashroot}/${_icon}" "$pkgdir/usr/share/pixmaps/${_sname}.${_icon##*.}"
      _icon_found=1
      break
    fi
  done

  if [ "${_icon_found}" -eq 0 ]; then
    msg2 "Warning: Could not automatically find an icon file (${_sname}.png/svg or icon.png) within the AppImage."
    msg2 "         Desktop entry icon might be missing."
  fi

  find "${_squashroot}" -maxdepth 1 -iname 'LICENSE*' -print -exec install -Dm644 {} "$pkgdir/usr/share/licenses/$pkgname/LICENSE" \; || true
}
