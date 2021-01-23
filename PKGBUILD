# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppxlib'
pkgname="ocaml-$_projectname"
pkgver='0.21.0'
pkgrel='1'
pkgdesc='Standard library for ppx rewriters'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.1' 'ocaml-compiler-libs-repackaged>=0.11.0' 'ocaml-migrate-parsetree2>=2.1.0' 'ocaml-ppx_derivers>=1.0.0' 'ocaml-sexplib0' 'ocaml-stdlib-shims')
makedepends=('dune>=1.11.0')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	'ocaml-migrate-parsetree2.diff'
)
sha256sums=('02c0952c7cb30eed97c5663fff624d14965b53338b32d7ea170b56398e67ba70'
            'cf9c23418e0a6b166b147462278c594e5e48ffd933a3703daf6aa38bc77f666a')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < '../ocaml-migrate-parsetree2.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# fails because of a circular dependency on this package by ppx_jane
# $pkgname-$pkgver-$pkgrel-fix-tests.diff::https://github.com/ocaml-ppx/ppxlib/pull/111
# check() {
#	cd "$srcdir/$_sourcedirectory/"
#	dune runtest --release --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' --release --verbose

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
