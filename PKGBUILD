pkgname=openwhispr-bin
pkgver=1.9.2
pkgrel=1
pkgdesc="Voice-to-text dictation app with local Whisper/Parakeet and cloud models"
arch=('x86_64')
url="https://github.com/OpenWhispr/openwhispr"
license=('MIT')
provides=('openwhispr')
conflicts=('openwhispr' 'openwhispr-vulkan' 'openwhispr-appimage')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gcc-libs'
  'gtk3'
  'libnotify'
  'libsecret'
  'libx11'
  'libxss'
  'libxtst'
  'nss'
  'xdg-utils'
)
optdepends=(
  'ydotool: Clipboard auto-paste on Wayland'
  'xdotool: Clipboard auto-paste on X11'
  'wtype: Clipboard auto-paste on wlroots Wayland'
  'wl-clipboard: Clipboard support on Wayland'
  'openwhispr-vulkan: Vulkan GPU-accelerated version (replaces this package)'
)
options=('!strip' '!debug')

source=(
  "https://github.com/OpenWhispr/openwhispr/releases/download/v${pkgver}/OpenWhispr-${pkgver}-linux-x64.tar.gz"
)
sha256sums=('af97777bc5857e14947aedf08d353dd27fc5d2f10e27a22a3f05f2f5a0f041cd')
# ^ Placeholder: the CI workflow replaces this with the real SHA-256
#   via `updpkgsums` every time the version is bumped.

package() {
  local src="${srcdir}/OpenWhispr-${pkgver}-linux-x64"
  local dst="${pkgdir}/opt/openwhispr"
  local license_dir="${pkgdir}/usr/share/licenses/${pkgname}"

  # Install app to /opt/openwhispr
  install -dm755 "${dst}"
  cp -r "${src}"/* "${dst}/"

  # Remove chrome-sandbox (not needed with --no-sandbox)
  rm -f "${dst}/chrome-sandbox"

  # Set permissions
  chmod +x "${dst}/open-whispr" "${dst}/chrome_crashpad_handler"
  find "${dst}/resources/bin" -type f -name '*-linux-x64' -exec chmod +x {} \;

  # /usr/bin launcher
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/openwhispr" <<'LAUNCHER'
#!/bin/bash
exec /opt/openwhispr/open-whispr --no-sandbox "$@"
LAUNCHER

  # .desktop file
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/openwhispr.desktop" <<EOF
[Desktop Entry]
Name=OpenWhispr
Comment=Voice-to-text dictation with local and cloud AI models
Exec=/opt/openwhispr/open-whispr --no-sandbox %U
Icon=openwhispr
Type=Application
Categories=Utility;AudioVideo;
StartupWMClass=open-whispr
MimeType=x-scheme-handler/openwhispr;
EOF

  # Icon
  install -Dm644 "${src}/resources/src/assets/icon.png" "${pkgdir}/usr/share/pixmaps/openwhispr.png"

  # License
  install -dm755 "${license_dir}"
  cp -r "${src}"/LICENSE* "${src}"/LICENSES* "${license_dir}/" 2>/dev/null || true
}
