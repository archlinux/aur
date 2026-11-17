# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=edgee
pkgver=0.18.0
pkgrel=1
epoch=1
pkgdesc='AI gateway with token compression for Claude Code, Codex, and more'
arch=('x86_64')
url='https://www.edgee.ai'
license=('Apache-2.0')
depends=('libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/edgee-ai/edgee/archive/v$pkgver.tar.gz")
sha256sums=('753c6c3ca6449e6380836545526578b4c73792c0365c376a253ff91e52d3271a')
b2sums=('4f72ad94cc3d12bf73ae72106a5dde19473b5349ab0750f0b123bcf468f37ffb63c3ef9d047613e249c25599b55b7e332f2d9fa325845a89bb6ccf378aff5aa3')
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
