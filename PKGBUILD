# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=tree-sitter-git
pkgver=0.20.0.r129.g67de9435
pkgrel=1
pkgdesc='An incremental parsing system for programming tools'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter'
license=('MIT')
provides=('tree-sitter' 'libtree-sitter.so')
conflicts=('tree-sitter')
makedepends=('git' 'cargo')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname/cli"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	make
	cd cli
	RUSTUP_TOOLCHAIN=stable
	CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -D target/release/tree-sitter -t "$pkgdir"/usr/bin
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
