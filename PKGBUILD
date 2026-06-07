# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=fnox
pkgver=1.25.1
pkgrel=1
pkgdesc='Manage secrets with encryption or cloud providers - or both'
arch=('x86_64')
url='https://fnox.jdx.dev'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/fnox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b182ac724872ddfe268ab4ebf57b3f830d3468c03fcf2fb6afab5dd1c609b277')
b2sums=('c03caf24014f50bda65aae770f1eda85a6388c186b3dcbd34b193c0105271d8795d466e42c1b403bd2e75488ab92a8e60faac2950495bf84c94c1ebad833e932')
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

check() {
  cd "$pkgname-$pkgver"

  RUSTFLAGS="$RUSTFLAGS -C debug-assertions" \
    cargo test --frozen -- \
    --skip=providers::keychain::tests::test_keychain_set_and_get
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/fnox

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}
