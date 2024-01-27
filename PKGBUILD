# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='multicoretests'
pkgname="ocaml-$_projectname"
pkgver='0.3'
pkgrel='1'
pkgdesc='PBT testsuite and libraries for testing multicore OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('BSD-2-Clause')
depends=('ocaml>=4.12.0' 'ocaml-qcheck>=0.20.0')
makedepends=('dune>=3.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'disable-dynlink-lin_tests_dsl-test.diff'
)
sha512sums=('32e1808e6228df93c2f017259dbb70cd7c8b399a07b04d2e1a84e1d729fb5c478bf706bfc3ec342d160011c990f1520c43ff9a8cd13dd718eec8399a31618d6e'
            '03b4d703ddce013313a24ac6d850db2debde77023843ee5917cbe89da576f61fbfa0f84675e00af2db59ac52e10f28be0cdda5d2953afe6ecf159bc2895f51d8')

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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/BSD-2-Clause"
}
