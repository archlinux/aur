# Maintainer: Nathanael Bonfim <dev@nathabonfim59.com>

pkgname=dpcode-bin
pkgver=0.0.40
pkgrel=10
pkgdesc='DP Code desktop app packaged from the upstream AppImage'
arch=('x86_64')
_upstream_tag='v0.0.40'
_upstream_version='0.0.40'
_appimage_name="DP-Code-${_upstream_version}-x86_64.AppImage"
url='https://dpcode.cc'
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
provides=("dpcode=${pkgver}")
conflicts=('dpcode')
options=('!debug' '!emptydirs' '!strip')
source=(
  "${_appimage_name}::https://github.com/Emanuele-web04/dpcode/releases/download/${_upstream_tag}/${_appimage_name}"
  'dpcode-icon.png'
  'LICENSE'
)
sha256sums=(
  '75aa5a8a139f0a6ef698c46a7465bba42e1d45e21a1746915980e21df56534e9'
  '9fada842a88c3b1a503ee45756f781b7d32b39cc97579f4f1e880bb28606e728'
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
  cp -a --no-preserve=ownership "$srcdir/squashfs-root/." "$pkgdir/opt/$pkgname/"

  chmod -R a+rX "$pkgdir/opt/$pkgname"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/dpcode" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

appdir='/opt/dpcode-bin'
export APPDIR="$appdir"

if [[ -z "${CODEX_CLI_PATH-}" ]] && command -v codex >/dev/null 2>&1; then
  export CODEX_CLI_PATH="$(command -v codex)"
fi

export PATH="$appdir:$appdir/usr/bin:$appdir/usr/sbin:$PATH"
export XDG_DATA_DIRS="$appdir/usr/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
if [[ -d "$appdir/usr/share/glib-2.0/schemas" ]]; then
  export GSETTINGS_SCHEMA_DIR="$appdir/usr/share/glib-2.0/schemas${GSETTINGS_SCHEMA_DIR:+:$GSETTINGS_SCHEMA_DIR}"
fi

# Chromium/Electron tries to register a hard-coded
# app-org.chromium.Chromium-$pid.scope with systemd. In some sessions that
# scope already exists, causing a noisy StartTransientUnit failure before the
# app starts. This environment variable makes Chromium skip that optional
# registration path.
export FLATPAK_SANDBOX_DIR="${FLATPAK_SANDBOX_DIR:-/run/host}"

extra_flags=(
  --disable-vulkan
  --disable-features=Vulkan,DefaultANGLEVulkan,VulkanFromANGLE
)
if [[ "${DPCODE_DISABLE_GPU-}" == "1" ]]; then
  extra_flags+=(--disable-gpu --disable-gpu-compositing)
fi
if [[ "${DPCODE_USE_WAYLAND-}" == "1" && ( -n "${WAYLAND_DISPLAY-}" || "${XDG_SESSION_TYPE-}" == "wayland" ) ]]; then
  extra_flags+=(--enable-features=UseOzonePlatform --ozone-platform=wayland --ozone-platform-hint=wayland)
elif [[ -n "${DISPLAY-}" ]]; then
  export GDK_BACKEND=x11
  unset WAYLAND_DISPLAY
  extra_flags+=(--ozone-platform=x11 --ozone-platform-hint=x11)
else
  extra_flags+=(--ozone-platform-hint=auto)
fi

exec "$appdir/dpcode" --no-sandbox "${extra_flags[@]}" "$@"
EOF

  install -Dm644 "$srcdir/dpcode-icon.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/dpcode.png"
  install -Dm644 "$srcdir/dpcode-icon.png" \
    "$pkgdir/usr/share/pixmaps/dpcode.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/dpcode.desktop" << 'EOF'
[Desktop Entry]
Name=DP Code
Comment=DP Code desktop build
Exec=dpcode %U
Terminal=false
Type=Application
Icon=dpcode
StartupWMClass=dpcode
Categories=Development;
EOF

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
