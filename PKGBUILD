# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=kache
pkgver=0.28.1
pkgrel=1
pkgdesc='Zero-copy, content-addressed build cache for Rust, C/C++ and more'
url='https://kunobi.ninja/docs/kache'
license=('Apache-2.0')
arch=('x86_64')
depends=('libgcc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kunobi-ninja/kache/archive/v$pkgver.tar.gz")
sha256sums=('c295e6aed7f4f8b16b8c6b3b84a914b42c4f0a2af8dc18652da85ae97b84aac1')
b2sums=('f3313f7139e08ccbf67897c67201d4f90da82d3d7f271ccbf547499e823672f059b8f4dc69841b4a0fbbf462abbbc25ea46f993e81aca27b68025e130fffa634')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR=target \
    cargo build --frozen --release -p kache
}

check() {
  cd "$pkgname-$pkgver"

  # kache's own integration tests rebuild the `kache` binary internally
  # (to exercise it as an rustc/cc wrapper) and spawn a short-lived local
  # daemon over a Unix socket — no network access is needed, but the
  # nested `cargo build` isn't run with --frozen, so force offline mode
  # to make sure it only ever uses the registry cache from prepare().
  CARGO_TARGET_DIR=target CARGO_NET_OFFLINE=true \
    cargo test --release --frozen -p kache
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/kache

  local shell
  for shell in bash zsh fish elvish; do
    ./target/release/kache completions "$shell" > "kache.$shell"
  done

  install -Dm0644 kache.bash "$pkgdir/usr/share/bash-completion/completions/kache"
  install -Dm0644 kache.zsh "$pkgdir/usr/share/zsh/site-functions/_kache"
  install -Dm0644 kache.fish "$pkgdir/usr/share/fish/vendor_completions.d/kache.fish"
  install -Dm0644 kache.elvish "$pkgdir/usr/share/elvish/lib/kache.elv"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
