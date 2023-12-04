# Maintainer: Max1Truc <max1truc @ disroot dot org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_pkgname=magic-wormhole.rs
pkgname=wormhole-rs
pkgver=0.6.1
pkgrel=0
pkgdesc='Rust implementation of Magic Wormhole, with new features and enhancements'
arch=(x86_64)
url="https://github.com/magic-wormhole/$_pkgname"
license=('custom:EUPL-1.2+')
depends=(libxcb)
makedepends=(cargo)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('522db57161bb7df10feb4b0ca8dec912186f24a0974647dc4fccdd8f70649f96')

prepare() {
  cd "$_archive"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_archive"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features

  mkdir -p completions/{bash,zsh,fish}
  "target/release/$pkgname" completion bash > "completions/bash/$pkgname"
  "target/release/$pkgname" completion zsh > "completions/zsh/_$pkgname"
  "target/release/$pkgname" completion fish > "completions/fish/$pkgname.fish"
}

package() {
  cd "$_archive"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE-EUPL-1.2" LICENSE

  install -Dm644 -t "$pkgdir/usr/share/bash-completion/completions/" "completions/bash/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions/" "completions/zsh/_$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" "completions/fish/$pkgname.fish"
}
