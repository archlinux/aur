if [ -z "$_srcinfo" ] && [ -z "$_pkgver" ]; then
  : ${_autoupdate:=true}
fi

_pkgname="pcsx2"
pkgname="$_pkgname-appimage"
pkgver=2.3.409
pkgrel=1
pkgdesc="PlayStation 2 emulator (AppImage version)"
url="https://github.com/PCSX2/pcsx2"
license=('GPL-3.0-or-later')
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
_source_main() {
  _appimage="pcsx2-v$_pkgver-linux-appimage-x64-Qt.AppImage"
  source=("$url/releases/download/v$_pkgver/$_appimage")
  sha256sums=('SKIP')
}

pkgver() {
  printf '%s' "${_pkgver:?}"
}
build() {
  # extract
  chmod +x "$_appimage"
  "./$_appimage" --appimage-extract

  # icon
  for i in squashfs-root/*.png; do
    [ -f "$i" ] && install -Dm755 "$i" "$_pkgname.png" && break
  done

  # update script
  sed -Ei \
    's@^this_dir=".*\breadlink\b.*\bdirname\b.*"$@this_dir="/opt/'"$_pkgname"'"@' \
    "squashfs-root/AppRun"
}

package() {
  # appimage
  install -Dm755 "$_appimage" "$pkgdir/usr/bin/$_pkgname"

  # icon
  install -Dm644 "$_pkgname.png" -t "$pkgdir/usr/share/pixmaps/"

  # desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=PCSX2
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
