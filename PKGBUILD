# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=edgee
pkgver=0.2.11
pkgrel=1
epoch=1
pkgdesc='AI gateway with token compression for Claude Code, Codex, and more'
arch=('x86_64')
url='https://www.edgee.ai'
license=('Apache-2.0')
depends=('libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/edgee-ai/edgee/archive/v$pkgver.tar.gz")
sha256sums=('5c2760127cd7cc83011dcc8567bdeb8f88c23e699197b8c7bff8307650ce4fc5')
b2sums=('0c37804f5ed7783142e5ebe6f45a232a4b9cc06274aad0bbd5df08b2867c6778f629a867a5a1af28c791444cb8c7f7f0afc02b485b3a091a3e3d2837b1f94640')
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
