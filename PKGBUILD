# Maintainer:
# Contributor: Brad Johnson <bradsk88@gmail.com>

: ${electronDist:=/usr/lib/electron}

_pkgname="gitify"
pkgname="$_pkgname-git"
pkgver=5.18.0.r1.ga0a96bf
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
  'npm'
  'pnpm'
  'yarn'
)

provides=("$_pkgname")
conflicts=(
  "$_pkgname"
  'gitify-bin'
)

_pkgsrc="$_pkgname"
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  icns2png -x "$_pkgsrc/assets/images/app-icon.icns"
  mv app-icon_512x512x32.png "$_pkgname.png"

  cd "$_pkgsrc"
  pnpm install
}

build() {
  cd "$_pkgsrc"
  NODE_ENV=production pnpm run build
  NODE_ENV=production pnpm run prepare:remove-source-maps
  NODE_ENV=production pnpm -c exec "electron-builder --linux dir -c.electronDist=${electronDist} -c.electronVersion=$(cat /usr/lib/electron/version)"
}

package() {
  install -Dm644 "$_pkgsrc/dist/linux-unpacked/resources/app.asar" -t "$pkgdir/usr/share/$_pkgname/"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm644 "$_pkgname.png" -t "$pkgdir/usr/share/pixmaps/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env bash

name=$_pkgname
flags_file="\${XDG_CONFIG_HOME:-\$HOME/.config}/\${name}-flags.conf"
fallback_file="\${XDG_CONFIG_HOME:-\$HOME/.config}/electron-flags.conf"

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

exec /usr/bin/electron "/usr/share/\${name}/app.asar" "\${flags[@]}" "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
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
}
