# Maintainer: Your Name <your@email.com>
pkgname=opencode-desktop-electron-bin
pkgver=1.14.48
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
        "opencode-desktop-${pkgver}-linux-x86_64.AppImage::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-x86_64.AppImage")

sha256sums=('SKIP'
            'e6d6161f923bb7d427cb2c801c754e9951e5be780bb01a4f68eaf426832995fd')

package() {
  local appimage="${srcdir}/opencode-desktop-${pkgver}-linux-x86_64.AppImage"
  local extractdir
  local appdir
  local desktop_source=
  local desktop_basename=
  local icon_name=
  local icon_source=
  local startup_wm_class=
  local candidate
  local had_nullglob=0
  extractdir="$(mktemp -d)"
  appdir="${extractdir}/squashfs-root"
  chmod +x "$appimage"
  (cd "$extractdir" && "$appimage" --appimage-extract >/dev/null)

  install -dm755 "${pkgdir}/opt/OpenCode"
  cp -a "$appdir"/. "${pkgdir}/opt/OpenCode/"
  find "${pkgdir}/opt/OpenCode" -type d -exec chmod 755 {} +

  if shopt -q nullglob; then
    had_nullglob=1
  fi
  shopt -s nullglob

  for candidate in "$appdir"/*.desktop "$appdir"/usr/share/applications/*.desktop; do
    if [[ -f "$candidate" ]]; then
      desktop_source="$candidate"
      break
    fi
  done
  [[ -n "$desktop_source" ]] || { echo "ERROR: desktop file not found"; exit 1; }

  desktop_basename="$(basename "$desktop_source")"
  icon_name="$(grep -m1 '^Icon=' "$desktop_source" | cut -d= -f2-)"
  [[ -n "$desktop_basename" ]] || desktop_basename='@opencode-aidesktop.desktop'
  [[ -n "$icon_name" ]] || icon_name='@opencode-aidesktop'
  startup_wm_class="$(grep -m1 '^StartupWMClass=' "$desktop_source" | cut -d= -f2-)"
  [[ -n "$startup_wm_class" ]] || startup_wm_class='OpenCode'

  for candidate in \
    "$appdir"/usr/share/icons/hicolor/*/apps/"${icon_name}".png \
    "$appdir"/usr/share/icons/hicolor/*/apps/*opencode*.png \
    "$appdir"/*.png; do
    if [[ -f "$candidate" ]]; then
      icon_source="$candidate"
      break
    fi
  done
  [[ -n "$icon_source" ]] || { echo "ERROR: icon asset not found"; exit 1; }

  if (( ! had_nullglob )); then
    shopt -u nullglob
  fi

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/opencode-desktop-electron" <<WRAPPER
#!/bin/sh
export APPDIR=/opt/OpenCode
export CHROME_DESKTOP=${desktop_basename}
exec /opt/OpenCode/AppRun --no-sandbox "\$@"
WRAPPER

  ln -sf opencode-desktop-electron "${pkgdir}/usr/bin/opencode-desktop"

  # Expose the bundled CLI as /usr/bin/opencode (mirrors Tauri package convention)
  ln -sf "/opt/OpenCode/resources/opencode-cli" "${pkgdir}/usr/bin/opencode"

  install -dm755 "${pkgdir}/usr/share"
  cp -a "${pkgdir}/opt/OpenCode/usr/share/icons" "${pkgdir}/usr/share/"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +

  shopt -s nullglob
  for candidate in "${pkgdir}"/usr/share/icons/hicolor/*/apps/"${icon_name}".png; do
    ln -sf "${icon_name}.png" "${candidate%/*}/opencode-desktop-electron.png"
    ln -sf "${icon_name}.png" "${candidate%/*}/opencode-desktop.png"
    ln -sf "${icon_name}.png" "${candidate%/*}/opencode.png"
  done
  if (( ! had_nullglob )); then
    shopt -u nullglob
  fi

  install -Dm644 "$icon_source" "${pkgdir}/opt/OpenCode/resources/icons/icon.png"

  # ── Desktop entries ───────────────────────────────────────────────────────────
  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/${desktop_basename}" <<DESKTOP
[Desktop Entry]
Name=OpenCode
Comment=OpenCode desktop client
Exec=opencode-desktop-electron %U
Icon=${icon_name}
Terminal=false
Type=Application
Categories=Development;
StartupNotify=true
StartupWMClass=${startup_wm_class}
X-GNOME-WMClass=${startup_wm_class}
MimeType=x-scheme-handler/opencode;
DESKTOP

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -rf "$extractdir"
}
