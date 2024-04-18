# Maintainer: Patrik Sundberg <patrik.sundberg@gmail.com>

## options
: ${_autoupdate:=true}

: ${_system_electron:=false}
: ${_install_path:=opt}

: ${_pkgtype:=-latest-bin}

# basic info
_pkgname='beeper'
pkgname="$_pkgname${_pkgtype:-}"
pkgver=3.103.36
pkgrel=2
pkgdesc="all your chats in one app"
url="https://beeper.com/"
license=('LicenseRef-beeper')
arch=('x86_64')

# main package
_main_package() {
  _update_version

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  options=('!strip')

  source+=("$_filename"::"$_dl_url")
  sha256sums+=('SKIP')
}

# common functions
pkgver() {
  printf '%s' "${_pkgver:?}"
}

prepare() {
  cat << 'EOF' > "$_pkgname.sh"
#!/usr/bin/env sh
set -e

APPDIR=$(dirname `readlink -f "$0"`)
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

_ELECTRON=/usr/bin/electron
_ASAR="${APPDIR}/resources/app.asar"
_FLAGS_FILE="$XDG_CONFIG_HOME/beeper-flags.conf"

if [ -r "$_FLAGS_FILE" ]; then
  _USER_FLAGS="$(cat "$_FLAGS_FILE")"
fi

if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} $_USER_FLAGS "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox $_USER_FLAGS "$@"
fi
EOF
}

build() {
  # extract appimage
  chmod +x "$_filename"
  "$srcdir/$_filename" --appimage-extract

  # fix apprun script
  sed -Ei \
    's@^(if \[ -z \"\$APPDIR\" ] ; then)$@APPDIR="/'"$_install_path"'/beeper"\n\1@' \
    "$srcdir/squashfs-root/AppRun"

  # fix desktop file
  sed -Ei \
    's@^Exec=AppRun (.*)$@Exec=beeper \1@' \
    "$srcdir/squashfs-root/beeper.desktop"
}

_package_beeper() {
  # apprun script
  install -Dm755 "$srcdir/squashfs-root/AppRun" "$pkgdir/usr/bin/beeper"

  # everything else
  install -dm755 "$pkgdir/$_install_path"
  mv "$srcdir/squashfs-root" "$pkgdir/$_install_path/beeper"
}

_package_asar() {
  # script
  install -Dm755 "$srcdir/beeper.sh" -t "$pkgdir/$_install_path/beeper/"

  # symlink
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/$_install_path/beeper/beeper.sh" "$pkgdir/usr/bin/beeper"

  # app.asar
  install -dm755 "$pkgdir/$_install_path/beeper/resources"
  mv "$srcdir/squashfs-root/resources"/* "$pkgdir/$_install_path/beeper/resources/"
}

package() {
  depends+=('hicolor-icon-theme')

  # desktop file
  install -Dm644 "$srcdir/squashfs-root/beeper.desktop" "$pkgdir/usr/share/applications/beeper.desktop"

  # icons
  for s in 16 32 48 64 128 256 512 1024; do
    install -Dm644 \
      "$srcdir/squashfs-root/usr/share/icons/hicolor/${s}x${s}/apps/beeper.png" \
      -t "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps"
  done

  # license files
  install -Dm644 "$srcdir/squashfs-root/LICENSE.electron.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/squashfs-root/LICENSES.chromium.html" -t "$pkgdir/usr/share/licenses/$pkgname"

  if [[ "${_system_electron::1}" == "t" ]]; then
    depends+=('electron')
    _package_asar
  else
    _package_beeper
  fi

  # fix permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}

# update version
_update_version() {
  : ${_pkgver:=$pkgver}

  if [[ "${_autoupdate::1}" != 't' ]]; then
    return
  fi

  _dl_url="https://download.beeper.com/linux/appImage/x64"

  _filename=$(
    curl -v --no-progress-meter -r 0-1 "$_dl_url" 2>&1 > /dev/null \
      | grep content-disposition \
      | sed -E 's@^.*\bcontent-disposition:.*\bfilename="([^"]+)".*$@\1@'
  )

  _pkgver_new=$(
    printf '%s' "$_filename" \
      | sed -E 's@^beeper-([0-9]+\.[0-9]+\.[0-9]{2})(.*)?.AppImage$@\1@'
  )

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ]; then
    _pkgver="$_pkgver_new"
  fi
}

# execute
_main_package
