# Maintainer:
# Contributor: Tom Bebbington <tophattedcoder@gmail.com>

# options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ] ; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

# basic info
_pkgname='citra-nightly'
pkgname="$_pkgname-bin"
pkgrel=1
pkgver=2062.20231226.602f4f6
pkgdesc="Nintendo 3DS emulator"
url="https://github.com/citra-emu/citra-nightly"
license=('GPL-2.0-or-later')
arch=('x86_64')

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
  source+=("$_pkgsrc-$_pkgver.$_pkgext"::"$url/releases/download/nightly-$_version/$_pkgsrc.$_pkgext")
  sha256sums+=('SKIP')
}

# common functions
pkgver() {
  printf '%s' "${_pkgver:?}"
}

build() {
  local _app
  for _app in citra-qt citra-room citra ; do
    local _appimage="$_pkgsrc/$_app.AppImage"
    chmod +x "$_appimage"
    "$_appimage" --appimage-extract
  done

  rm -rf "squashfs-root/usr/optional"
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications/"

  local _app
  for _app in citra-qt citra-room citra ; do
    # symlink
    ln -sf "/opt/citra/bin/$_app" "$pkgdir/usr/bin/$_app"

    # desktop file
    mv "squashfs-root/$_app.desktop" "$pkgdir/usr/share/applications/"
  done

  # icon
  install -Dm644 "$_pkgsrc/dist/citra.png" -t "$pkgdir/usr/share/pixmaps/"

  # move main files
  install -dm755 "$pkgdir/opt"
  mv "$srcdir/squashfs-root/usr" "$pkgdir/opt/citra"
}

# update version
_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]] ; then
    return
  fi

  local _response=$(curl -Ssf "$url/releases")
  local _regex='<a href="(.*/nightly-([0-9]+)/(citra-linux-appimage-([0-9]+)-(.*)\.tar\.gz))"'

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
