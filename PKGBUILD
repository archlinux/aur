pkgname=hyprcord-bin
pkgver=1.0.5
pkgrel=2
pkgdesc="Hyprcord - a custom Discord client"
arch=('x86_64')
url="https://github.com/Bebbesi/HyprCord"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
makedepends=('desktop-file-utils')
provides=('hyprcord')
conflicts=('hyprcord')

source=("https://github.com/Bebbesi/HyprCord/releases/download/hyprcordv1.0.5/Hyprcord-1.0.5.AppImage")
sha256sums=('945d840d53201d72ecdc575cbf9c0341f815db3be4e43cb77342ad03feeafd2f')

prepare() {
  chmod +x "Hyprcord-${pkgver}.AppImage"
  "./Hyprcord-${pkgver}.AppImage" --appimage-extract
}

package() {
  # Install app to /opt
  install -dm755 "${pkgdir}/opt/hyprcord"
  cp -r squashfs-root/* "${pkgdir}/opt/hyprcord"

  # Fix Chrome sandbox permissions (Crucial for extracted Electron apps)
  if [ -f "${pkgdir}/opt/hyprcord/chrome-sandbox" ]; then
    chmod 4755 "${pkgdir}/opt/hyprcord/chrome-sandbox"
  fi

  # Create a wrapper script instead of symlinking AppRun
  install -d "${pkgdir}/usr/bin"
  cat <<EOF > "${pkgdir}/usr/bin/hyprcord"
#!/bin/sh
exec /opt/hyprcord/hyprcord --ozone-platform-hint=auto "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/hyprcord"

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