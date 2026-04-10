# Maintainer: nightscaper2000 <dreamer@nightscaper2000.com>

pkgname=capsule-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Cross-platform media capture and compression application with real-time GUI preview"
arch=('x86_64')
url="https://capsule.ooo/"
license=('GPL-3.0-only')
depends=('ffmpeg')
provides=('capsule')
conflicts=('capsule')
source=("Capsule.AppImage::https://github.com/kamryn404/Capsule/releases/download/v${pkgver}/Capsule.appimage")
sha256sums=('436bf4c3ffe5b18353eda2fc3a508a563090c082cc450d10d39ae741e5c497a2')
noextract=('Capsule.AppImage')

options=(!strip !debug)

package() {
  install -Dm755 "${srcdir}/Capsule.AppImage" \
    "${pkgdir}/opt/capsule/Capsule.AppImage"

  chmod +x "${srcdir}/Capsule.AppImage"
  (cd "${srcdir}" && ./Capsule.AppImage --appimage-extract > /dev/null 2>&1)

  install -Dm644 "${srcdir}/squashfs-root/capsule.png" \
    "${pkgdir}/usr/share/pixmaps/capsule.png"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/capsule" << 'EOF'
#!/bin/sh
exec /opt/capsule/Capsule.AppImage --appimage-extract-and-run "$@"
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/capsule.desktop" << 'EOF'
[Desktop Entry]
Name=Capsule
Comment=Cross-platform media capture and compression application
Exec=capsule
Icon=/usr/share/pixmaps/capsule.png
Terminal=false
Type=Application
Categories=AudioVideo;Graphics;Utility;
EOF
}
