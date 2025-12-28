pkgname=hulios-git
pkgver=1.0 # Static version for .SRCINFO generation
pkgrel=1
pkgdesc="HULIOS - Rust-based transparent Tor proxy for Linux with full system traffic routing, DNS leak protection, and enhanced privacy"
arch=('x86_64')
url="https://github.com/ghaziwali/Hulios"
license=('GPL')
depends=()
makedepends=('git' 'rust' 'cargo') # Add rust/cargo for building
source=("git+https://github.com/ghaziwali/Hulios.git")
sha256sums=('SKIP') # Git sources cannot be checksummed

# Helper function to ensure the Git source exists for pkgver()
_git() {
  cd "$srcdir"
  # Only clone if it doesn't exist
  [ ! -d Hulios ] && git clone https://github.com/ghaziwali/Hulios.git Hulios
}

# Determine package version from Git tags
pkgver() {
  _git
  cd "$srcdir/Hulios"
  git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/Hulios"
  cargo build --release
}

package() {
  cd "$srcdir/Hulios"
  install -Dm755 target/release/hulios "$pkgdir/usr/bin/hulios"
}
