# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
pkgname=genwallet-git
pkgver=0.4.1.r20.5a043be
pkgrel=1
pkgdesc="Ethereum wallet generator with pattern matching"
arch=('x86_64' 'aarch64')
url="https://github.com/kewlfft/genwallet"
license=('GPL3')
makedepends=('rust' 'cargo' 'libsecp256k1' 'pkg-config')
source=("$pkgname::git+https://github.com/kewlfft/genwallet.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local version=$(grep '^version = ' Cargo.toml | cut -d'"' -f2)
  printf "%s.r%s.%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  
  # Set environment variables for secp256k1-sys to use system library
  export SECP256K1_SYS_USE_PKG_CONFIG=1
  export SECP256K1_SYS_USE_VENDORED=0
  
  # Set explicit linker flags (preserves existing RUSTFLAGS)
  export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-lsecp256k1"
  
  # Optimize build environment
  export CARGO_INCREMENTAL=0
  
  # Build with release optimizations (profile settings from .cargo/config.toml)
  cargo build --release
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
