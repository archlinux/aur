# Maintainer: Mahmoud Almezali <mzmcsmzm@gmail.com>

pkgname=g2-v2ray-appimage
pkgver=2.2
pkgrel=1
pkgdesc="Advanced V2Ray/Xray GUI Client for Linux (G2)"
arch=('x86_64')
url="https://github.com/almezali/g-v2ray"
license=('GPL3')

depends=(
  'python'
  'python-gobject'
  'gtk3'
  'gobject-introspection'
  'v2ray'
  'python-qrcode'
  'python-pillow'
)

source=(
  "G2-V2Ray-${pkgver}-x86_64.AppImage::https://raw.githubusercontent.com/almezali/g-v2ray/main/G2-V2Ray-${pkgver}-x86_64.AppImage"
)

sha256sums=('SKIP')

prepare() {
  chmod +x "G2-V2Ray-${pkgver}-x86_64.AppImage"
  ./G2-V2Ray-${pkgver}-x86_64.AppImage --appimage-extract
}

package() {
  # AppImage
  install -Dm755 \
    "G2-V2Ray-${pkgver}-x86_64.AppImage" \
    "$pkgdir/opt/g2-v2ray/g2-v2ray.AppImage"

  # launcher
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/g2-v2ray" <<'EOF'
#!/bin/sh
exec /opt/g2-v2ray/g2-v2ray.AppImage "$@"
EOF

  # desktop file (from AppImage)
  install -Dm644 squashfs-root/*.desktop \
    "$pkgdir/usr/share/applications/g2-v2ray.desktop"

  # icon (auto-detect)
  for icon in squashfs-root/*.png; do
    install -Dm644 "$icon" \
      "$pkgdir/usr/share/pixmaps/g2-v2ray.png"
    break
  done
}

