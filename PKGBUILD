# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
pkgname=genwallet-git
pkgver=0.6.3.r40.0dd00ad
pkgrel=1
pkgdesc="Ethereum wallet generator with pattern matching"
arch=('x86_64' 'aarch64')
url="https://github.com/kewlfft/genwallet"
license=('GPL3')
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
  export CARGO_INCREMENTAL=0

  # Disable system RUSTFLAGS to allow local optimizations (target-cpu=native) to take precedence
  unset RUSTFLAGS

  # We rely on the project's own .cargo/config.toml and Cargo.toml
  # for all optimization flags (target-cpu, LTO, etc.)
  
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
