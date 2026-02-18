# Maintainer: Rob Cohen <rob@robcohen.dev>
pkgbase=rustledger
pkgname=(rustledger rustledger-bean-compat)
pkgver=0.9.0
pkgrel=1
pkgdesc="Fast, pure Rust implementation of Beancount double-entry accounting"
arch=('x86_64' 'aarch64')
url="https://github.com/rustledger/rustledger"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/rustledger/rustledger/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c55eb9f5295451b80b4904200922e1aab1cf4814561ab23f10be10dca0056e72')

prepare() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Required for ring crate to build with LTO enabled
  CFLAGS+=' -ffat-lto-objects'
  cargo build --release --frozen --workspace
}

check() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export PATH="$PWD/target/release:$PATH"
  cargo test --release --frozen --workspace
}

package_rustledger() {
  pkgdesc="Fast, pure Rust implementation of Beancount double-entry accounting"

  cd "$pkgbase-$pkgver"

  # Install main binaries
  install -Dm755 "target/release/rledger" "$pkgdir/usr/bin/rledger"
  install -Dm755 "target/release/rledger-lsp" "$pkgdir/usr/bin/rledger-lsp"

  # Install shell completions
  install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/rledger" < <(target/release/rledger completions bash)
  install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_rledger" < <(target/release/rledger completions zsh)
  install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/rledger.fish" < <(target/release/rledger completions fish)

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_rustledger-bean-compat() {
  pkgdesc="Beancount-compatible bean-* commands for rustledger (drop-in replacement)"
  depends=('rustledger')
  conflicts=('beancount')
  provides=('beancount')

  cd "$pkgbase-$pkgver"

  # Install beancount compatibility binaries
  for bin in bean-check bean-format bean-query bean-report bean-doctor bean-extract bean-price; do
    if [[ -f "target/release/$bin" ]]; then
      install -Dm755 "target/release/$bin" "$pkgdir/usr/bin/$bin"
    fi
  done

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
