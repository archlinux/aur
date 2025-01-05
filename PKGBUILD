# Maintainer: Mike Bedwell <kennels underscore centavo.0n at icloud dot com
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

__pkgname=swift
_pkgname="tree-sitter-$__pkgname"
pkgname=$_pkgname-git
pkgver=1.r0.g7427230
pkgrel=1
pkgdesc="Swift grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/alex-pinkus/$_pkgname"
license=('MIT')
source=("git+$url.git")
sha256sums=('SKIP')
groups=('tree-sitter-grammars')
depends=('tree-sitter')
makedepends=('git' 'npm' 'tree-sitter-cli')
provides=("$_pkgname")
conflicts=("$_pkgname")


pkgver() {
	cd "$_pkgname"
	echo "1.r$(git describe --all --long | sed 's/-/./g' | cut -d '.' -f 2-)"
}

prepare() {
	cd "$_pkgname"
	tree-sitter init-config &> /dev/null | true
	tree-sitter generate
}

build() {
	cd "$_pkgname"
	tree-sitter build
}

package() {
	cd "$_pkgname"
	install -Dvm 644 "$__pkgname.so" "$pkgdir/usr/lib/lib$_pkgname.so"
	mkdir -p "$pkgdir/usr/lib/tree_sitter"
	echo "linking"
	echo "/usr/lib/lib$_pkgname.so"
	echo "$pkgdir/usr/lib/tree_sitter/$__pkgname.so"
	ln -s "/usr/lib/lib$_pkgname.so" "$pkgdir/usr/lib/tree_sitter/$__pkgname.so"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/doc/$pkgname/"
}
