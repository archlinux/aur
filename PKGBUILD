# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=pitchfork
pkgver=1.2.0
pkgrel=1
pkgdesc='Daemons with DX'
arch=('x86_64')
url='https://pitchfork.jdx.dev'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/pitchfork/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06ad6b7e0cd16284a1aa95bd3cc8f3833ecab7fdea6327ed0890539b605fe17d')
b2sums=('84bea4ca1c6a38561884697a62ce6f0a52dbbd2853793c7a95c52f1083b72ebe19af89e562265e954957ad1044aef266faf8a25bcccc6644ea468a65789b0765')
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
