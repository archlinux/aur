# Maintainer:
# Contributor: Brad Johnson <bradsk88@gmail.com>

: ${_install_path:=usr/share}
: ${_electron_version=}

_pkgname="gitify"
pkgname="$_pkgname-git"
pkgver=6.8.0.r22.gea6c591
pkgrel=1
pkgdesc="GitHub tray icon and notifications"
url="https://github.com/gitify-app/gitify"
license=('MIT')
arch=("any")

depends=(
  'electron'
)
makedepends=(
  'git'
  'libicns'
  'nvm'
)

provides=("$_pkgname")
conflicts=(
  "$_pkgname"
  'gitify-bin'
)

_pkgsrc="$_pkgname"
source=("git+$url.git${_commit:+#commit=$_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  icns2png -x "$_pkgsrc/assets/images/app-icon.icns"
  mv app-icon_512x512x32.png "$_pkgname.png"
}

_nvm_env() {
  # avoid cluttering user home
  export HOME="$srcdir/node-home"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"

  export NVM_DIR="$srcdir/node-nvm"

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  export NODE_ENV=production
  _nodeversion=$(cat "$_pkgsrc/.nvmrc")

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion
}

build() (
  _nvm_env

  local _electron_version=$(cat /usr/lib/electron/version)
  local _electron_builder_options=(
    --linux dir
    --publish never
    -c.electronDist="/usr/lib/electron${_electron_version%%.*}"
    -c.electronVersion="${_electron_version:?}"
    --config ./config/electron-builder.js
  )

  sed -E -e 's#("electron"): "[^"]+",#\1: "'${_electron_version}'",#' \
    -i "$_pkgsrc/package.json"

  cd "$_pkgsrc"
  npm install -g pnpm
  NODE_ENV=development pnpm install --ignore-scripts

  pnpm run build
  pnpm -c exec "electron-builder ${_electron_builder_options[*]}"
)

package() {
  local _electron_version=$(cat /usr/lib/electron/version)

  depends=("electron${_electron_version%%.*}")

  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname"
  cp "$_pkgsrc/dist/linux-unpacked/resources"/* "$pkgdir/$_install_path/$_pkgname/"

  install -Dm644 "$_pkgname.png" -t "$pkgdir/$_install_path/pixmaps/"

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/$_install_path/licenses/$pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/$_install_path/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=$pkgdesc
Exec=$_pkgname %U
Icon=$_pkgname
Terminal=false
StartupWMClass=${_pkgname^}
Categories=Development;
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env bash

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

exec electron${_electron_version%%.*} "/$_install_path/\${name}/app.asar" "\${flags[@]}" "\$@"
END
}
