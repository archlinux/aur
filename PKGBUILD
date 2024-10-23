# Maintainer:

## options
if [ -z "$_srcinfo" ] && [ -z "$_pkgver" ]; then
  : ${_autoupdate:=true}
fi

# basic info
_pkgname='pcsx2'
pkgname="$_pkgname-latest-bin"
pkgver=2.1.225
pkgrel=1
pkgdesc='Sony PlayStation 2 emulator'
url="https://github.com/PCSX2/pcsx2"
license=('GPL-3.0-only')
arch=('x86_64')

makedepends=(
  'patchelf'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')
install="$_pkgname.install"

_source_main() {
  _appimage="pcsx2-v$_pkgver-linux-appimage-x64-Qt.AppImage"
  source+=("$url/releases/download/v$_pkgver/$_appimage")
  sha256sums+=('SKIP')
}

build() {
  # extract appimage
  chmod +x "$_appimage"
  "./$_appimage" --appimage-extract

  (
    # fix desktop file name
    cd "$srcdir/squashfs-root"
    if [ ! -e "PCSX2.desktop" ]; then
      for i in *.desktop; do
        [ -f "$i" ] && mv "$i" PCSX2.desktop && break
      done
    fi
  )

  # update script
  sed -Ei \
    's@^this_dir=".*\breadlink\b.*\bdirname\b.*"$@this_dir="/opt/pcsx2"@' \
    "$srcdir/squashfs-root/AppRun"
}

package() {
  # main files
  install -dm755 "$pkgdir/opt/$_pkgname"
  mv "$srcdir"/squashfs-root/* "$pkgdir/opt/$_pkgname/"

  # rpath
  patchelf --force-rpath --set-rpath "/opt/$_pkgname/usr/lib" "$pkgdir/opt/$_pkgname/usr/bin/pcsx2-qt"

  # script
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/opt/$_pkgname/AppRun" "$pkgdir/usr/bin/pcsx2-qt"

  # icon
  install -Dm644 "$pkgdir/opt/$_pkgname/PCSX2.png" -t "$pkgdir/usr/share/pixmaps"

  # launcher
  install -Dm644 "$pkgdir/opt/$_pkgname/PCSX2.desktop" -t "$pkgdir/usr/share/applications"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]]; then
    return
  fi

  local _response=$(curl -Ssf "$url/releases.atom")

  local _pkgver_new=$(
    printf '%s' "$_response" \
      | grep '/releases/tag/' \
      | sed -E 's@^.*/releases/tag/(.*)".*$@\1@; s@^v@@' \
      | grep -Ev '[a-z]{2}' | sort -V | tail -1
  )

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ]; then
    _pkgver="${_pkgver_new:?}"
  fi

  pkgver() {
    printf '%s' "${_pkgver:?}"
  }
}

_update_version
_source_main
