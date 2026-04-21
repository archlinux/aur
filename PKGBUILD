# Maintainer: Rob Cohen <rob@robcohen.dev>
pkgbase=rustledger
pkgname=(rustledger)
pkgver=0.13.0
pkgrel=1
pkgdesc="Fast, pure Rust implementation of Beancount double-entry accounting"
arch=('x86_64' 'aarch64')
url="https://github.com/rustledger/rustledger"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/rustledger/rustledger/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0e352526d2b33497b9f13df0237fca33a8ec0b6dd72ae4297c330a496efc80a2')

prepare() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
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


# bean-* compatibility wrappers can be installed post-install via:
#   rledger compat install --prefix /usr/bin
