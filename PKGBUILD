# Maintainer: nikren <superdug000@gmail.com>
pkgname=anilinux-electron
pkgver=1.0.0
pkgrel=4
pkgdesc="Anime viewer for Linux with Shikimori OAuth integration"
arch=('x86_64')
url="https://github.com/Nikren2006/anilinux-electron"
license=('MIT')
depends=('mpv')
source=("$pkgname-$pkgver.AppImage::https://github.com/Nikren2006/anilinux-electron/releases/download/v$pkgver/Anilinux-electron-$pkgver.AppImage")
sha256sums=('8f4199e099be803d65bca2de1a1ba7d7a8531b1b1b373a2f53c246822a851e64')

prepare() {
  chmod +x "$pkgname-$pkgver.AppImage"
  ./"$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
  install -d "$pkgdir/opt/$pkgname"
  cp -r squashfs-root/* "$pkgdir/opt/$pkgname/"
  
  # Fix AppRun to use correct path
  sed -i 's|$(dirname "$(readlink -f "\$0")")|/opt/'$pkgname'|g' "$pkgdir/opt/$pkgname/AppRun"
  
  # Install desktop entry
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Anilinux
Comment=Anime viewer for Linux
Exec=/opt/$pkgname/AppRun
Icon=$pkgname
Type=Application
Categories=Video;Player;
EOF
  
  # Install icon
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -m644 squashfs-root/anilinux.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png" 2>/dev/null || true
  
  # Install symlink to binary
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/AppRun" "$pkgdir/usr/bin/$pkgname"
}
