# Maintainer: Your Name <your@email.com>
pkgname=opencode-desktop-electron-bin
pkgver=1.2.25
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
            'e672a7aab9c003d597c7174b4c6b01fba2d8a468cfb28cdf6b92dcc49405b621')

package() {
  bsdtar -xf "${srcdir}/opencode-electron-${pkgver}-linux-amd64.deb" -C "${srcdir}"

  local data_tar
  data_tar="$(ls "${srcdir}"/data.tar.* 2>/dev/null | head -1)"
  [[ -z "$data_tar" ]] && { echo "ERROR: data.tar.* not found"; exit 1; }

  bsdtar -xf "$data_tar" -C "${pkgdir}"

  # Symlink /usr/bin/opencode-desktop-electron -> actual Electron binary in /opt/OpenCode
  local binary
  for candidate in \
      "${pkgdir}/opt/OpenCode/opencode" \
      "${pkgdir}/opt/OpenCode/OpenCode"; do
    [[ -f "$candidate" ]] && binary="$candidate" && break
  done

  if [[ -n "$binary" ]]; then
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/OpenCode/$(basename "$binary")" "${pkgdir}/usr/bin/opencode-desktop-electron"
  else
    echo "WARNING: could not find Electron binary in /opt/OpenCode/"
  fi

  # Fix icons: strip @scopedname. prefix -> opencode-desktop-electron.
  find "${pkgdir}/usr/share/icons" -type f 2>/dev/null | while read -r ico; do
    local dir base new
    dir="$(dirname "$ico")"
    base="$(basename "$ico")"
    new="$(echo "$base" | sed 's/@[^.]*\./opencode-desktop-electron./')"
    [[ "$base" != "$new" ]] && mv "$ico" "$dir/$new"
  done

  # Fix .desktop: Exec, Name, Icon
  local desktop found_desktop
  desktop="${pkgdir}/usr/share/applications/opencode-desktop-electron.desktop"
  found_desktop="$(find "${pkgdir}/usr/share/applications" -name "*.desktop" 2>/dev/null | head -1)"
  if [[ -n "$found_desktop" ]]; then
    sed -i \
      -e 's|^Exec=.*|Exec=opencode-desktop-electron %U|' \
      -e 's|^Name=.*|Name=Opencode (Electron)|' \
      -e 's|^Icon=.*|Icon=opencode-desktop-electron|' \
      "$found_desktop"
    [[ "$found_desktop" != "$desktop" ]] && mv "$found_desktop" "$desktop"
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
StartupWMClass=opencode
DESKTOP
  fi

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
