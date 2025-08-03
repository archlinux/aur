# Maintainer:

## options
: ${_nodeversion=}
: ${_install_path:=usr/share}

_pkgname="knowte"
pkgname="$_pkgname-git"
pkgver=3.0.1.r0.g3ca0d90
pkgrel=1
pkgdesc="Cross platform note taking application"
url="https://github.com/digimezzo/knowte"
license=('GPL-3.0-only')
arch=('any')

makedepends=(
  'git'
  'libxcrypt-compat'
  'nvm'
)

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

_nvm_env() {
  export HOME="$SRCDEST/node-home"
  export NVM_DIR="$SRCDEST/node-nvm"

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install ${_nodeversion:-node}
  nvm use ${_nodeversion:-node}
}

prepare() {
  # minimize packages
  sed -E \
    -e 's&\[.*pacman.*\]&'"['pacman']&" \
    -i "$_pkgsrc/electron-builder.config.js"
}

build() (
  _nvm_env

  cd "$_pkgsrc"
  npm install --force --no-audit --no-fund
  npm install --force --no-audit --no-fund querystring
  npm run electron:linux
)

package() {
  if [[ -z "$_install_path" || "$_install_path" == /* || "$_install_path" = "usr/lib" ]]; then
    _install_path="usr/share"
  fi

  depends=('electron')

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env bash

set -euo pipefail

name=$_pkgname
flags_file="\${XDG_CONFIG_HOME:-\$HOME/.config}/\${name}-flags.conf"

lines=()
if [[ -f "\${flags_file}" ]]; then
  mapfile -t lines < "\${flags_file}"
fi

flags=()
for line in "\${lines[@]}"; do
  if [[ ! "\${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "\${line}" ]]; then
    flags+=("\${line}")
  fi
done

: \${ELECTRON_IS_DEV:=0}
export ELECTRON_IS_DEV
: \${ELECTRON_FORCE_IS_PACKAGED:=true}
export ELECTRON_FORCE_IS_PACKAGED

if [ -z "\$@" ]; then
  cd "/$_install_path/$_pkgname/"
  exec electron "\${flags[@]}" app.asar
else
  exec electron "\${flags[@]}" "/$_install_path/$_pkgname/app.asar" "\$@"
fi
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=$pkgdesc
Exec=$_pkgname %u
Icon=$_pkgname
Terminal=false
StartupNotify=true
Categories=Utility;
StartupWMClass=Knowte
END

  install -Dm644 "$_pkgsrc/release/linux-unpacked/resources/app.asar" -t "$pkgdir/$_install_path/$_pkgname/"
  install -Dm644 "$_pkgsrc/build/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
