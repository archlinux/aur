# Maintainer: Kaden Frisk <fufferpish@gmail.com>
#
# NOTE: Upstream only provides a moving "latest" AppImage URL and no stable versioned downloads.
# This package therefore tracks "latest" and may require rebuilds to pull updates.
# To update: rebuild the package (e.g. makepkg -Csf).

pkgname=open-interpreter-desktop-bin
pkgver=latest
pkgrel=1
pkgdesc="Open Interpreter Desktop Agent (AppImage, upstream is 'latest' only)"
arch=('x86_64')
url="https://openinterpreter.com/"
license=('custom')
depends=('fuse2')
provides=('interpreter-desktop')
conflicts=('interpreter-desktop')
options=(!strip !debug)

# Moving target ("latest") — checksum cannot be pinned reliably.
source=("Interpreter.AppImage::https://openinterpreter.com/download/linux/appimage")
sha256sums=('SKIP')

install="${pkgname}.install"

package() {
  # AppImage
  install -Dm755 "${srcdir}/Interpreter.AppImage" \
    "${pkgdir}/opt/interpreter-desktop/Interpreter.AppImage"

  # Convenience wrapper
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/interpreter-desktop" <<'EOF'
#!/bin/sh
exec /opt/interpreter-desktop/Interpreter.AppImage "$@"
EOF

  # Desktop entry (no custom icon installed)
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/interpreter-desktop.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Interpreter: The Desktop Agent
Comment=Open Interpreter Desktop Agent
Exec=/opt/interpreter-desktop/Interpreter.AppImage
Terminal=false
Categories=Development;Utility;
Icon=utilities-terminal
StartupNotify=true
EOF
}