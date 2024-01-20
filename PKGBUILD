# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>

# options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ] ; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

: ${_pkgtype:=-bin}

# basic info
_pkgname="logseq-desktop"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.10.5
pkgrel=1
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
url="https://github.com/logseq/logseq"
license=('AGPL-3.0-or-later')
arch=("x86_64")

# main package
_main_package() {
  makedepends=(
    'gendesk'
  )

  provides=("$_pkgname=$pkgver")
  conflicts=("$_pkgname")

  options=(!debug !strip)
  install="$_pkgname.install"

  _pkgsrc="Logseq-linux-x64"
  _pkgext="zip"
  _install_path="opt"
  source+=("$url/releases/download/$_pkgver/$_pkgsrc-$_pkgver.$_pkgext")
  sha256sums+=('SKIP')

  # appimage - missing icon
  if [[ "${_pkgext::1}" == "A" ]] ; then
    source+=("$_pkgname.png"::"$url/raw/master/resources/icons/logseq.png")
    sha256sums+=('2c04bad999ef75b874bd185b84c4df560486685f5a36c2801224ef9b67642006')
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

  # appimage - extract
  if [[ "${_pkgext::1}" == "A" ]] ; then
    chmod +x "$_pkgsrc-$_pkgver.$_pkgext"
    "./$_pkgsrc-$_pkgver.$_pkgext" --appimage-extract
    ln -sf "squashfs-root" "$_pkgsrc"
  fi
}

package() {
  if [[ "${_pkgext::1}" == "A" ]] ; then
    # appimage - icons
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/logseq.png"

    # appimage - remove unneeded
    rm -- "$_pkgsrc/AppRun"
    rm -- "$_pkgsrc/Logseq.desktop"
    rm -- "$_pkgsrc/Logseq.png"
  else
    # zip - icons
    install -Dm644 "$_pkgsrc/resources/app/icon.png" "$pkgdir/usr/share/pixmaps/logseq.png"
  fi

  # desktop file
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # script
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/logseq"

  # package files
  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  cp --reflink=auto -r "$_pkgsrc"/* "$pkgdir/$_install_path/$_pkgname/"

  # fix permissions
  chmod -R u=rwX,go=rX "$pkgdir"
}

# other functions
_gen_script() {
  cat <<'EOF' > "$_pkgname.sh"
#!/usr/bin/env sh
set -e
EOF

  cat <<EOF >> "$_pkgname.sh"
APPDIR="/$_install_path/logseq-desktop"
EOF

  cat <<'EOF' >> "$_pkgname.sh"
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
