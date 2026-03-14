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
        "opencode-electron-${pkgver}-linux-amd64.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-electron-linux-amd64.deb")

sha256sums=('SKIP'
            'ffffeb24e3a6d52662fd76e5e39fd50a36f342ff1541cfdd0a1618ce13c235c2')

package() {
  bsdtar -xf "${srcdir}/opencode-electron-${pkgver}-linux-amd64.deb" -C "${srcdir}"

  local data_tar
  data_tar="$(ls "${srcdir}"/data.tar.* 2>/dev/null | head -1)"
  [[ -z "$data_tar" ]] && { echo "ERROR: data.tar.* not found"; exit 1; }

  bsdtar -xf "$data_tar" -C "${pkgdir}"

  # ── Binaries ──────────────────────────────────────────────────────────────────
  # Symlink the Electron GUI binary
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/OpenCode/@opencode-aidesktop-electron" "${pkgdir}/usr/bin/opencode-desktop-electron"

  # Expose the bundled CLI as /usr/bin/opencode (mirrors Tauri package convention)
  ln -sf "/opt/OpenCode/resources/opencode-cli" "${pkgdir}/usr/bin/opencode"

  # ── Icons ─────────────────────────────────────────────────────────────────────
  # Use find -exec to handle @ prefix filenames that confuse shell globs
  find "${pkgdir}/usr/share/icons" -type f -name "*.png" 2>/dev/null \
    -exec bash -c 'mv "$1" "$(dirname "$1")/opencode-desktop-electron.png"' _ {} \;

  # ── Desktop entries ───────────────────────────────────────────────────────────
  # Remove ALL .desktop files the .deb installed (find handles @ prefix safely)
  find "${pkgdir}/usr/share/applications" -name "*.desktop" -delete 2>/dev/null || true

  # Install exactly one clean entry
  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/opencode-desktop-electron.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Opencode
Comment=OpenCode desktop client
Exec=opencode-desktop-electron %U
Icon=opencode-desktop-electron
Type=Application
Categories=Development;
StartupNotify=true
StartupWMClass=@opencode-ai/desktop-electron
MimeType=x-scheme-handler/opencode;
DESKTOP

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
