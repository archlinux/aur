# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=diffsitter
pkgver=0.8.4
pkgrel=1
pkgdesc="Tree-sitter based AST diff tool"
arch=(x86_64 i686 arm aarch64)
url="https://github.com/afnanenayet/${pkgname}"
license=(MIT)
depends=(tree-sitter)
makedepends=(git cargo)
checkdepends=(tree-sitter-cpp tree-sitter-python tree-sitter-rust)
options=('!lto')
source=(git+${url}.git?signed#tag=v${pkgver})
sha512sums=('8aba61084813d5f4e018925c28f134339c045cb5ce01585824d320b457297fcf95725b95831c3d4911809b6a309934326fd14af71e3468dab17c5b89e4c464ef')
validpgpkeys=('1C519E4FEF5757BFB30C636494EEFE1FD178056B') # Afnan Enayet <afnan@afnan.io>

prepare() {
  cd ${pkgname}
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd ${pkgname}
  cargo build --release --frozen --no-default-features --features dynamic-grammar-libs
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd ${pkgname}
  cargo test --frozen --no-default-features --features dynamic-grammar-libs
}

package() {
  cd ${pkgname}
  install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
