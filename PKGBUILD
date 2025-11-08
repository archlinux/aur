# Maintainer: Totchi Lagawi <chatnoir420 at gmx dot com>
# Previous maintainer: xYc4t <xYc4t at proton dot me>

pkgname=harmonymusic
pkgver=1.12.1
pkgrel=1
pkgdesc='A cross platform App for streaming Music'
arch=('x86_64')
url='https://github.com/anandnet/Harmony-Music'
license=('GPL-3.0-or-later')
depends=('mpv' 'xdg-user-dirs')
makedepends=('rsync')
conflicts=('harmony-music-git')
options=(!strip !debug)

_appimage_suffix='+26'

source=("harmonymusic-$pkgver$_appimage_suffix-linux.AppImage::$url/releases/download/v$pkgver/harmonymusic-$pkgver$_appimage_suffix-linux.AppImage")
sha256sums=('e54391e4bbc52c178628fbbdb9df5b66e6f97332f8c2e0e66f11bfdb97b726a9')

prepare() {
  chmod +x "harmonymusic-$pkgver$_appimage_suffix-linux.AppImage"
    "./harmonymusic-$pkgver$_appimage_suffix-linux.AppImage" --appimage-extract

  sed -i "s|\"\$(dirname \"\$0\")\"|/opt/$pkgname \|\| exit 1|" "$srcdir/squashfs-root/AppRun"
  sed -i 's/LD_LIBRARY_PATH=usr\/lib //g' "$srcdir/squashfs-root/harmonymusic.desktop"
}

package() {
  cd "$srcdir/squashfs-root"
  install -dm755 "$pkgdir/opt/$pkgname"
  install -Dm755 AppRun "$pkgdir/usr/bin/harmonymusic"
  rsync -r --relative data harmonymusic lib usr/lib "$pkgdir/opt/$pkgname"

  install -Dm644 harmonymusic.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 usr/share/icons/hicolor/128x128/apps/harmonymusic.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 usr/share/icons/hicolor/256x256/apps/harmonymusic.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
