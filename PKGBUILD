# Maintainer:

## options
: ${_electron_version=30}
: ${_nodeversion:=18}
: ${_install_path:=usr/share}

_pkgname="thorium-reader"
pkgname="$_pkgname"
pkgver=3.0.0
pkgrel=2
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

_source_main() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
  sha256sums=('SKIP')
}

_source_main

_nvm_env() {
  export HOME="$SRCDEST/node-home"
  export NVM_DIR="$SRCDEST/node-nvm"

  export SYSTEM_ELECTRON_VERSION=$(< "/usr/lib/electron${_electron_version:-}/version")
  export ELECTRONVERSION=${SYSTEM_ELECTRON_VERSION%%.*}

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion
}

build() (
  _nvm_env

  sed -E \
    -e 's&^(\s*)("electron"): "(.*)"(,?)$&\1\2: "'"$SYSTEM_ELECTRON_VERSION"'"\4&' \
    -i "$_pkgsrc/package.json"

  cd "$_pkgsrc"
  npm install --no-audit --no-fund --prefer-offline
  npm run package:build
  npm exec -c "electron-builder --linux --x64 --dir --publish never -c.electronDist='/usr/lib/electron${_electron_version:-}' -c.electronVersion=${SYSTEM_ELECTRON_VERSION}"
)

package() {
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
  exec electron${_electron_version:-} "\${flags[@]}" app.asar
else
  exec electron${_electron_version:-} "\${flags[@]}" "/$_install_path/$_pkgname/app.asar" "\$@"
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
