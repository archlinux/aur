# Maintainer: Sunny <brainworms2002 at gmail dot com>

_pkgname="azahar"
pkgname="$_pkgname-appimage"

pkgver=2121

pkgrel=1
epoch=1
pkgdesc="Azahar is an open-source 3DS emulator project based on Citra. (already compiled)"
url="https://azahar-emu.org"
license=("GPL2")
arch=("x86_64")
provides=("$_pkgname")
conflicts=("$_pkgname"
	   "$_pkgname-git")
replaces=()
depends=("ffmpeg"
         "sdl2")

_source_main() {
  _appimage="$_pkgname.AppImage"
  source=("https://github.com/azahar-emu/azahar/releases/download/$_pkgver/$_pkgname.AppImage")
  sha256sums=('SKIP')
}

options=("!strip")
build() {
  # extract
  chmod +x "$_appimage"
  "./$_appimage" --appimage-extract

  # icon
  for i in squashfs-root/*.svg; do
    [ -f "$i" ] && install -Dm755 "$i" "$_pkgname.svg" && break
  done
}

package() {
  # appimage
  install -Dm755 "$_pkgname.AppImage" "$pkgdir/usr/bin/azahar"

  # icon
  install -Dm644 "$_pkgname.svg" -t "$pkgdir/usr/share/pixmaps/"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Azahar
GenericName=$pkgdesc
Comment=$pkgdesc
TryExec=$_pkgname
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
StartupNotify=true
StartupWMClass=$_pkgname
Categories=Game;Emulator;
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]]; then
    return
  fi

  local _response _pkgver_new
  _response=$(curl -Ssf "$url/releases.atom")

  _pkgver_new=$(
    printf '%s' "$_response" \
      | grep '/releases/tag/' \
      | sed -E 's@^.*/releases/tag/(.*)".*$@\1@; s@^v@@' \
      | grep -Ev '[a-z]{2}' | sort -V | tail -1
  )

  # update _pkgver
  if [ $(vercmp "${_pkgver_new:?}" "$_pkgver") -gt 0 ]; then
    _pkgver="${_pkgver_new:?}"
  fi
}

_update_version
_source_main
