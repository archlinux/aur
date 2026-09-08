# Maintainer:

## options
if [ -z "$_srcinfo" ] && [ -z "$_pkgver" ]; then
  : ${_autoupdate:=true}
fi

: ${_install_path:=opt}

_pkgname="pcsx2"
pkgname="$_pkgname-latest-bin"
pkgver=2.9.34
pkgrel=1
pkgdesc="PlayStation 2 emulator"
url="https://github.com/PCSX2/pcsx2"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'e2fsprogs'
  'gmp'
  'hicolor-icon-theme'
  'libgpg-error'
)
makedepends=(
  '7zip'
  'patchelf'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')
install="$_pkgname.install"

_source_main() {
  _pkgsrc="$_pkgname-$_pkgver"
  _appimage="pcsx2-v$_pkgver-linux-appimage-x64-Qt.AppImage"
  source=("$url/releases/download/v$_pkgver/$_appimage")
  sha256sums=('SKIP')
}

pkgver() {
  printf '%s' "${_pkgver:?}"
}

build() {
  # extract
  7z x -o"$_pkgsrc" "$_appimage"

  # icon
  for i in "$_pkgsrc"/*.png; do
    [ -f "$i" ] && install -Dm644 "$i" "$_pkgname.png" && break
  done
}

package() {
  local _files=(
    usr/bin
    usr/lib
    usr/plugins
  )

  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname/usr"
  for i in "${_files[@]}"; do
    cp -r "$_pkgsrc/$i" "$pkgdir/$_install_path/$_pkgname/${i}"
  done

  # rpath
  patchelf --force-rpath --set-rpath "/$_install_path/$_pkgname/usr/lib" "$pkgdir/$_install_path/$_pkgname/usr/bin/pcsx2-qt"

  # symlinks
  mkdir -pm755 "$pkgdir/usr/bin"
  ln -sf "/$_install_path/$_pkgname/usr/bin/pcsx2-qt" "$pkgdir/usr/bin/$_pkgname"
  ln -sf "/$_install_path/$_pkgname/usr/bin/pcsx2-qt" "$pkgdir/usr/bin/$_pkgname-qt"

  # icon
  install -Dm644 "$_pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/512x512/apps/"

  # launcher
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
StartupWMClass=pcsx2-qt
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
      | grep -Ev '[a-z]{2}' | sort -rV | head -1
  )

  # update _pkgver
  if [ $(vercmp "${_pkgver_new:?}" "$_pkgver") -gt 0 ]; then
    _pkgver="${_pkgver_new:?}"
  fi
}

_update_version
_source_main
