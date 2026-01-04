# Maintainer: Mahmoud Almezali <mzmcsmzm@gmail.com>

pkgname=g-v2ray-appimage
pkgver=2.1
pkgrel=1
pkgdesc="Advanced V2Ray/Xray GUI Client for Linux"
arch=('x86_64')
url="https://github.com/almezali/g-v2ray"
license=('GPL3')

depends=(
  'python'
  'python-gobject'
  'gtk3'
  'gobject-introspection'
  'v2ray'
)

source=(
  "G-V2Ray-${pkgver}-x86_64.AppImage::https://raw.githubusercontent.com/almezali/g-v2ray/main/G-V2Ray-${pkgver}-x86_64.AppImage"
)

sha256sums=('SKIP')

prepare() {
  chmod +x "G-V2Ray-${pkgver}-x86_64.AppImage"
  ./G-V2Ray-${pkgver}-x86_64.AppImage --appimage-extract
}

package() {
  # install AppImage
  install -Dm755 "G-V2Ray-${pkgver}-x86_64.AppImage" \
    "$pkgdir/opt/g-v2ray/g-v2ray.AppImage"

  # launcher
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/g-v2ray" <<'EOF'
#!/bin/sh
exec /opt/g-v2ray/g-v2ray.AppImage "$@"
EOF

  # desktop file (from AppImage)
  install -Dm644 squashfs-root/*.desktop \
    "$pkgdir/usr/share/applications/g-v2ray.desktop"

  # icon (auto-detect)
  for icon in squashfs-root/*.png; do
    install -Dm644 "$icon" \
      "$pkgdir/usr/share/pixmaps/g-v2ray.png"
    break
  done
}

