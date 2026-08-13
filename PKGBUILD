# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=kache
pkgver=0.14.1
pkgrel=1
pkgdesc='Zero-copy, content-addressed build cache for Rust, C/C++ and more'
url='https://kunobi.ninja/docs/kache'
license=('Apache-2.0')
arch=('x86_64')
depends=('libgcc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kunobi-ninja/kache/archive/v$pkgver.tar.gz")
sha256sums=('23488dfd10752d2338c2640d27ee4ab536e600269f805dca98e18d8a58450cb7')
b2sums=('4c58bd9af58764a934fe7828660bbd2c3249565e0412499859cb2bd0a1334371e73aeb81c511e603c8343b56663e9e78a72afb1f03fa59a68aebefddd5325e94')

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
