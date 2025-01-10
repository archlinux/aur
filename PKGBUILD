# Maintainer:

: ${_commit:=29b6c8b750f0d8ab768cd229776e88a57dde7a16}

_pkgname="legcord"
pkgname="$_pkgname"
pkgver=1.0.6
pkgrel=2
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

build() {
  cd "$_pkgsrc"
  pnpm install --frozen-lockfile --ignore-scripts
  pnpm run packageQuick
}

package() {
  install -Dm644 "$_pkgsrc/dist/"*"-unpacked/resources/app.asar" "$pkgdir/usr/share/$_pkgname/app.asar"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/legcord" << END
#!/usr/bin/env bash

set -euo pipefail

: \${XDG_CONFIG_HOME:=\$HOME/.config}

name=$_pkgname
flags_file="\${XDG_CONFIG_HOME}/\${name}-flags.conf"
fallback_file="\${XDG_CONFIG_HOME}/electron-flags.conf"

lines=()
if [[ -f "\${flags_file}" ]]; then
  mapfile -t lines < "\${flags_file}"
elif [[ -f "\${fallback_file}" ]]; then
  mapfile -t lines < "\${fallback_file}"
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

exec electron "/usr/share/$_pkgname/app.asar" "\${flags[@]}" "\$@"
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/legcord.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Categories=Internet;Network;InstantMessaging;
END

  install -Dm644 "$_pkgsrc/build/icon.png" "$pkgdir/usr/share/pixmaps/legcord.png"

  install -Dm644 "$_pkgsrc/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
