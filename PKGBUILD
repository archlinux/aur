# Maintainer:

## options
: ${_install_path:=usr/share}
: ${_electron_builder_version:=<26}

_pkgname="legcord"
pkgname="$_pkgname"
pkgver=1.1.5
pkgrel=1
pkgdesc="Discord client with builtin client mod and theme support"
url="https://github.com/Legcord/Legcord"
license=('OSL-3.0')
arch=('any')

depends=(
  'electron'
)
makedepends=(
  'git'
  'nodejs'
  'pnpm'
)
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('2a4cfe965899a61042aa7a6171f40c9d4c070e6e3e8f65b8a21f8ef08a00f693')

build() (
  # avoid cluttering user home
  export HOME="$srcdir/tmp_home"
  export XDG_CACHE_HOME="$srcdir/tmp_cache"
  export XDG_CONFIG_HOME="$srcdir/tmp_config"
  export XDG_DATA_HOME="$srcdir/tmp_data"
  export XDG_STATE_HOME="$srcdir/tmp_state"

  local _electron_version=$(cat /usr/lib/electron/version)

  sed -E \
    -e 's#("electron"): "[^"]+",#\1: "'${_electron_version}'",#' \
    -i "$_pkgsrc/package.json"

  if [ -n "$_electron_builder_version" ]; then
    sed -E -e 's#("electron-builder"): "[^"]+",#\1: "'${_electron_builder_version}'",#' -i "$_pkgsrc/package.json"
  fi

  local _electron_builder_options=(
    --linux dir
    --publish never
    -c.electronDist="/usr/lib/electron${_electron_version%%.*}"
    -c.electronVersion="$_electron_version"
  )

  cd "$_pkgsrc"
  NODE_ENV=development pnpm install # --ignore-scripts
  NODE_ENV=production pnpm run build
  NODE_ENV=production pnpm electron-builder "${_electron_builder_options[@]}"
)

package() {
  local _electron_version=$(cat /usr/lib/electron/version)
  depends=("electron${_electron_version%%.*}")

  # asar
  install -Dm644 "$_pkgsrc/dist/linux-unpacked/resources/app.asar" -t "$pkgdir/$_install_path/$_pkgname/"

  # icon
  install -Dm644 "$_pkgsrc/build/icon.png" "$pkgdir/$_install_path/pixmaps/$_pkgname.png"

  # license
  install -Dm644 "$_pkgsrc/license.txt" "$pkgdir/$_install_path/licenses/$pkgname/LICENSE"

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

exec electron${_electron_version%%.*} "/$_install_path/\${name}/app.asar" "\${flags[@]}" "\$@"
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
