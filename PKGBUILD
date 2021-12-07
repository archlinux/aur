# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=diffsitter
pkgver=0.6.8
_commit=dbe30c3
pkgrel=1
pkgdesc="Tree-sitter based AST diff tool"
arch=('x86_64' 'i686' 'arm' 'aarch64')
url="https://github.com/afnanenayet/diffsitter"
license=('MIT')
depends=('tree-sitter')
makedepends=('git' 'cargo')
checkdepends=('tree-sitter-python' 'tree-sitter-rust')
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('1C519E4FEF5757BFB30C636494EEFE1FD178056B') ## Afnan Enayet

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --no-default-features --features dynamic-grammar-libs
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo test --frozen --no-default-features --features dynamic-grammar-libs
}

package() {
	cd "$pkgname"
	install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
