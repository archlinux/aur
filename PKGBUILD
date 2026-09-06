# Maintainer: Ángel Guzmán Maeso <angel@guzmanmaeso.com>
pkgname=whatly-bin
pkgver=7.3.1
pkgrel=1
pkgdesc="Feature-rich WhatsApp Web desktop client based on Qt WebEngine (prebuilt)"
arch=('x86_64')
url="https://github.com/shakaran/whatly"
license=('MIT')
# The release AppImage bundles its own Qt, so there is little to depend on; the
# few bits AppImages expect from the host are listed for a clean launch.
depends=('fuse2' 'hicolor-icon-theme' 'noto-fonts')
provides=('whatly')
conflicts=('whatly' 'whatly-git')
options=('!strip')
source=("Whatly-$pkgver-x86_64.AppImage::https://github.com/shakaran/whatly/releases/download/v$pkgver/Whatly-$pkgver-x86_64.AppImage")
sha256sums=('29ef0ee6f7072becde8958df8ea9f88ce20e2e876bf506a441dd4c0ccd1bb3e7')

package() {
  cd "$srcdir"
  chmod +x "Whatly-$pkgver-x86_64.AppImage"
  ./"Whatly-$pkgver-x86_64.AppImage" --appimage-extract >/dev/null

  # Ship the self-contained tree under /opt and expose it on PATH via AppRun,
  # which sets up the bundled library and resource paths.
  install -d "$pkgdir/opt/whatly"
  cp -a squashfs-root/. "$pkgdir/opt/whatly/"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/whatly/AppRun "$pkgdir/usr/bin/whatly"

  # Desktop entry (point Exec at the wrapper) and icon for integration.
  install -Dm644 squashfs-root/net.shakaran.whatly.desktop \
    "$pkgdir/usr/share/applications/net.shakaran.whatly.desktop"
  sed -i 's|^Exec=.*|Exec=whatly %U|' \
    "$pkgdir/usr/share/applications/net.shakaran.whatly.desktop"

  local icon="squashfs-root/usr/share/icons/hicolor/scalable/apps/net.shakaran.whatly.svg"
  if [ -f "$icon" ]; then
    install -Dm644 "$icon" \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/net.shakaran.whatly.svg"
  fi

  install -Dm644 squashfs-root/usr/share/whatly/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
