# Maintainer:
# Contributor: Mendel Greenberg <mendel at chabad360 dot me>

# options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ] ; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

: ${_build_channel:=canary} # nightly or canary

# basic info
_pkgname="citra-${_build_channel:?}"
pkgname="$_pkgname-bin"
pkgrel=1
pkgver=2777.20240211.1f707b0
pkgdesc="Nintendo 3DS emulator"
license=('GPL-2.0-or-later')
arch=('x86_64')

case "$_build_channel" in
  canary)
    url="https://github.com/citra-emu/citra-canary"
    pkgdesc+=" - additional features still under review"
    ;;
  nightly)
    url="https://github.com/citra-emu/citra-nightly"
    pkgdesc+=" - reviewed and tested features"
    ;;
  *)
    echo "Invalid release channel: ${_build_channel}"
    return 1
    ;;
esac

# main package
_main_package() {
  _update_version

  provides=(
    'citra'
    'citra-qt'
  )
  conflicts=(
    'citra'
    'citra-qt'

    'citra-git'
    'citra-qt-git'
  )

  options=(!strip !debug)

  local _version=${_pkgver%%.*}
  local _date=$(echo "$_pkgver" | cut -d'.' -f2)
  local _hash=${_pkgver##*.}

  _pkgsrc="citra-linux-appimage-$_date-$_hash"
  _pkgext="tar.gz"
  source+=("$_pkgname-$_date-$_hash.$_pkgext"::"$url/releases/download/${_build_channel:?}-$_version/$_pkgsrc.$_pkgext")
  sha256sums+=('SKIP')
}

# common functions
pkgver() {
  printf '%s' "${_pkgver:?}"
}

prepare() {
  local _app
  for _app in citra-qt citra-room citra ; do
    local _appimage="$_pkgsrc/$_app.AppImage"
    chmod +x "$_appimage"
    "$_appimage" --appimage-extract
  done
}

package() {
  depends+=(
    alsa-lib
    e2fsprogs
    fontconfig
    freetype2
    harfbuzz
    libdrm
    libglvnd
    libgpg-error
    libice
    libsm
    libx11
    libxcb
    mesa
    zlib
  )

  install -dm755 "$pkgdir/opt/citra"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications/"

  # symlinks
  local _app
  for _app in citra-qt citra-room citra ; do
    ln -sf "/opt/citra/bin/$_app" "$pkgdir/usr/bin/$_app"
  done

  # desktop file
  mv "squashfs-root/usr/share/applications/citra-qt.desktop" "$pkgdir/usr/share/applications/"

  # icon
  install -Dm644 "squashfs-root/usr/share/icons/hicolor/scalable/apps/citra.svg" -t "$pkgdir/usr/share/pixmaps/"

  # move main files
  mv "squashfs-root/usr"/{bin,lib,plugins,translations} "$pkgdir/opt/citra/"

  # fix permissions
  chmod -R u=rwX,go=rX "$pkgdir"
}

# update version
_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]] ; then
    return
  fi

  local _response=$(curl -Ssf "$url/releases")
  local _regex='<a href="(.*/'"${_build_channel:?}"'-([0-9]+)/(citra-linux-appimage-([0-9]+)-(.*)\.tar\.gz))"'

  local _dl_path=$(
    printf '%s' "$_response" \
      | grep -Eio "$_regex" \
      | sed -E "s&$_regex&\1&"
  )
  local _filename=$(
    printf '%s' "$_response" \
      | grep -Eio "$_regex" \
      | sed -E "s&$_regex&\3&"
  )

  local _version=$(
    printf '%s' "$_response" \
      | grep -Eio "$_regex" \
      | sed -E "s&$_regex&\2&"
  )
  local _date=$(
    printf '%s' "$_response" \
      | grep -Eio "$_regex" \
      | sed -E "s&$_regex&\4&"
  )
  local _hash=$(
    printf '%s' "$_response" \
      | grep -Eio "$_regex" \
      | sed -E "s&$_regex&\5&"
  )

  local _pkgver_new=$(printf '%s.%s.%s' "$_version" "$_date" "$_hash")

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package
