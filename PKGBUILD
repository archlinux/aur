# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=fnox
pkgver=1.15.0
pkgrel=1
pkgdesc='Manage secrets with encryption or cloud providers - or both'
arch=('x86_64')
url='https://fnox.jdx.dev'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/fnox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5addb23a6e41086cf06dfa45b11d5babd9c7951cdd226d49e839f1ee1192c991')
b2sums=('3ee4e33322db7cb896eb0ec03f137a28349dcd16df37ded8ff011424e411d9a37638bf7ad354070c353b68cab17737a92851a05b03b8ab45d52a4809a150aa9f')
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
