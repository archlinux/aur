pkgname=xero-music
pkgver=1.0.10
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
sha256sums=('0b231bee3f1de49890b5c2bfe3326ff0500a6bd4275544f142d1ca36b1965c4f')

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
