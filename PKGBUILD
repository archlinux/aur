# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=kache
pkgver=0.10.0
pkgrel=1
pkgdesc='Zero-copy, content-addressed build cache for Rust, C/C++ and more'
url='https://kunobi.ninja/docs/kache'
license=('Apache-2.0')
arch=('x86_64')
depends=('libgcc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kunobi-ninja/kache/archive/v$pkgver.tar.gz")
sha256sums=('8e6635f438486a64b64117faa19ed3acc8ee1c575739bf972b0cb0cbe6407df4')
b2sums=('b0d37fb240c74c04933f45f9d1bbde1637d1ede81f28d8862e41a4ff99cb05fc8cf176c046962824ce6e7478843ebad449bcf99a4a6bc5e7d23add3095319539')

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
