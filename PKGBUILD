# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>

# options
: ${_autoupdate:=false}

: ${_pkgtype:=-bin}

# basic info
_pkgname="logseq-desktop"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.10.2
pkgrel=3
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
url="https://github.com/logseq/logseq"
license=('AGPL-3.0-or-later')
arch=("x86_64")

# main package
_main_package() {
  makedepends=(
    'gendesk'
  )

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  install="$_pkgname.install"

  _pkgsrc="Logseq-linux-x64"
  _pkgext="AppImage"
  source=(
    "$url/releases/download/$_pkgver/$_pkgsrc-$_pkgver.$_pkgext"
    "$_pkgname.png"::"$url/raw/master/resources/icons/logseq.png"
  )
  sha256sums=(
    'b8aba5b33f23db5d79ee1566c88c1c5e2f3de679dda6f35828235de7f606b866'
    '2c04bad999ef75b874bd185b84c4df560486685f5a36c2801224ef9b67642006'
  )

  if [[ "${_autoupdate::1}" == "t" ]] ; then
    sha256sums=('SKIP')
  fi
}

# common functions
pkgver() {
  printf '%s' "${_pkgver:?}"
}

prepare() {
  _gen_script

  local _gendesk_options=(
    -q -f -n
    --pkgname="$_pkgname"
    --pkgdesc="$pkgdesc"
    --name="Logseq"
    --exec="logseq %u"
    --icon="logseq"
    --terminal=false
    --categories="Office"
    --mimetypes="x-scheme-handler/logseq"
    --startupnotify=true
    --custom="StartupWMClass=Logseq"
  )

  gendesk "${_gendesk_options[@]}"

  # extract appimage
  if [[ "${_pkgext::1}" == "A" ]] ; then
    chmod +x "$_pkgsrc-$_pkgver.$_pkgext"
    "./$_pkgsrc-$_pkgver.$_pkgext" --appimage-extract
    ln -sf "squashfs-root" "$_pkgsrc"
  fi
}

package() {
  # desktop file
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # icons
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/logseq.png"

  # script
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/logseq"

  # remove unneeded
  rm -- "$_pkgsrc/AppRun"
  rm -- "$_pkgsrc/Logseq.desktop"
  rm -- "$_pkgsrc/Logseq.png"

  # package files
  install -dm755 "$pkgdir/opt/$_pkgname"
  cp --reflink=auto -r "$srcdir/$_pkgsrc"/* "$pkgdir/opt/$_pkgname/"

  # fix permissions
  chmod -R u=rwX,go=rX "$pkgdir"
}

# other functions
_gen_script() {
  cat <<'EOF' > "$_pkgname.sh"
#!/usr/bin/env sh
set -e

APPDIR="/opt/logseq-desktop"
_ELECTRON="${APPDIR}/Logseq"

_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/logseq-flags.conf"
if [ -r "$_FLAGS_FILE" ]; then
  _USER_FLAGS="$(cat "$_FLAGS_FILE")"
fi

if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} $_USER_FLAGS "$@"
else
    exec ${_ELECTRON} --no-sandbox $_USER_FLAGS "$@"
fi
EOF
}

_update_version() {
  : ${_pkgver:=$pkgver}

  if [[ "${_autoupdate::1}" != "t" ]] ; then
    return
  fi

  _response=$(curl -Ssf "$url/releases.atom")

  _pkgver_new=$(
    printf '%s' "$_response" \
      | grep '/releases/tag/' \
      | sed -E 's@^.*/releases/tag/(.*)".*$@\1@' \
      | grep -Ev '[a-z]{2}' | sort -V | tail -1
  )

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_update_version
_main_package
