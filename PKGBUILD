# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=tree-sitter-git
pkgver=0.19.5.r78.g2b83500b
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

build() {
	cd "$pkgname"
	make
	cd cli
	cargo build --release --locked --all-features
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm 755 target/release/tree-sitter -t "$pkgdir"/usr/bin
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

