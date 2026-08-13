# Maintainer: ParticleG <particle_g@outlook.com>

pkgname=relink-logs-appimage
pkgver=1.12.13
pkgrel=1
pkgdesc='Overlay DPS parser and meter for Granblue Fantasy: Relink (AppImage)'
arch=('x86_64')
url='https://github.com/villith/relink-logs'
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme')
provides=('relink-logs' 'gbfr-logs')
conflicts=('relink-logs' 'gbfr-logs')
options=('!strip' '!debug')

_tag="$pkgver"
_appimage="gbfr-logs_${pkgver}_amd64.AppImage"
source=(
  "$pkgname-$pkgver.AppImage::https://github.com/villith/relink-logs/releases/download/$_tag/$_appimage"
  "$pkgname-$pkgver.LICENSE::https://raw.githubusercontent.com/villith/relink-logs/$_tag/LICENSE"
)
noextract=("$pkgname-$pkgver.AppImage")
sha256sums=(
  '77cfd0a59ceb34db1795711b1669cb7de02bd95a1505d0f46d8677d824c5e518'
  '810d9b66e3e6018cabcf3502aed71981222a33e0a4233499ebc537df316e09ad'
)

prepare() {
  chmod +x "$srcdir/$pkgname-$pkgver.AppImage"
  rm -rf "$srcdir/squashfs-root"
  cd "$srcdir"
  "./$pkgname-$pkgver.AppImage" --appimage-extract >/dev/null
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver.AppImage" \
    "$pkgdir/opt/$pkgname/gbfr-logs.AppImage"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/gbfr-logs.AppImage" \
    "$pkgdir/usr/bin/gbfr-logs"

  install -Dm644 "$srcdir/squashfs-root/gbfr-logs.desktop" \
    "$pkgdir/usr/share/applications/gbfr-logs.desktop"
  sed -i \
    -e 's/^Categories=.*/Categories=Game;/' \
    -e 's/^Comment=.*/Comment=Overlay DPS parser and meter for Granblue Fantasy: Relink/' \
    "$pkgdir/usr/share/applications/gbfr-logs.desktop"

  for size in 32x32 128x128; do
    install -Dm644 \
      "$srcdir/squashfs-root/usr/share/icons/hicolor/$size/apps/gbfr-logs.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/gbfr-logs.png"
  done
  install -Dm644 \
    "$srcdir/squashfs-root/usr/share/icons/hicolor/256x256@2/apps/gbfr-logs.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/gbfr-logs.png"

  install -Dm644 "$srcdir/$pkgname-$pkgver.LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
