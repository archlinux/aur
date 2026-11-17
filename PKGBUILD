# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=fnox
pkgver=1.48.0
pkgrel=1
pkgdesc='Manage secrets with encryption or cloud providers - or both'
arch=('x86_64')
url='https://fnox.jdx.dev'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/fnox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f870de49eb15bba6531f6e7014c1013f703d3cca7ff77d56ebeacc488f6b6c8e')
b2sums=('2569232d4bc3c5344383628d92fb61182954d2d091ab4a0bae9f2b92adf52fa85836d0eea353133bee43372a6ea957924971d8bc37d0349aafe0ecf4b0c84058')
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
