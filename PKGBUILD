# Maintainer: firtoz <aur at firtoz dot com>
# Upstream: https://github.com/webadderall/Recordly

pkgname=recordly-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Open-source screen recorder and editor with auto-zoom, cursor effects, and polished video export"
arch=(x86_64)
url="https://github.com/webadderall/Recordly"
license=(MIT)
depends=(fuse2)
source=(
  "https://github.com/webadderall/Recordly/releases/download/v${pkgver}/Recordly-linux-x64.AppImage"
  "recordly.desktop"
  "https://raw.githubusercontent.com/webadderall/Recordly/main/LICENSE"
)
sha256sums=(
  'd1a058bfc4972029b28e5f989dc3c678c5c4e960f3d352d57dc2b00f1b19b6b5'  # AppImage v${pkgver}
  'SKIP'
  'd8824b8c038eba113227cc707ac22c7a497583ae6115b052729a1d104f692d82'  # Upstream MIT LICENSE
)
options=(!strip)

package() {
  install -d "$pkgdir/opt/recordly"
  install -Dm755 "$srcdir/Recordly-linux-x64.AppImage" "$pkgdir/opt/recordly/Recordly.AppImage"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/recordly" << 'EOF'
#!/bin/sh
exec /opt/recordly/Recordly.AppImage "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/recordly"

  install -Dm644 "$srcdir/recordly.desktop" "$pkgdir/usr/share/applications/dev.recordly.app.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Extract icons from AppImage so Icon=dev.recordly.app in the .desktop resolves
  cd "$srcdir"
  chmod +x Recordly-linux-x64.AppImage
  ./Recordly-linux-x64.AppImage --appimage-extract
  for size in 16 24 32 48 64 128 256 512 1024; do
    src="squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/recordly.png"
    if [ -f "$src" ]; then
      install -Dm644 "$src" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/dev.recordly.app.png"
    fi
  done
  rm -rf squashfs-root
}
