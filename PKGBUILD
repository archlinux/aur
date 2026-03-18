# Maintainer: Agnay Srivastava <srivasa@rose-hulman.edu>
pkgname=tsenta-bin
pkgver=3.5.33
pkgrel=1
pkgdesc="Tsenta - Automated job application assistant"
arch=('x86_64')
url="https://github.com/tsenta/tsenta-desktop-linux"
license=('custom:proprietary')
depends=('hicolor-icon-theme' 'fuse2')
provides=('tsenta')
conflicts=('tsenta')
options=('!strip')
source=("https://github.com/tsenta/tsenta-desktop-linux/releases/download/v${pkgver}/Tsenta-3.5.33-x64.AppImage")
sha256sums=('00b776d31543eb068a861b3ba4056b77ec95d90c0935e524f5038b5637e1ee48')

package() {
  install -Dm755 "${srcdir}/Tsenta-3.5.33-x64.AppImage" "${pkgdir}/opt/tsenta/tsenta.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/tsenta" << 'LAUNCHER'
#!/bin/bash
exec /opt/tsenta/tsenta.AppImage --no-sandbox "$@"
LAUNCHER
  chmod 755 "${pkgdir}/usr/bin/tsenta"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/tsenta.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Tsenta
Comment=Automated job application assistant
Exec=/usr/bin/tsenta %U
Icon=tsenta
Type=Application
Categories=Utility;Network;
MimeType=x-scheme-handler/autojobs;
DESKTOP

  cd "${srcdir}"
  chmod +x "Tsenta-3.5.33-x64.AppImage"
  ./"Tsenta-3.5.33-x64.AppImage" --appimage-extract tsenta.png 2>/dev/null || true
  if [ -f squashfs-root/tsenta.png ]; then
    install -Dm644 squashfs-root/tsenta.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/tsenta.png"
  fi
}
