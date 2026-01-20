# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=pitchfork
pkgver=1.1.0
pkgrel=1
pkgdesc='Daemons with DX'
arch=('x86_64')
url='https://pitchfork.jdx.dev'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/pitchfork/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9ea38ffa9f3eed7a41f333c65b978fff8511197578018864d7fa061a67f81cad')
b2sums=('1b61d8dcb73d3f7eab507291fcc171e52e809c3e58c7ebdb795896676b6fc411ba788f41e5523f61f931d1e645898c22fbaa4d90af9f0cfbe80bd24366e2f18b')
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
