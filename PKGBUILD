# Maintainer: MithicSpirit <rpc01234 at gmail dot com>


_pkgname=idris2-parser
pkgname="$_pkgname-all-git"
pkgver=latest
pkgrel=2
epoch=
pkgdesc='Various total parsers for Idris2'
arch=('x86_64')
url='https://github.com/stefan-hoeck/idris2-parser'
license=('custom:BSD')
depends=('idris2')
makedepends=(
	'git'
	'idris2-parser-git'
	'idris2-elab-util'
	'idris2-prettier'
	'idris2-refined'
	'idris2-sop'
)
provides=("$_pkgname-all")
conflicts=("$_pkgname-all")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

_parsers=(json show toml tsv webidl)
for _parser in "${_parsers[@]}"; do
	provides+=("idris2-parser-$_parser" "idris2-parser-$_parser-git")
	conflicts+=("idris2-parser-$_parser" "idris2-parser-$_parser-git")
done

_setenv() {
	unset IDRIS2_PACKAGE_PATH IDRIS2_PREFIX
	IDRIS2_PACKAGE_PATH="$(idris2 --libdir)"
	IDRIS2_PREFIX="$pkgdir/usr/lib"
	export IDRIS2_PACKAGE_PATH IDRIS2_PREFIX
}

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	_setenv
	cd "$srcdir/$_pkgname"

	for _parser in "${_parsers[@]}"; do
		idris2 --build "$_parser/parser-$_parser.ipkg"
	done
}

package() {
	_setenv
	cd "$srcdir/$_pkgname"

	for _parser in "${_parsers[@]}"; do
		idris2 --install-with-src "$_parser/parser-$_parser.ipkg"
	done

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
