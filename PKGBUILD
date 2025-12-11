# Maintainer: xiota
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>

## options
: ${_electron_version=}
: ${_nodeversion=}
: ${_install_path:=usr/share}

_pkgname="thorium-reader"
pkgname="$_pkgname"
pkgver=3.3.0
pkgrel=1
pkgdesc="Cross-platform desktop reading app based on the Readium Desktop toolkit"
url="https://github.com/edrlab/thorium-reader"
license=('MIT')
arch=('any')

depends=(
  "electron${_electron_version:-}"
)
makedepends=(
  'git'
  'nvm'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('356fe7c9888d5990fb498abe87d77139b3ff486f833d9326476cec56fd97f765')

_nvm_env() {
  export HOME="$SRCDEST/node-home"
  export NVM_DIR="$SRCDEST/node-nvm"
  export NODE_OPTIONS="--localstorage-file='$srcdir/localstorage.json'"

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install ${_nodeversion:-node}
  nvm use ${_nodeversion:-node}
}

_electron_env() {
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export SYSTEM_ELECTRON_VERSION=$(< "/usr/lib/electron${_electron_version:-}/version")
  export ELECTRON_VERSION=${SYSTEM_ELECTRON_VERSION%%.*}
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
}

build() (
  _nvm_env
  _electron_env

  local _builder_options=(
    -c.electronDist="'/usr/lib/electron${ELECTRON_VERSION:-}'"
    -c.electronVersion=${SYSTEM_ELECTRON_VERSION}
  )

  cd "$_pkgsrc"
  npm install --no-audit --no-fund
  npm run package:build
  npm exec -c "electron-builder --linux --dir --publish never ${_builder_options[@]}"
)

package() {
  _electron_env

  depends=("electron${ELECTRON_VERSION:-}")

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
  exec electron${ELECTRON_VERSION:-} "\${flags[@]}" app.asar
else
  exec electron${ELECTRON_VERSION:-} "\${flags[@]}" "/$_install_path/$_pkgname/app.asar" "\$@"
fi
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Thorium Reader
Comment=Cross-platform desktop reading app based on the Readium Desktop toolkit
Exec=$_pkgname %u
Icon=$_pkgname
Terminal=false
StartupNotify=true
Categories=Office;
MimeType=application/epub+zip;
StartupWMClass=EDRLab.ThoriumReader
END

  install -Dm644 "$_pkgsrc/release/linux-unpacked/resources/app.asar" -t "$pkgdir/$_install_path/$_pkgname/"
  install -Dm644 "$_pkgsrc/resources/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
