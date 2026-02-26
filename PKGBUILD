pkgname=hyprcord-bin
pkgver=1.0.4
pkgrel=2
pkgdesc="Hyprcord - a custom Discord client"
arch=('x86_64')
url="https://github.com/Bebbesi/HyprCord"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=('hyprcord')
conflicts=('hyprcord')

source=("https://github.com/Bebbesi/HyprCord/releases/download/v${pkgver}/Hyprcord-${pkgver}.AppImage")
sha256sums=('a921e180b78bee14b0c56e9ffc1215e6a6e11f5a7cbc6326752970aed858fe73')

prepare() {
  chmod +x "Hyprcord-${pkgver}.AppImage"
  "./Hyprcord-${pkgver}.AppImage" --appimage-extract
}

package() {
  # Install extracted AppImage
  install -dm755 "${pkgdir}/opt/hyprcord"
  cp -r squashfs-root/* "${pkgdir}/opt/hyprcord"

  # Symlink launcher
  install -Dm755 "${pkgdir}/opt/hyprcord/AppRun" \
    "${pkgdir}/usr/bin/hyprcord"

  # Install icon if present
  if [ -f squashfs-root/usr/share/icons/hicolor/256x256/apps/hyprcord.png ]; then
    install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/hyprcord.png \
      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hyprcord.png"
  fi

  # Create desktop entry manually (always works)
  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/hyprcord.desktop" <<EOF
[Desktop Entry]
Name=Hyprcord
Comment=Custom Discord client
Exec=hyprcord
Icon=hyprcord
Terminal=false
Type=Application
Categories=Network;Chat;
EOF
}