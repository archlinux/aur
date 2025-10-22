# Maintainer:

## options
: ${_electron_version=}
: ${_nodeversion=}
: ${_install_path:=usr/lib}

_pkgname="trilium"
pkgname="$_pkgname-next"
pkgver=0.99.3
pkgrel=1
pkgdesc="A hierarchical note taking application"
url="https://github.com/TriliumNext/Trilium"
license=('AGPL-3.0-only')
arch=('x86_64')

depends=(
  "electron${_electron_version:-}"
)
makedepends=(
  'jq'
  'nvm'
  'pnpm'
  'python'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="${_pkgname^}-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('c826ac3fe34178927d49fe7abf8bf2a3280dd483b024a0b5fefedddc3528fb9e')

_nvm_env() {
  export HOME="$SRCDEST/node-home"
  export NVM_DIR="$SRCDEST/node-nvm"

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

  cd "$_pkgsrc"

  # set electron version
  local _apps=(
    apps/desktop/package.json
    apps/edit-docs/package.json
    apps/server/package.json
  )

  for i in "${_apps[@]}"; do
    jq --arg electron "$SYSTEM_ELECTRON_VERSION" \
      '.devDependencies.electron = $electron' \
      "$i" > "$i.new" \
      && mv "$i.new" "$i"
  done
}

build() {
  _nvm_env
  _electron_env

  local _builder_options=(
    -c.electronDist="'/usr/lib/electron${ELECTRON_VERSION:-}'"
    -c.electronVersion=${SYSTEM_ELECTRON_VERSION}
  )

  cd "$_pkgsrc"
  pnpm install
  pnpm run chore:update-version
  pnpm run --filter desktop electron-forge:package
}

package() {
  _electron_env

  depends=("electron${ELECTRON_VERSION:-}")

  # asar
  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname"
  cp -r "$_pkgsrc"/apps/desktop/dist/out/*-linux-x64/resources/* "$pkgdir/$_install_path/$_pkgname/"

  # icon
  install -Dm644 "$_pkgsrc"/apps/desktop/dist/assets/images/icon-color.svg "$pkgdir/usr/share/pixmaps/$_pkgname.svg"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=$pkgdesc
Exec=$_pkgname %u
Icon=$_pkgname
Terminal=false
StartupNotify=true
Categories=Office;Utility;
StartupWMClass=Trilium Notes
END

  # script
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

  exec electron${ELECTRON_VERSION:-} "\${flags[@]}" "/$_install_path/$_pkgname/app.asar" "\$@"
fi
END
}
