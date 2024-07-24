# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-python-git
pkgver=0.20.2.r61.g7c8930b
pkgrel=1
pkgdesc="Python grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-python"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('gcc-libs')
makedepends=('git' 'tree-sitter' 'tree-sitter-cli' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	tree-sitter generate
}

build() {
	cd "$pkgname"
    # use Makefile
    make
}

package() {
	cd "$pkgname"
	install -Dvm 644 libtree-sitter-python.so "$pkgdir/usr/lib/libtree-sitter-python.so"
	install -d "$pkgdir/usr/lib/tree_sitter"
	ln -s "/usr/lib/libtree-sitter-python.so" "$pkgdir/usr/lib/tree_sitter/python.so"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
