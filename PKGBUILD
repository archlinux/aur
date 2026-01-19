# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=fnox
pkgver=1.9.2
pkgrel=1
pkgdesc='Manage secrets with encryption or cloud providers - or both'
arch=('x86_64')
url='https://fnox.jdx.dev'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/fnox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('60e69aad2f0501c7702564a3c91ef91038d9a174bb4acb7047dcd0025792bb0c')
b2sums=('b5c7e1f0246565bfa91d04585600297b616308798520c030ca0b1c4f74be969c837e51d8b001fe8b1175c76585d9032dcc345755d51c88c34c62f69ed36f0647')
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
