# Maintainer: Hufflez <jackattacker518@gmail.com>
pkgname=t3code-git
_pkgname=t3code
pkgver=0.0.24.nightly.20260510.249.r6.g447236d
pkgrel=1
pkgdesc='T3 Code desktop app (git version, built from source)'
arch=('x86_64')
url='https://t3.codes'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdbusmenu-glib'
  'libdrm'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
)
makedepends=(
  'git'
  'bun'
  'nodejs'
  'python'
)
optdepends=(
  'openai-codex: use the system-installed Codex CLI'
)
provides=("t3code=${pkgver}")
conflicts=('t3code' 't3code-bin')
options=('!debug' '!emptydirs' '!strip')
source=("${_pkgname}::git+https://github.com/pingdotgg/t3code.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  # Example output: 0.0.13.r6.ga17a017
}

prepare() {
  cd "$srcdir/$_pkgname"
  bun install --frozen-lockfile
}

build() {
  cd "$srcdir/$_pkgname"
  bun run dist:desktop:linux

  local _appimage
  _appimage=$(find release/ -name '*.AppImage' -print -quit)
  if [[ -z "$_appimage" ]]; then
    echo "ERROR: No AppImage found in release/" >&2
    return 1
  fi

  chmod +x "$_appimage"
  "$_appimage" --appimage-extract
}

package() {
  cd "$srcdir/$_pkgname"

  # Install extracted AppImage to /opt (per Electron packaging guidelines for bundled apps)
  install -d "$pkgdir/opt/$pkgname"
  cp -a squashfs-root/. "$pkgdir/opt/$pkgname/"
  chmod -R a+rX "$pkgdir/opt/$pkgname"

  # Wrapper script (Wayland/X11 detection, Codex CLI integration)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/t3code" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

appdir='/opt/t3code-git'
export APPDIR="$appdir"

if [[ -z "${CODEX_CLI_PATH-}" ]] && command -v codex >/dev/null 2>&1; then
  export CODEX_CLI_PATH="$(command -v codex)"
fi

export PATH="$appdir:$PATH"

extra_flags=()
if [[ -n "${WAYLAND_DISPLAY-}" || "${XDG_SESSION_TYPE-}" == "wayland" ]]; then
  extra_flags+=(--enable-features=UseOzonePlatform --ozone-platform=wayland --ozone-platform-hint=wayland)
else
  extra_flags+=(--ozone-platform-hint=auto)
fi

exec "$appdir/t3code" --no-sandbox "${extra_flags[@]}" "$@"
EOF

  # Icon (from upstream source tree)
  install -Dm644 "assets/prod/black-universal-1024.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/t3code.png"
  install -Dm644 "assets/prod/black-universal-1024.png" \
    "$pkgdir/usr/share/pixmaps/t3code.png"

  # Desktop entry (Icon= without extension per freedesktop spec)
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/t3code.desktop" << 'EOF'
[Desktop Entry]
Name=T3 Code
Comment=T3 Code desktop application
Exec=t3code %U
Terminal=false
Type=Application
Icon=t3code
StartupWMClass=t3code
Categories=Development;
EOF

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
