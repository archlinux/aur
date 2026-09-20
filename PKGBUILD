# Maintainer: James LeBaron <jimmleb178@gmail.com>

pkgname=bb-bin
pkgver=0.43.3
pkgrel=1
pkgdesc="Agentic IDE that builds itself"
arch=('x86_64')
url='https://github.com/get-bb/bb'
license=('MIT')
provides=('bb')
conflicts=('bb')
options=(!strip !debug)
source=(
  "$pkgname-$pkgver.AppImage::https://github.com/get-bb/bb/releases/download/desktop-v$pkgver/bb-$pkgver-x86_64.AppImage"
  'bb-launcher.sh'
  'LICENSE'
)
noextract=("$pkgname-$pkgver.AppImage")
sha256sums=('4059d57a30484e1837679e5ccd577b1b4bf9dc4e0b54fdce4d60563eb7dffc5e'
            '97cff1674b48743008e9f7e1159174a5cb33a955ca9a545265ccf4a824787d32'
            'd10816aa30183af920bdd789a81b16847bcf3e287e1b3419dd7d85f6e3e8e7b0')

prepare() {
  chmod +x "$srcdir/$pkgname-$pkgver.AppImage"
  "$srcdir/$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
  install -dm755 "$pkgdir/opt/bb"
  cp -a --no-preserve=ownership "$srcdir/squashfs-root/." "$pkgdir/opt/bb/"
  install -Dm755 "$srcdir/bb-launcher.sh" "$pkgdir/usr/bin/bb"

  install -Dm644 "$srcdir/squashfs-root/bb.desktop" \
    "$pkgdir/usr/share/applications/bb.desktop"
  sed -i 's|^Exec=AppRun|Exec=bb|' "$pkgdir/usr/share/applications/bb.desktop"
  install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/bb.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/bb.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
