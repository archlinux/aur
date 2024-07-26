# Maintainer:
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

# options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ]; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

: ${_install_path:=opt}

# basic info
_pkgname="logseq-desktop"
pkgname="$_pkgname-bin"
pkgver=0.10.9
pkgrel=2
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
url="https://github.com/logseq/logseq"
license=('AGPL-3.0-or-later')
arch=('x86_64' 'aarch64')

# main package
_main_package() {
  provides=("$_pkgname=$pkgver")
  conflicts=("$_pkgname")

  options=('!debug' '!strip')
  install="$_pkgname.install"

  _pkgsrc="Logseq-linux-x64"
  [[ "$CARCH" == "aarch64" ]] && _pkgsrc="Logseq-linux-arm64"

  _pkgext="zip"
  source+=("$url/releases/download/$_pkgver/$_pkgsrc-$_pkgver.$_pkgext")
  sha256sums+=('SKIP')

  # appimage - missing icon
  if [[ "${_pkgext::1}" == "A" ]]; then
    source+=("$_pkgname.png"::"$url/raw/master/resources/icons/logseq.png")
    sha256sums+=('2c04bad999ef75b874bd185b84c4df560486685f5a36c2801224ef9b67642006')
  fi
}

# common functions
pkgver() {
  echo "${_pkgver:?}"
}

prepare() {
  # appimage - extract
  if [[ "${_pkgext::1}" == "A" ]]; then
    chmod +x "$_pkgsrc-$_pkgver.$_pkgext"
    "./$_pkgsrc-$_pkgver.$_pkgext" --appimage-extract
    ln -sf "squashfs-root" "$_pkgsrc"
  fi
}

package() {
  if [[ "${_pkgext::1}" == "A" ]]; then
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
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Logseq
Comment=$pkgdesc
Exec=logseq %u
Icon=logseq
Terminal=false
StartupNotify=true
Categories=Office;
MimeType=x-scheme-handler/logseq;
StartupWMClass=Logseq
END

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/logseq" << END
#!/usr/bin/env sh
set -e
APPDIR="/$_install_path/logseq-desktop"

_ELECTRON="\${APPDIR}/Logseq"
_FLAGS_FILE="\${XDG_CONFIG_HOME:-\$HOME/.config}/logseq-flags.conf"
if [ -r "\$_FLAGS_FILE" ]; then
  _USER_FLAGS="\$(cat "\$_FLAGS_FILE")"
fi

if [[ \$EUID -ne 0 ]] || [[ \$ELECTRON_RUN_AS_NODE ]]; then
    exec \${_ELECTRON} \$_USER_FLAGS "\$@"
else
    exec \${_ELECTRON} --no-sandbox \$_USER_FLAGS "\$@"
fi
END

  # package files
  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  cp --reflink=auto -r "$_pkgsrc"/* "$pkgdir/$_install_path/$_pkgname/"

  # fix permissions
  chmod -R u=rwX,go=rX "$pkgdir"
}

# update version
_update_version() {
  : ${_pkgver:=$pkgver}

  if [[ "${_autoupdate::1}" != "t" ]]; then
    return
  fi

  _response=$(curl -SsfL "https://api.github.com/repos/logseq/logseq/releases/latest")
  _pkgver_new=$(printf '%s' "$_response" | grep -oP '"tag_name": "\K(.*?)(?=")')

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ]; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_update_version
_main_package
