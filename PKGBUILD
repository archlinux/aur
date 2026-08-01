# Maintainer:

## options
: ${_install_path:=usr/share}

_pkgname="legcord"
pkgname="$_pkgname"
pkgver=1.3.0
pkgrel=1
pkgdesc="Discord client with builtin client mod and theme support"
url="https://github.com/Legcord/Legcord"
license=('OSL-3.0')
arch=('any')

makedepends=(
  'nodejs'
  'npm'
  'pnpm'
)
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

_pkgsrc="Legcord-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('bdaccce0f26106d35f0b89df4a1efb7aa4a073ae0514fc252c287ae6fb1df301')

_electron_env() {
  [ -n "$ELECTRON_SKIP_BINARY_DOWNLOAD" ] && return
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  local _electron_version=$(grep -Pom1 '^\s*"electron":\s*"\K[0-9.]+' "$srcdir/$_pkgsrc/package.json")
  : ${_electron_version:?}

  export SYSTEM_ELECTRON_VERSION=$(LC_ALL=C pacman -Si "electron${_electron_version%%.*}" | grep -Pom1 '^Version\s+:\s+\K\S+(?=-[0-9])')
  : ${SYSTEM_ELECTRON_VERSION:?}

  export ELECTRON_VERSION=$(sed -E 's&\..*&&' <<< "${SYSTEM_ELECTRON_VERSION%%.*}")
  : ${ELECTRON_VERSION:?}
}

build() (
  # avoid cluttering user home
  export HOME="$srcdir/tmp_home"

  _electron_env

  local _electron_builder_options=(
    --linux dir
    --publish never
    -c.electronVersion="$SYSTEM_ELECTRON_VERSION"
  )

  cd "$_pkgsrc"
  npm pkg set devDependencies.electron="$SYSTEM_ELECTRON_VERSION"
  NODE_ENV=development pnpm install
  NODE_ENV=production pnpm run build
  NODE_ENV=production pnpm electron-builder "${_electron_builder_options[@]}"
)

package() {
  _electron_env
  depends=("electron$ELECTRON_VERSION")

  # asar
  install -Dm644 "$_pkgsrc/dist/linux-unpacked/resources/app.asar" -t "$pkgdir/$_install_path/$_pkgname/"

  # icon
  install -Dm644 "$_pkgsrc/build/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

  # license
  install -Dm644 "$_pkgsrc/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

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

exec electron${ELECTRON_VERSION} "/$_install_path/\${name}/app.asar" "\${flags[@]}" "\$@"
END

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/$_install_path/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Categories=Internet;Network;InstantMessaging;
END
}
