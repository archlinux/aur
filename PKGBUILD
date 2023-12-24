# Maintainer: xiota / aur.chaotic.cx

# options
if [ "${_srcinfo::1}" = "t" ] ; then
  : ${_autoupdate:=false}
elif [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_build_latest:=true}
: ${_build_bin:=true}

[[ "${_build_latest::1}" == "t" ]] && _pkgtype+="-latest"
[[ "${_build_bin::1}" == "t" ]] && _pkgtype+="-bin"

# basic info
_pkgname='pcsx2'
pkgname="$_pkgname${_pkgtype:-}"
pkgver=1.7.5321
pkgrel=1
pkgdesc='Sony PlayStation 2 emulator'
url="https://github.com/PCSX2/pcsx2"
license=('GPL-3.0-only' 'LGPL-3.0-only')
arch=(x86_64)

# main package
_main_package() {
  _update_version

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  options=(!strip !debug)
  install="$_pkgname.install"

  _url="https://github.com/PCSX2/pcsx2"
  _appimage="pcsx2-v$_pkgver-linux-appimage-x64-Qt.AppImage"

  source+=("$_url/releases/download/v$_pkgver/$_appimage")
  sha256sums+=('SKIP')
}

# common functions
pkgver() {
  printf '%s' "${_pkgver:?}"
}

build() {
  # extract appimage
  chmod +x "$_appimage"
  "./$_appimage" --appimage-extract

  (
    # fix desktop file name
    cd "$srcdir/squashfs-root"
    if [ ! -e "PCSX2.desktop" ] ; then
      for i in *.desktop ; do
        mv "$i" PCSX2.desktop
        break
      done
    fi
  )

  # update script
  sed -Ei \
    's@^this_dir=".*\breadlink\b.*\bdirname\b.*"$@this_dir="/opt/pcsx2"@' \
    "$srcdir/squashfs-root/AppRun"
}

package() {
  install -Dm755 "$srcdir/squashfs-root/AppRun" "$pkgdir/usr/bin/pcsx2-qt"

  install -Dm644 "$srcdir/squashfs-root/PCSX2.desktop" -t "$pkgdir/usr/share/applications"

  install -Dm644 "$srcdir/squashfs-root/PCSX2.png" -t "$pkgdir/usr/share/pixmaps"

  mkdir -p "$pkgdir/opt"
  mv "$srcdir/squashfs-root" "$pkgdir/opt/pcsx2"
}

# update version
_update_version() {
  : ${_pkgver:=$pkgver}

  if [[ "${_autoupdate::1}" != "t" ]] ; then
    return
  fi

  _repo="${url#*//*/}"
  _response=$(curl "https://api.github.com/repos/${_repo:?}/releases" -s)

  _get() {
    printf '%s' "$_response" \
      | awk -F '"' '/"'"$1"'":/{print $4}' \
      | head -1 | sed 's/^v//'
  }
  _pkgver_new=$(_get name)

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package
