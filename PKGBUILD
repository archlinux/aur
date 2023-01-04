# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=kondo
pkgname=("$_pkgname-git" "$_pkgname-ui-git")
pkgbase="$_pkgname-git"
pkgver=latest
pkgrel=1
epoch=
pkgdesc='Save disk space by cleaning non-essential files from software projects.'
arch=(x86_64)
url="https://github.com/tbillington/$_pkgname"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git' 'gtk3')
source=("$_pkgname::git+https://github.com/tbillington/$_pkgname.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	cargo fetch --target "$CARCH-unknown-linux-gnu"

	cd "$_pkgname-ui"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g'
}

build() {
	cd "$srcdir/$_pkgname"
	cargo build --frozen --release --all-features
	
	cd "$_pkgname-ui"
	cargo build --frozen --release --all-features
}

package_kondo-git() {
	provides=("$_pkgname")
	conflicts=("$_pkgname")

	cd "$srcdir/$_pkgname"
	install -vDm755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"
	install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_kondo-ui-git() {
	provides=("$_pkgname-ui")
	conflicts=("$_pkgname-ui")
	depends+=('gtk3')

	cd "$srcdir/$_pkgname"
	install -vDm755 -t "$pkgdir/usr/bin" \
		"$_pkgname-ui/target/release/$_pkgname-ui"
	install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
