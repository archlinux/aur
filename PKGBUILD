# Maintainer:

## options
: ${_electron_version=}
: ${_nodeversion=}
: ${_install_path:=usr/share}

_pkgname="kando"
pkgname="$_pkgname-git"
pkgver=2.0.0.r154.g5cb27d2
pkgrel=1
pkgdesc="Customizable desktop pie menu"
url="https://github.com/kando-menu/kando"
license=('MIT')
arch=('any')

depends=(
  "electron${_electron_version:-}"
)
makedepends=(
  'git'
  'nvm'
  'cmake'
  'asar'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

_nvm_env() {
  export HOME="$SRCDEST/node-home"
  export NVM_DIR="$SRCDEST/node-nvm"

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install ${_nodeversion:-node}
  nvm use ${_nodeversion:-node}
}

_electron_env() {
  export SYSTEM_ELECTRON_VERSION=$(< "/usr/lib/electron${_electron_version:-}/version")
  export ELECTRON_VERSION=${SYSTEM_ELECTRON_VERSION%%.*}

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
}

prepare() {
  _electron_env

  # set electron version
  sed -E \
    -e 's&^(\s*)("electron"): "(.*)"(,?)$&\1\2: "'"$SYSTEM_ELECTRON_VERSION"'"\4&' \
    -i "$_pkgsrc/package.json"

  # allow any npm version
  sed -E \
    -e 's&("npm"): \S+$&\1: ">=1.0.0"&' \
    -i "$_pkgsrc/package.json"

  # set electronDist and electronVersion for electron forge
  sed -E \
    -e '/packagerConfig: \{/a\ electronDist: "/usr/lib/electron'"$SYSTEM_ELECTRON_VERSION"'",\n electronVersion: "'"$SYSTEM_ELECTRON_VERSION"'",' \
    -i "$_pkgsrc/forge.config.ts"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() (
  _nvm_env
  _electron_env

  local _builder_options=(
    -c.electronDist="'/usr/lib/electron${ELECTRON_VERSION:-}'"
    -c.electronVersion=${SYSTEM_ELECTRON_VERSION}
  )

  cd "$_pkgsrc"
  npm install --no-audit --no-fund --no-package-lock
  npm run package
)

package() {
  _electron_env

  depends=("electron${ELECTRON_VERSION:-}")

  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname"
  asar p "$_pkgsrc/out/Kando-linux-x64/resources/app" "$pkgdir/$_install_path/$_pkgname/app.asar"

  install -Dm644 "$_pkgsrc/assets/icons/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  install -Dm644 "$_pkgsrc/LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=Do things with utmost efficiency
Exec=$_pkgname %U
Icon=$_pkgname
Terminal=false
StartupNotify=true
Categories=Utility;
END

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

exec electron${ELECTRON_VERSION:-} "\${flags[@]}" "/$_install_path/$_pkgname/app.asar" "\$@"
END
}
