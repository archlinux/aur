# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppxlib'
pkgname="ocaml-$_projectname"
pkgver='0.22.2'
pkgrel='2'
pkgdesc='Standard library for ppx rewriters'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.1' 'ocaml-compiler-libs-repackaged>=0.11.0' 'ocaml-migrate-parsetree2>=2.2.0' 'ocaml-ppx_derivers>=1.0.0' 'ocaml-sexplib0' 'ocaml-stdlib-shims')
makedepends=('dune>=2.7.0')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	'ocaml-migrate-parsetree2.diff'
)
sha256sums=('8bdb42e3fb17240ad5578da621c37c73bbc02507ecc27d193d1b4cf11a4ea05d'
            '7c9586671c3b39e49b7f38c7c7765887cba1a9417484b3c1112677997da35d12')

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
