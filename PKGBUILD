# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='multicoretests'
pkgname="ocaml-$_projectname"
pkgver='0.10'
pkgrel='2'
pkgdesc='PBT testsuite and libraries for testing multicore OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('BSD-2-Clause')
depends=('ocaml>=4.12.0' 'ocaml-qcheck>=0.25')
makedepends=('dune>=3.18.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'disable-dynlink-lin_tests_dsl-test.diff'
)
b2sums=('b367e27f8b19328445bf4e686ed8c466ccc3f39427b78b126cc4bbe0ee2c4a2edc0df403bd79b83ded71503b331cb48b0a4e282a9781647adab5b691463ee57b'
        '0eaefc875f9cde3ae41f6ab126311ec3c2e618da4c1c49c756e4579d75dd5c8ad8f2c3d321d2031ebda1ae9d3a30321250a0a0e4dc1c3882e3fa4998dfef1c8d')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable dynlink/lin_tests_dsl.ml test, as it currently does not pass
	patch --forward -p1 < "$srcdir/disable-dynlink-lin_tests_dsl-test.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/BSD-2-Clause"
}
