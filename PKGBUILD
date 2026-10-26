# SPDX-License-Identifier: 0BSD
# Maintainer: Samuel Bernard <samuel.bernard@gmail.com>

pkgname=funes
pkgver=1.9.1
pkgrel=1
pkgdesc='Durable, searchable memory of your past AI agent sessions'
arch=('x86_64' 'aarch64')
url='https://github.com/huggingface/funes'
license=('Apache-2.0')
depends=('ca-certificates' 'glibc' 'libgcc' 'tar' 'trufflehog')
makedepends=('cargo' 'cmake' 'protobuf')
checkdepends=('git')
optdepends=('git: associate sessions with their Git repositories')
# Cargo controls LTO; avoid makepkg injecting incompatible cross-language flags.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'system-package.patch')
sha256sums=('c5f5ba5487b5b2f9d8145d4dfbcc2cb955bfbc564075e1d69978b0bf5cbe2207'
            'ac2c6ed0df8abf27b32078b78f0819d3518f66224ccdc390f1cf80ed96e6eec8')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/system-package.patch"

  # Upstream stamps the release version in CI; set it for source builds too.
  # Update only this package's version, preserving every locked dependency.
  sed -i "/^\[package\]$/,/^\[/s/^version = .*/version = \"$pkgver\"/" Cargo.toml
  sed -i "/^name = \"funes\"$/{n;s/^version = .*/version = \"$pkgver\"/;}" Cargo.lock

  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export FUNES_SYSTEM_PACKAGE=1

  # The Linux inference backend is built from Rust sources (no ONNX runtime download).
  cargo build --release --frozen --no-default-features --features blas
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export FUNES_SYSTEM_PACKAGE=1
  export FUNES_NO_TELEMETRY=1

  # The full integration suite downloads models and accesses the Hugging Face Hub.
  cargo test --release --frozen --no-default-features --features blas \
    --lib --test no_index --test ask_no_agent --test update_waits_for_older_writers
  test "$(target/release/funes --version)" = "funes $pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/funes "$pkgdir/usr/bin/funes"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r docs "$pkgdir/usr/share/doc/$pkgname/"
}
