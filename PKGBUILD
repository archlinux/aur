# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=logss
pkgver=0.0.2
pkgrel=1
pkgdesc="A simple cli for logs splitting"
arch=('x86_64')
url="https://github.com/todoesverso/logss"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-cargo-lock.patch::$url/commit/89041988a040350d215e1976f1b1cccc990b2e32.patch")
sha512sums=('1678687a5d9ba88b74c12baafa8b33076c3ad2b23894fbcf08fb00b3620cae8e0b1b96f5f153b3e5c1ee46552046b2dad80a024fc494ce89166626eb65c6bf47'
            'f24aed56c8fb4ebc81e5def858e18502d077ce0f9d90630300379d181c27102a0b757dfb6e5c4e025dc8c5d09890551022a649c701eb82e026a3fc2b36b89acc')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "../$pkgname-$pkgver-cargo-lock.patch"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
