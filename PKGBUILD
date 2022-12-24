# Maintainer: Andre Schneider <andre.schneider@outlook.at>

pkgname=protonup-qt-bin
_pkgname=ProtonUp-Qt
pkgver=2.7.7
pkgrel=1
pkgdesc="Install and manage Proton-GE for Steam and Wine-GE for Lutris with this graphical user interface."
arch=('x86_64')
url="https://davidotek.github.io/protonup-qt"
license=('GPL3')
provides=(protonup-qt)
conflicts=(protonup-qt)
options=(!strip)
source=(
  "$_pkgname-$pkgver-$CARCH.AppImage::https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v$pkgver/$_pkgname-$pkgver-$CARCH.AppImage"
  "protonup-qt.desktop"
  "protonup-qt"
)
sha256sums=('7838b5dc3612e11b63de8bae851a044f50ad7380fba79d2486a5cd392048beda'
            '3d2e9dbb6eb0fa034db3c1b2384fd23a8b004c90a8f72afbe86baff714433da1'
            '1baaba24e3fae798cde2f1801b9a0c5f92df5c61b0d8ba81c43731abcce44bc2')

prepare() {
  # Exctract icons from AppImage
  echo "Extracting icons from AppImage..."
  chmod 755 "$_pkgname-$pkgver-$CARCH.AppImage"
  ./"$_pkgname-$pkgver-$CARCH.AppImage" --appimage-extract > /dev/null
}

package() {
  cd "$srcdir"
  
  # Install binary and launch script
  install -Dm755 "$_pkgname-$pkgver-$CARCH.AppImage" "$pkgdir/opt/protonup-qt/protonup-qt.AppImage"
  install -Dm755 -t "$pkgdir/usr/bin" "protonup-qt"
  
  # Install icons and desktop file
  cd "squashfs-root/usr/share/icons"
  find "." -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/icons/{}" \;
  cd "$srcdir"
  
  install -Dm644 -t "$pkgdir/usr/share/applications" "protonup-qt.desktop"
}
