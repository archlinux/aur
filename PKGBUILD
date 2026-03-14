# Maintainer: Your Name <your@email.com>
pkgname=opencode-desktop-electron-bin
pkgver=1.2.26
pkgrel=1
pkgdesc="OpenCode desktop client (Electron)"
arch=('x86_64')
url="https://github.com/anomalyco/opencode"
license=('MIT')
provides=('opencode-desktop-electron' 'opencode')
conflicts=('opencode-desktop-electron' 'opencode')
depends=('nss' 'libnotify' 'libxss' 'xdg-utils' 'hicolor-icon-theme' 'gtk3')
options=('!strip' '!debug')

source=("LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/v${pkgver}/LICENSE"
        "opencode-electron-${pkgver}-linux-x86_64.AppImage::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-electron-linux-x86_64.AppImage")

sha256sums=('SKIP'
            'a1b3c1ca5287206d1c1c62e46a844f66e9dd79a0d600c1a6bc4b9a434766c272')

package() {
  local appimage="${srcdir}/opencode-electron-${pkgver}-linux-x86_64.AppImage"
  local extractdir
  local appdir
  extractdir="$(mktemp -d)"
  appdir="${extractdir}/squashfs-root"
  chmod +x "$appimage"
  (cd "$extractdir" && "$appimage" --appimage-extract >/dev/null)

  install -dm755 "${pkgdir}/opt/OpenCode"
  cp -a "$appdir"/. "${pkgdir}/opt/OpenCode/"
  find "${pkgdir}/opt/OpenCode" -type d -exec chmod 755 {} +

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/opencode-desktop-electron" << 'WRAPPER'
#!/bin/sh
export APPDIR=/opt/OpenCode
export CHROME_DESKTOP=opencode-desktop-electron.desktop
exec /opt/OpenCode/AppRun --no-sandbox "$@"
WRAPPER

  # Expose the bundled CLI as /usr/bin/opencode (mirrors Tauri package convention)
  ln -sf "/opt/OpenCode/resources/opencode-cli" "${pkgdir}/usr/bin/opencode"

  # ── Icons ─────────────────────────────────────────────────────────────────────
  local icon_source=
  local candidate
  for candidate in \
    "${pkgdir}/opt/OpenCode/usr/share/icons/hicolor/128x128/apps/@opencode-aidesktop-electron.png" \
    "${pkgdir}/opt/OpenCode/usr/share/icons/hicolor/310x310/apps/@opencode-aidesktop-electron.png" \
    "${pkgdir}/opt/OpenCode/usr/share/icons/hicolor/64x64/apps/@opencode-aidesktop-electron.png"; do
    if [[ -f "$candidate" ]]; then
      icon_source="$candidate"
      break
    fi
  done
  [[ -n "$icon_source" ]] || { echo "ERROR: icon asset not found"; exit 1; }

  install -dm755 "${pkgdir}/usr/share"
  cp -a "${pkgdir}/opt/OpenCode/usr/share/icons" "${pkgdir}/usr/share/"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
  install -Dm644 "$icon_source" "${pkgdir}/opt/OpenCode/resources/icons/icon.png"

  # ── Desktop entries ───────────────────────────────────────────────────────────
  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/opencode-desktop-electron.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Opencode
Comment=OpenCode desktop client
Exec=opencode-desktop-electron %U
Icon=@opencode-aidesktop-electron
Terminal=false
Type=Application
Categories=Development;
StartupNotify=true
StartupWMClass=OpenCode
MimeType=x-scheme-handler/opencode;
DESKTOP

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -rf "$extractdir"
}
