# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=pitchfork
pkgver=2.5.0
pkgrel=1
pkgdesc='Daemons with DX'
arch=('x86_64')
url='https://pitchfork.jdx.dev'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/pitchfork/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c03ef52c396a6e2545371e958e7a800b1b15de433f16f7908654ace435ada3a')
b2sums=('298465f68846ed6ded2e7e327f6f0063af447594ea6114a3a74ead1232b91827075c4dc78608cf60cef801d3be69aaa99678a00e3bb1f82bef7aa669dc0706c4')
options=('!lto')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR=target \
    cargo build --frozen --release
}

# TODO: Fix tests
# check() {
#   cd "$pkgname-$pkgver"
#
#   RUSTFLAGS="$RUSTFLAGS -C debug-assertions" \
#     cargo test --frozen
# }

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/pitchfork

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}
