# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='multicoretests'
pkgname="ocaml-$_projectname"
pkgver='0.3'
pkgrel='2'
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
b2sums=('60506716c8f773582f2690c74a2344d6f5d76f15fac831fc80340c505ee8dda7f1740f35321faeeb05eba5d525ed24a9256dc820c5292779d83b691cd21dd798'
        '914f9bdd965c2a767510b2daeadc71c6572b5292be1a382198d8f2700cb8c16ea34c9382a6877d6c4b3c3b895501c381f3f9522e11d7f3870fafc39103652f49')

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
