# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppxlib'
pkgname="ocaml-$_projectname"
pkgver='0.12.0'
pkgrel='3'
pkgdesc='Base library and tools for ppx rewriters'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.1' 'ocaml-base>=0.11.0' 'ocaml-compiler-libs-repackaged>=0.11.0' 'ocaml-migrate-parsetree>=1.3.1' 'ocaml-ppx_derivers>=1.0.0' 'ocaml-stdio>=0.11.0')
makedepends=('dune')
checkdepends=('ocaml-cinaps>=0.12.1' 'ocaml-findlib')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-fix-tests.diff::$url/pull/111.diff"
)
sha256sums=('6b562c9b3b9350777318729921f890850b385c469db60769aafd9371998a2c42'
            '891640f82db542e682d250547e1f39290b8a230b287fbcd0b22c2e43adaa6f64')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	# https://github.com/ocaml-ppx/ppxlib/pull/111
	patch --forward -p1 < "../$pkgname-$pkgver-$pkgrel-fix-tests.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest -p "$_projectname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
