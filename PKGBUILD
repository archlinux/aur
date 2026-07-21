# Maintainer: psychosomat <hello@ddark.dev>

pkgname=openscreen-appimage
pkgver=1.7.0
pkgrel=2
pkgdesc="Create stunning demos for free. Open-source, no subscriptions, no watermarks, and free for commercial use. An alternative to Screen Studio."
arch=('x86_64')
url="https://github.com/getopenscreen/openscreen"
license=('MIT')
depends=('fuse')
conflicts=('openscreen' 'openscreen-bin')
options=(!debug !strip)
source=(
  "Openscreen-Linux-${pkgver}.AppImage::https://github.com/getopenscreen/openscreen/releases/download/v${pkgver}/Openscreen-Linux-${pkgver}.AppImage"
  "LICENSE::https://github.com/getopenscreen/openscreen/raw/v${pkgver}/LICENSE"
  "openscreen.desktop"
  "openscreen"
)
sha256sums=('9c16c3dc5f8a3691d01dcb23f6b1db473454efcdf0142561f249ba0fa5bdab0c' 'd8824b8c038eba113227cc707ac22c7a497583ae6115b052729a1d104f692d82' 'SKIP' 'SKIP')

prepare() {
  chmod +x "$srcdir/Openscreen-Linux-$pkgver.AppImage"

  echo "==> Extracting AppImage..."
  (
    cd "$srcdir"
    "$srcdir/Openscreen-Linux-$pkgver.AppImage" --appimage-extract >/dev/null
  )
}

package() {
  install -Dm755 "$srcdir/openscreen" "$pkgdir/usr/bin/openscreen"
  install -Dm755 "$srcdir/Openscreen-Linux-$pkgver.AppImage" "$pkgdir/opt/openscreen/Openscreen.AppImage"
  install -Dm755 "$srcdir/openscreen.desktop" "$pkgdir/usr/share/applications/openscreen.desktop"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/openscreen/LICENSE"

  icon_types="16 24 32 48 64 128 256 512 1024"
  for num in $icon_types; do
    install -Dm644 \
      "$srcdir/squashfs-root/usr/share/icons/hicolor/${num}x${num}/apps/openscreen.png" \
      "$pkgdir/usr/share/icons/hicolor/${num}x${num}/apps/openscreen.png"
  done
}
