# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=pitchfork
pkgver=2.12.1
pkgrel=1
pkgdesc='Daemons with DX'
arch=('x86_64')
url='https://pitchfork.jdx.dev'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/pitchfork/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c903458db95d208ad8852b938a272eb9fde005223c5e3867ea10fe9daa2e424')
b2sums=('c21c2c07bc1487213a4c364ad905fc770c489919dc59a40e97751d115f8e8b1072e3085b0fed573d780412ddc9df0f8000bd937e0ae3cb0b8a7542bac07a389f')
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
