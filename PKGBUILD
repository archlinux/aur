# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=diffsitter-git
pkgver=0.6.8.r0.gdbe30c3
pkgrel=1
pkgdesc="A tree-sitter based AST difftool to get meaningful semantic diffs"
arch=('x86_64' 'i686' 'arm' 'aarch64')
url="https://github.com/afnanenayet/diffsitter"
license=('MIT')
depends=('tree-sitter')
makedepends=('cargo' 'git')
checkdepends=('tree-sitter-python' 'tree-sitter-rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

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
	install -D target/release/diffsitter -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
