# Maintainer: Ramazan Berk Şirin <ramazanberksirin@protonmail.com>
pkgname=chess-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Chess with variants (Fog of War, Bughouse, 4-player, Crazyhouse, Atomic…), AI, LAN and puzzles — Flutter + Rust"
arch=('x86_64')
url="https://github.com/RamazanBerk20/chess"
license=('MIT')
depends=('gtk3')
provides=('chess')
conflicts=('chess')
options=('!strip' '!debug')
source=("chess-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/chess-$pkgver-linux-x86_64.tar.gz"
        "chess-$pkgver.png::$url/raw/v$pkgver/assets/icon/chess.png"
        "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
sha256sums=('3d2f9baf958106f4ebf36dd0bae751bbb73f83407b4e7448d6497b3658ef2001'
            '9efa459a11c5871c9d7a93ae64ad27554003b1aff89697ef2bb15db49abfb2a2'
            '6eb2f4b140c36afd8d7ea0a4e96e96cfaaaa691e9ad7c291bcc3b64766f178c4')

package() {
  # Flutter bundle (binary + data/ + lib/) lives at the tarball root.
  install -dm755 "$pkgdir/opt/chess"
  cp -dr --no-preserve=ownership "$srcdir/chess" "$srcdir/data" "$srcdir/lib" \
    "$pkgdir/opt/chess/"
  chmod 755 "$pkgdir/opt/chess/chess"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/chess/chess "$pkgdir/usr/bin/chess"

  install -Dm644 "$srcdir/chess-$pkgver.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/chess.png"
  install -Dm644 "$srcdir/LICENSE-$pkgver" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/chess.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Chess
GenericName=Chess
Comment=Chess with variants, AI, LAN and puzzles
Exec=chess
Icon=chess
Terminal=false
Categories=Game;BoardGame;
EOF
}
