# Maintainer: anon

pkgname=t3code-nightly-bin
pkgver=0.0.28_nightly.20260615.558
pkgrel=1
pkgdesc='T3 Code nightly desktop app packaged from the upstream AppImage'
arch=('x86_64')
_upstream_tag='v0.0.28-nightly.20260615.558'
_upstream_version='0.0.28-nightly.20260615.558'
_appimage_name="T3-Code-${_upstream_version}-x86_64.AppImage"
url='https://t3.codes'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
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
  'zlib'
)
optdepends=(
  'openai-codex: use the system-installed Codex CLI'
)
provides=("t3code-nightly=${pkgver}")
conflicts=('t3code-nightly')
options=('!debug' '!emptydirs' '!strip')
source=(
  "${_appimage_name}::https://github.com/pingdotgg/t3code/releases/download/${_upstream_tag}/${_appimage_name}"
  't3code-icon.png'
  'LICENSE'
)
sha256sums=(
  'a04c8ea45b1d0cf7dd16d3034d57d43afbf394a0d06769c2cabe36e5283e2f90'
  '52c86008b11f90f36b8a8f4cc43b1352d5fda9084c6e5691b806f5bca1a968b6'
  '935d8f2af0c703f9c39517ee57cc4930b19d02d533be930b63f0e82f93614b43'
)

prepare() {
  chmod +x "$srcdir/$_appimage_name"
  rm -rf "$srcdir/squashfs-root"
  "$srcdir/$_appimage_name" --appimage-extract >/dev/null

  if [[ ! -d "$srcdir/squashfs-root" ]]; then
    echo "Failed to extract AppImage payload." >&2
    return 1
  fi
}

package() {
  install -d "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$pkgname/"

  # Preserve upstream execute bits while ensuring the payload stays readable.
  chmod -R a+rX "$pkgdir/opt/$pkgname"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/t3code-nightly" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

appdir='/opt/t3code-nightly-bin'
export APPDIR="$appdir"

if [[ -z "${CODEX_CLI_PATH-}" ]] && command -v codex >/dev/null 2>&1; then
  export CODEX_CLI_PATH="$(command -v codex)"
fi

export PATH="$appdir:$appdir/usr/bin:$appdir/usr/sbin:$PATH"
export XDG_DATA_DIRS="$appdir/usr/share${XDG_DATA_DIRS:+:$XDG_DATA_DIRS}"
export GSETTINGS_SCHEMA_DIR="$appdir/usr/share/glib-2.0/schemas${GSETTINGS_SCHEMA_DIR:+:$GSETTINGS_SCHEMA_DIR}"

extra_flags=()
if [[ -n "${WAYLAND_DISPLAY-}" || "${XDG_SESSION_TYPE-}" == "wayland" ]]; then
  extra_flags+=(--enable-features=UseOzonePlatform --ozone-platform=wayland --ozone-platform-hint=wayland)
else
  extra_flags+=(--ozone-platform-hint=auto)
fi

exec "$appdir/t3code" --no-sandbox "${extra_flags[@]}" "$@"
EOF

  ln -s t3code-nightly "$pkgdir/usr/bin/t3-code-nightly-desktop"

  install -Dm644 "$srcdir/t3code-icon.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/t3code-nightly.png"
  ln -s t3code-nightly.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/t3-code-nightly-desktop.png"
  install -Dm644 "$srcdir/t3code-icon.png" \
    "$pkgdir/usr/share/pixmaps/t3code-nightly.png"
  ln -s t3code-nightly.png "$pkgdir/usr/share/pixmaps/t3-code-nightly-desktop.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/t3code-nightly.desktop" << 'EOF'
[Desktop Entry]
Name=T3 Code Nightly
Comment=T3 Code nightly desktop build
Exec=t3code-nightly %U
Terminal=false
Type=Application
Icon=t3code-nightly
StartupWMClass=t3code
Categories=Development;
EOF

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
