# Maintainer: maria-rcks <maria@kuuro.net>

pkgname=codex-desktop-bin
pkgver=26.323.20928
pkgrel=1
pkgdesc='OpenAI Codex Desktop (prepatched Linux payload)'
arch=('x86_64')
_electron_pkg='electron40-bin'
_release_repo='maria-rcks/codex-desktop-aur'
_release_tag='codex-desktop-bin-26.323.20928-88f07cd31e98'
_bundle_name='codex-desktop-prepatched-26.323.20928-88f07cd31e98-x86_64.tar.gz'
url='https://openai.com/codex'
license=('custom')
depends=(
  "$_electron_pkg"
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'gcc-libs'
  'glib2'
  'gtk3'
  'libdrm'
  'libnotify'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxshmfence'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'openai-codex'
)
provides=('codex-desktop')
conflicts=('codex-desktop')
options=('!strip')

source=(
  "${_bundle_name}::https://github.com/${_release_repo}/releases/download/${_release_tag}/${_bundle_name}"
  'codex-icon.png'
)
sha256sums=(
  '1bcd9cd31f74a284c20fbba701c47e4d2e5d93bc5595e75b680f4be7addb98f9'
  'f33042b1a549fdc2c82b20e8eefa1fd5ac9f93147af40389c4773aaf48d097a7'
)

package() {
  cd "$srcdir"

  if [[ ! -d "$srcdir/resources" ]]; then
    echo "Missing extracted prepatched payload directory: $srcdir/resources" >&2
    return 1
  fi

  install -d "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/resources" "$pkgdir/opt/$pkgname/"

  # Electron runtime is provided by electron40-bin.
  install -Dm644 /dev/stdin "$pkgdir/opt/$pkgname/package.json" << 'EOF'
{
  "name": "codex-desktop-bin",
  "version": "26.323.20928",
  "main": "resources/app.asar"
}
EOF

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/codex-desktop" << 'EOF'
#!/usr/bin/env bash

export ELECTRON_FORCE_IS_PACKAGED=1

# Prefer the codex CLI from the official openai-codex package if available.
if [[ -z "${CODEX_CLI_PATH-}" ]] && command -v codex >/dev/null 2>&1; then
  export CODEX_CLI_PATH="$(command -v codex)"
fi

extra_flags=()
if [[ -n "${WAYLAND_DISPLAY-}" || "${XDG_SESSION_TYPE-}" == "wayland" ]]; then
  extra_flags+=(--enable-features=UseOzonePlatform --ozone-platform=wayland --ozone-platform-hint=wayland)
else
  extra_flags+=(--ozone-platform-hint=auto)
fi

exec /usr/bin/electron40 "${extra_flags[@]}" /opt/codex-desktop-bin/resources/app.asar "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/codex-desktop"

  install -Dm644 "$srcdir/codex-icon.png" "$pkgdir/usr/share/pixmaps/codex-desktop.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/codex-desktop.desktop" << 'EOF'
[Desktop Entry]
Name=Codex
Comment=OpenAI Codex Desktop
Exec=codex-desktop %U
Terminal=false
Type=Application
Icon=/usr/share/pixmaps/codex-desktop.png
StartupWMClass=Codex
Categories=Development;
MimeType=x-scheme-handler/codex;
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'EOF'
Codex Desktop is proprietary software by OpenAI.
See the upstream terms for usage and distribution rights.
EOF
}
