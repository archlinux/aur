# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
pkgname=genwallet-git
pkgver=0.5.1.r29.541d38a
pkgrel=1
pkgdesc="Ethereum wallet generator with pattern matching"
arch=('x86_64' 'aarch64')
url="https://github.com/kewlfft/genwallet"
license=('GPL3')
options=(!lto)
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+https://github.com/kewlfft/genwallet.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local version=$(grep '^version = ' Cargo.toml | cut -d'"' -f2)
  printf "%s.r%s.%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  
  # Optimize build environment for maximum performance
  # CARGO_INCREMENTAL=0 ensures reproducible builds and can help with optimization
  export CARGO_INCREMENTAL=0
  
  # Clean build for reproducible, optimized binary
  cargo clean
  
  # Build with release optimizations
  # Note: LTO is disabled via options=(!lto) due to linker issues with secp256k1-sys
  # Other optimizations (opt-level=3, target-cpu=native, etc.) are in .cargo/config.toml
  # secp256k1-sys will use vendored build by default (faster and more reliable)
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
