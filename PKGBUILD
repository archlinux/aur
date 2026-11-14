# Maintainer: Ramazan Berk Şirin <ramazanberksirin@protonmail.com>
pkgname=open-chess-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Open Chess with variants, AI, LAN multiplayer and puzzles (Flutter + Rust)"
arch=('x86_64')
url="https://github.com/RamazanBerk20/open-chess"
license=('MIT')
depends=('gtk3')
provides=('open-chess' 'chess')
conflicts=('open-chess' 'open-chess-git' 'chess' 'chess-bin' 'chess-git')
replaces=('chess-bin')
options=('!strip' '!debug')
source=("open-chess-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/open-chess-$pkgver-linux-x86_64.tar.gz"
        "open-chess-$pkgver.png::$url/raw/v$pkgver/assets/icon/open-chess.png"
        "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
sha256sums=('415d2c1700c140e07582027296d26fca5c260a8308b9411f1e427b1913d70188'
            '9efa459a11c5871c9d7a93ae64ad27554003b1aff89697ef2bb15db49abfb2a2'
            '6eb2f4b140c36afd8d7ea0a4e96e96cfaaaa691e9ad7c291bcc3b64766f178c4')

package() {
  # Flutter bundle (binary + data/ + lib/) lives at the tarball root.
  install -dm755 "$pkgdir/opt/open-chess"
  cp -dr --no-preserve=ownership "$srcdir/open-chess" "$srcdir/data" "$srcdir/lib" \
    "$pkgdir/opt/open-chess/"
  chmod 755 "$pkgdir/opt/open-chess/open-chess"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/open-chess/open-chess "$pkgdir/usr/bin/open-chess"

  install -Dm644 "$srcdir/open-chess-$pkgver.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/open-chess.png"
  install -Dm644 "$srcdir/LICENSE-$pkgver" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/com.ramazan.openchess.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Open Chess
GenericName=Open Chess
Comment=Open Chess with variants, AI, LAN and puzzles
Exec=open-chess
Icon=open-chess
Terminal=false
Categories=Game;BoardGame;
StartupWMClass=com.ramazan.openchess
EOF
}
