# Maintainer: Your Name <your@email.com>
pkgname=opencode-desktop-electron-bin
pkgver=1.2.26
pkgrel=1
pkgdesc="OpenCode desktop client (Electron)"
arch=('x86_64')
url="https://github.com/anomalyco/opencode"
license=('MIT')
provides=('opencode-desktop-electron')
conflicts=('opencode-desktop-electron')
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

  # Symlink the actual Electron binary to a clean name in /usr/bin
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/OpenCode/@opencode-aidesktop-electron" "${pkgdir}/usr/bin/opencode-desktop-electron"

  # Rename icons from @opencode-aidesktop-electron.png -> opencode-desktop-electron.png
  find "${pkgdir}/usr/share/icons" -type f -name "@opencode-aidesktop-electron*" 2>/dev/null | while read -r ico; do
    local dir ext new
    dir="$(dirname "$ico")"
    ext="${ico##*.}"
    mv "$ico" "$dir/opencode-desktop-electron.$ext"
  done

  # Fix .desktop file
  local desktop="${pkgdir}/usr/share/applications/opencode-desktop-electron.desktop"
  if [[ -f "$desktop" ]]; then
    sed -i \
      -e 's|^Exec=.*|Exec=opencode-desktop-electron %U|' \
      -e 's|^Name=.*|Name=Opencode (Electron)|' \
      -e 's|^Icon=.*|Icon=opencode-desktop-electron|' \
      "$desktop"
  else
    install -Dm644 /dev/stdin "$desktop" <<DESKTOP
[Desktop Entry]
Name=Opencode (Electron)
Comment=OpenCode desktop client
Exec=opencode-desktop-electron %U
Icon=opencode-desktop-electron
Type=Application
Categories=Development;
StartupNotify=true
StartupWMClass=OpenCode
MimeType=x-scheme-handler/opencode;
DESKTOP
  fi

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
