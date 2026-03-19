# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=edgee
pkgver=0.1.6
pkgrel=1
epoch=1
pkgdesc='AI gateway with token compression for Claude Code, Codex, and more'
arch=('x86_64')
url='https://www.edgee.ai'
license=('Apache-2.0')
depends=('libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/edgee-ai/edgee/archive/v$pkgver.tar.gz")
sha256sums=('6323c9d067304fc2ffa6a2237806a01fc6fe50c0e25b17e15b4163d15340f17e')
b2sums=('bf9b9f9b0477e16b8a654b4117e3297403ab0a1765bd49482e19d649c1104d6460bbb3233154eed789924fd5867ced4c6b027289db436cb7f418682a8d8b156c')
options=('!lto')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR=target \
  cargo build --frozen --release --package edgee-cli --bin edgee
}

check() {
  cd "$pkgname-$pkgver"

  RUSTFLAGS="$RUSTFLAGS -C debug-assertions" cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/edgee

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}
