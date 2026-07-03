pkgname=xero-music
pkgver=1.1.2
pkgrel=1
pkgdesc='TUI music player written in Rust with album art and synced lyrics'
arch=('x86_64')
url='https://codeberg.org/Xero-music/Xero'
license=('GPL-3.0-or-later')
options=(!lto)
depends=('ffmpeg' 'mpv' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
  'libsixel: sixel album-art rendering via img2sixel'
  'kitty: kitty icat integration for album-art rendering'
)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/Xero-music/Xero/archive/v$pkgver.tar.gz")
sha256sums=('0ca515bf53aedde2a16e8afe152f669e84f61cde14f9d6f30430c5b4a6fb287b')

build() {
  cd "$srcdir/xero"
  export CARGO_TARGET_DIR="$srcdir/target-$pkgver-$pkgrel"
  cargo build --release --locked
}

package() {
  cd "$srcdir/xero"

  export CARGO_TARGET_DIR="$srcdir/target-$pkgver-$pkgrel"

  install -Dm755 "$CARGO_TARGET_DIR/release/xero-music" "$pkgdir/usr/bin/xero-music"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 examples/xero.example.toml \
    "$pkgdir/usr/share/doc/$pkgname/xero.example.toml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
