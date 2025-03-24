# Maintainer: mo_ mo_harchegani@tutamail.com
pkgname=kaleidoswap
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
url="https://kaleidoswap.com/"
license=('MIT')
depends=()
source=("https://github.com/kaleidoswap/desktop-app/releases/download/app-v0.1.0/KaleidoSwap_0.1.0_amd64.AppImage")
sha256sums=('SKIP')

prepare() {
	chmod +x "KaleidoSwap_${pkgver}_amd64.AppImage"
	"./KaleidoSwap_${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
  # Install app contents to /opt
  install -d "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/squashfs-root/"* "$pkgdir/opt/$pkgname/"
  chmod -R a+rX "$pkgdir/opt/$pkgname"

  # Create launcher
  install -d "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/kaleidoswap"
#!/bin/bash
cd /opt/kaleidoswap
exec ./AppRun "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/kaleidoswap"

  # Create desktop entry
  install -d "$pkgdir/usr/share/applications"
  cat <<EOF > "$pkgdir/usr/share/applications/kaleidoswap.desktop"
[Desktop Entry]
Name=KaleidoSwap
Comment=Swap tokens and NFTs securely on Ethereum and Starknet
Exec=/usr/bin/kaleidoswap
Icon=kaleidoswap
Terminal=false
Type=Application
Categories=Finance;Network;Utility;
StartupNotify=true
EOF

  # Install icon in multiple resolutions
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512/apps/KaleidoSwap.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/kaleidoswap.png"
  done
}

