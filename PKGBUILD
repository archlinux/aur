# Maintainer: iagolbdc <iagoluancampelo@gmail.com>

pkgname=ytdl-gui
pkgver=1.0.0
pkgrel=1
pkgdesc="Interface gráfica em Flutter para o yt-dlp"
arch=('x86_64')
url="https://github.com/iagolbdc/YTDL-Gui"
license=('MIT')
depends=(
  'yt-dlp'     
  'gtk3'        
  'glib2'
  'xdg-utils'   
  'hicolor-icon-theme'
)
makedepends=(
  'flutter'
  'git'
  'cmake'
  'ninja'
  'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  flutter pub get
  flutter build linux --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Instalar binário principal
  install -Dm755 "build/linux/x64/release/bundle/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"

  # Copiar assets (se necessário)
  install -d "$pkgdir/usr/share/$pkgname/"
  cp -r build/linux/x64/release/bundle/* "$pkgdir/usr/share/$pkgname/"

  # Atalho no menu
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=YTDL-Gui
Comment=Interface gráfica para yt-dlp
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=AudioVideo;Network;
EOF
}
