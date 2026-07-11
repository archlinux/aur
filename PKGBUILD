# Maintainer: Sami Ben Romdhane <beromdhane@gmail.com>
pkgname=salam
pkgver=0.1.0
pkgrel=20
pkgdesc="Simple logout/shutdown dialog for Linux (Rust version)"
arch=('x86_64')
url="https://codeberg.org/samibr/salam"
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
source=("https://codeberg.org/samibr/salam/archive/f9d06519dda3ff8a2b3d9efb08e21df4a0000999.tar.gz"
        "config.toml.example")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "$srcdir"
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
  install -Dm644 "$srcdir/config.toml.example" "$pkgdir/usr/share/doc/salam/config.toml.example"
}

post_install() {
  echo ""
  echo "========================================="
  echo " Salam installed successfully!"
  echo "========================================="
  echo ""
  echo "📝 Configuration:"
  echo "  Example config: /usr/share/doc/salam/config.toml.example"
  echo "  Copy to: ~/.config/salam/config.toml"
  echo ""
  echo "  mkdir -p ~/.config/salam"
  echo "  cp /usr/share/doc/salam/config.toml.example ~/.config/salam/config.toml"
  echo ""
  echo "🚀 Run: salam"
  echo "========================================="
}

post_upgrade() {
  post_install
}
