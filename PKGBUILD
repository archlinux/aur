# Maintainer:

: ${_electron_dist:=/usr/lib/electron}
: ${_install_path:=usr/share}

: ${_commit:=07451f0d7e110cf6d31d0e32abedcefcff256d78}

_pkgname="legcord"
pkgname="$_pkgname"
pkgver=1.1.0
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
  'pnpm'
  'yarn'
)
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  local _electron_version="$(cat $_electron_dist/version)"
  sed -E -e 's#("electron"): "[^"]+",#\1: "'${_electron_version}'",#' \
    -i "$_pkgsrc/package.json"
}

build() (
  export HOME="$srcdir/tmp_home"
  export XDG_CACHE_HOME="$srcdir/tmp_cache"
  export XDG_CONFIG_HOME="$srcdir/tmp_config"
  export XDG_DATA_HOME="$srcdir/tmp_data"
  export XDG_STATE_HOME="$srcdir/tmp_state"

  export NODE_ENV=production

  cd "$_pkgsrc"
  NODE_ENV=development pnpm install --ignore-scripts
  pnpm run build
  pnpm -c exec "electron-builder --linux dir --publish never -c.electronDist=${_electron_dist} -c.electronVersion=$(cat $_electron_dist/version)"
)

package() {
  install -Dm644 "$_pkgsrc/dist/linux-unpacked/resources/app.asar" -t "$pkgdir/$_install_path/$_pkgname/"

  install -Dm644 "$_pkgsrc/build/icon.png" "$pkgdir/$_install_path/pixmaps/$_pkgname.png"

  install -Dm644 "$_pkgsrc/license.txt" "$pkgdir/$_install_path/licenses/$pkgname/LICENSE"

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

exec electron "/$_install_path/\${name}/app.asar" "\${flags[@]}" "\$@"
END

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
