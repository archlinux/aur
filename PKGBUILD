# Maintainer: Sami Ben Romdhane <beromdhane@gmail.com>
pkgname=salam
pkgver=0.1.0
pkgrel=4
pkgdesc="Simple logout/shutdown dialog for Linux (Rust version)"
arch=('x86_64')
url="https://codeberg.org/samibr/salam"
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
source=("https://codeberg.org/samibr/salam/archive/v$pkgver.tar.gz"
        "config.toml.example")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "$srcdir"
  # The archive extracts to a directory named after the repo
  EXTRACTED_DIR=$(find . -maxdepth 1 -type d ! -name "." ! -name ".." | head -1 | sed 's/^\.\///')
  echo "Building in: $EXTRACTED_DIR"
  cd "$EXTRACTED_DIR"
  cargo build --release --locked
}

package() {
  cd "$srcdir"
  EXTRACTED_DIR=$(find . -maxdepth 1 -type d ! -name "." ! -name ".." | head -1 | sed 's/^\.\///')
  echo "Packaging from: $EXTRACTED_DIR"
  cd "$EXTRACTED_DIR"
  
  install -Dm755 "target/release/salam" "$pkgdir/usr/bin/salam"
  install -dm755 "$pkgdir/usr/share/salam/img"
  install -m644 img/*.png "$pkgdir/usr/share/salam/img/"
  install -Dm644 "$srcdir/config.toml.example" "$pkgdir/usr/share/doc/salam/config.toml.example"
}
