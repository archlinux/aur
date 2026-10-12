# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=kache
pkgver=1.1.1
pkgrel=1
pkgdesc='Zero-copy, content-addressed build cache for Rust, C/C++ and more'
url='https://kunobi.ninja/docs/kache'
license=('Apache-2.0')
arch=('x86_64')
depends=('libgcc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kunobi-ninja/kache/archive/v$pkgver.tar.gz")
sha256sums=('b9c68bd652114d44440153930bb530930d0f61a3291725625d495108ee956999')
b2sums=('328087cc1f093198e59fdb47fb67c5612454b14067e78ff5c2156de871896d5635a7f5f31c20111639bb4070d76b7463bcf926eaa4ee3dec05e3232acb3de776')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
# Upstream's release profile sets lto = "fat" (OOM-kills the build); `!lto` only covers C flags.
export CARGO_PROFILE_RELEASE_LTO=thin

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
