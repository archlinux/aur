# Maintainer: Meza Chat <hello@meza.chat>
pkgname=meza-desktop-bin
pkgver=0.0.14
pkgrel=1
pkgdesc='Meza desktop client - real-time encrypted chat'
arch=('x86_64')
url='https://meza.chat'
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libcups'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
provides=('meza-desktop')
conflicts=('meza-desktop')
options=('!strip' '!debug')
source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/mezalabs/meza/releases/download/desktop-v${pkgver}/Meza-${pkgver}-linux-x86_64.AppImage"
)
sha256sums=('f66ee334fd99bfc9bec84b7f40ccfef7989f9d8f41c37b11d0421596a51b6d77')

prepare() {
  chmod +x "${pkgname}-${pkgver}.AppImage"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  # Install app to /opt
  install -dm755 "${pkgdir}/opt/meza"
  cp -r squashfs-root/* "${pkgdir}/opt/meza/"

  # Fix permissions — AppImage extraction creates root-only dirs
  find "${pkgdir}/opt/meza" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/meza" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/opt/meza/meza"
  chmod 4755 "${pkgdir}/opt/meza/chrome-sandbox"
  chmod 755 "${pkgdir}/opt/meza/chrome_crashpad_handler"

  # Ensure icon is available for Electron window/tray
  if [ ! -f "${pkgdir}/opt/meza/resources/icon.png" ]; then
    install -Dm644 squashfs-root/meza.png "${pkgdir}/opt/meza/resources/icon.png"
  fi

  # Symlink binary into PATH
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/meza/meza "${pkgdir}/usr/bin/meza"

  # Desktop entry
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/meza.desktop" <<EOF
[Desktop Entry]
Name=Meza
Comment=Real-time encrypted chat
Exec=/opt/meza/meza %U
Icon=meza
Type=Application
Categories=Network;InstantMessaging;Chat;
MimeType=x-scheme-handler/meza;
EOF

  # Install icons (extracted from AppImage)
  for size in 16 32 48 64 128 256 512; do
    icon="squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/meza.png"
    if [ -f "${icon}" ]; then
      install -Dm644 "${icon}" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/meza.png"
    fi
  done

  # Fallback: install top-level icon if no hicolor icons were found
  if [ -f squashfs-root/meza.png ]; then
    install -Dm644 squashfs-root/meza.png \
      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/meza.png"
  fi
}
