# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=fnox
pkgver=1.12.0
pkgrel=1
pkgdesc='Manage secrets with encryption or cloud providers - or both'
arch=('x86_64')
url='https://fnox.jdx.dev'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/fnox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c688da328088f9811c947e1cb1b85b261efc39c384af10f33cb12a1231f297e4')
b2sums=('83ef2f06f62a8825f95eeecaf7fb5036f2d7eb92a8c13a48d5f6762db0c5ff0edba6411b239a9b61db54a9bcd0ccaab90325cb0f65c5fa4ee7109107311f25f4')
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
