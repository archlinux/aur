# Maintainer: aur.chaotic.cx

## options
: ${_install_path:=usr/lib}

_pkgname="trilium"
pkgname="$_pkgname-next"
pkgver=0.104.0
pkgrel=1
pkgdesc="A hierarchical note taking application"
url="https://github.com/TriliumNext/Trilium"
license=('AGPL-3.0-only')
arch=('x86_64')

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
sha256sums=('b82089baf2c731d54caecc51521b2cd9ab5a19381672e12fa29636dae7707654')

_nvm_env() {
  [ -n "$NVM_DIR" ] && return
  export NVM_DIR="$SRCDEST/node-nvm"

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install
  nvm use
}

_electron_env() {
  [ -n "$ELECTRON_SKIP_BINARY_DOWNLOAD" ] && return
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  local _electron_version=$(grep -Pom1 '^\s*"electron":\s*"\K[0-9.]+' "$srcdir/$_pkgsrc/apps/desktop/package.json")
  : ${_electron_version:?}

  export SYSTEM_ELECTRON_VERSION=$(LC_ALL=C pacman -Si "electron${_electron_version%%.*}" | grep -Pom1 '^Version\s+:\s+\K\S+(?=-[0-9])')
  : ${SYSTEM_ELECTRON_VERSION:?}

  export ELECTRON_VERSION=$(sed -E 's&\..*&&' <<< "${SYSTEM_ELECTRON_VERSION%%.*}")
  : ${ELECTRON_VERSION:?}
}

prepare() {
  _electron_env

  cd "$_pkgsrc"
  cp .nvmrc "$srcdir/"

  # set electron version
  local _apps=(
    apps/desktop/package.json
    apps/edit-docs/package.json
  )

  for i in "${_apps[@]}"; do
    _new_json=$(jq --arg electron "$SYSTEM_ELECTRON_VERSION" '.devDependencies.electron = $electron' "$i")
    install -Dm644 /dev/stdin "$i" <<< "${_new_json:?}"
  done
}

build() {
  _nvm_env
  _electron_env

  cd "$_pkgsrc"

  pnpm config set cache-dir "$SRCDEST/pnpm-cache"

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
  install -Dm644 "$_pkgsrc"/apps/desktop/dist/assets/images/icon-color.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

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
