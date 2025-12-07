# Maintainer: Saeed Vaziry <mr.saeedvaziry@gmail.com>
pkgname=tweakphp
pkgver=0.13.0
pkgrel=1
pkgdesc="A desktop application with a code editor to tweak your PHP code"
arch=('x86_64' 'aarch64')
url="https://github.com/tweakphp/tweakphp"
license=('MIT')
depends=('zlib')

source_x86_64=("$pkgname-$pkgver-x64.AppImage::https://github.com/tweakphp/tweakphp/releases/download/v$pkgver/TweakPHP-$pkgver.AppImage")
source_aarch64=("$pkgname-$pkgver-arm64.AppImage::https://github.com/tweakphp/tweakphp/releases/download/v$pkgver/TweakPHP-$pkgver-arm64.AppImage")

sha256sums_x86_64=('ea5648aa2b6e07ae0aac0d4a9c43d8f8db7daa030e5eabb0b33d1c4e5971df61')
sha256sums_aarch64=('e8551d298bb1fc47cb0614751325d8decc8b736989338dd7e0412e16884711f7')

noextract=("$pkgname-$pkgver-x64.AppImage" "$pkgname-$pkgver-arm64.AppImage")

prepare() {
  cd "$srcdir"
  
  # Make AppImage executable
  if [ "$CARCH" = "x86_64" ]; then
    chmod +x "$pkgname-$pkgver-x64.AppImage"
  else
    chmod +x "$pkgname-$pkgver-arm64.AppImage"
  fi
}

package() {
  cd "$srcdir"
  
  # Extract AppImage
  if [ "$CARCH" = "x86_64" ]; then
    ./"$pkgname-$pkgver-x64.AppImage" --appimage-extract > /dev/null
  else
    ./"$pkgname-$pkgver-arm64.AppImage" --appimage-extract > /dev/null
  fi
  
  # Install application files
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r squashfs-root/* "$pkgdir/usr/lib/$pkgname/"
  
  # Fix permissions - AppImage extracts with 700, we need 755 for system-wide access
  chmod -R a+rX "$pkgdir/usr/lib/$pkgname/"
  
  # chrome-sandbox needs setuid for sandboxing to work
  chmod 4755 "$pkgdir/usr/lib/$pkgname/chrome-sandbox" || true
  
  # Install icon
  install -Dm644 "$pkgdir/usr/lib/$pkgname/tweakphp.png" "$pkgdir/usr/share/pixmaps/tweakphp.png"
  
  # Install desktop file
  if [ -f "$pkgdir/usr/lib/$pkgname/tweakphp.desktop" ]; then
    install -Dm644 "$pkgdir/usr/lib/$pkgname/tweakphp.desktop" "$pkgdir/usr/share/applications/tweakphp.desktop"
    # Fix Exec path in desktop file
    sed -i 's|Exec=.*|Exec=tweakphp %U|' "$pkgdir/usr/share/applications/tweakphp.desktop"
  else
    # Create desktop entry if not found
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/tweakphp.desktop" <<EOF
[Desktop Entry]
Name=TweakPHP
Comment=Tweak your PHP code easily
Exec=tweakphp %U
Terminal=false
Type=Application
Icon=tweakphp
Categories=Development;IDE;
MimeType=text/x-php;
EOF
  fi
  
  # Create launcher script that uses AppRun for proper environment setup
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/tweakphp" <<EOF
#!/bin/sh
cd /usr/lib/tweakphp
exec env APPDIR=/usr/lib/tweakphp ./AppRun "\$@"
EOF

  # Install license if available
  if [ -f "$pkgdir/usr/lib/$pkgname/LICENSE"* ]; then
    install -Dm644 "$pkgdir/usr/lib/$pkgname/LICENSE"* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
