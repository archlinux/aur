pkgname=hyprcord-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Hyprcord - a custom Discord client"
arch=('x86_64')
url="https://github.com/Bebbesi/HyprCord"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
makedepends=('desktop-file-utils')
provides=('hyprcord')
conflicts=('hyprcord')

source=("https://github.com/Bebbesi/HyprCord/releases/download/hyprcordv1.0.5/Hyprcord-1.0.5.AppImage")
sha256sums=('a921e180b78bee14b0c56e9ffc1215e6a6e11f5a7cbc6326752970aed858fe73')

prepare() {
  chmod +x "Hyprcord-${pkgver}.AppImage"
  "./Hyprcord-${pkgver}.AppImage" --appimage-extract
}

package() {
  # Install app to /opt
  install -dm755 "${pkgdir}/opt/hyprcord"
  cp -r squashfs-root/* "${pkgdir}/opt/hyprcord"

  # Symlink binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/hyprcord/AppRun" "${pkgdir}/usr/bin/hyprcord"

  # Install icon if present
  if [ -f squashfs-root/usr/share/icons/hicolor/256x256/apps/hyprcord.png ]; then
    install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/hyprcord.png \
      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hyprcord.png"
  fi

  # Desktop file
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

  desktop-file-validate "${pkgdir}/usr/share/applications/hyprcord.desktop"

  # Install license if available
  if [ -f squashfs-root/LICENSE ]; then
    install -Dm644 squashfs-root/LICENSE \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}