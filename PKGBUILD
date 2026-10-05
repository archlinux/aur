# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=kache
pkgver=1.0.0
pkgrel=1
pkgdesc='Zero-copy, content-addressed build cache for Rust, C/C++ and more'
url='https://kunobi.ninja/docs/kache'
license=('Apache-2.0')
arch=('x86_64')
depends=('libgcc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kunobi-ninja/kache/archive/v$pkgver.tar.gz")
sha256sums=('15eb7fc402b7d83a9587f7f273008a621ad9d68b9663a27da50f921ad1e16de8')
b2sums=('d30ff858d8adcb17d423c0b3aacdd9267cbafeb81871ecc4d4bc50694ea1a6375750acf69bba41533783cdcefe3ce3848e554695677486784cb0f8329fe53ffc')

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
