# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
pkgname=genwallet-git
pkgver=0.1.0.r3.e371efb
pkgrel=1
pkgdesc="Ethereum wallet generator with pattern matching"
arch=('x86_64' 'aarch64')
url="https://github.com/kewlfft/genwallet"
license=('GPL3')
makedepends=('rust' 'cargo' 'libsecp256k1' 'pkg-config')
source=("$pkgname::git+https://github.com/kewlfft/genwallet.git")
sha256sums=('SKIP')

pkgver() {
  printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  
  # Set environment variables for secp256k1-sys to use system library
  export SECP256K1_SYS_USE_PKG_CONFIG=1
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig"
  export RUSTFLAGS="-C link-arg=-lsecp256k1"
  export SECP256K1_SYS_STATIC=0
  export SECP256K1_SYS_USE_SYSTEM=1
  export LIBRARY_PATH="/usr/lib"
  export LD_LIBRARY_PATH="/usr/lib"
  
  # Build with release optimizations
  cargo build --release
  
  # Strip binary for smaller size
  strip target/release/genwallet
}

package() {
  cd "$pkgname"
  
  # Install binary
  install -Dm755 target/release/genwallet "$pkgdir/usr/bin/genwallet"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Create output directory
  install -dm755 "$pkgdir/var/lib/genwallet"
}
