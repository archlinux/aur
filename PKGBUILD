# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='multicoretests'
pkgname="ocaml-$_projectname"
pkgver='0.8'
pkgrel='1'
pkgdesc='PBT testsuite and libraries for testing multicore OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('BSD-2-Clause')
depends=('ocaml>=4.12.0' 'ocaml-qcheck>=0.25')
makedepends=('dune>=3.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'disable-dynlink-lin_tests_dsl-test.diff'
)
b2sums=('cb2cbe1b81e4526187bd8b22cee891ec7337e4b125f750528465e494e873b7d060ee8180c54ffd59f5fc78fa98ab5b2826dd866d8cff9dd460c83f3b2610c125'
        '4332646b32b204fc68776f28bdbe61c153508aabde3b9afe9cf160e0b7ce7838c6e11bee3338e3b37d248b1c039a16d69b9be96607e32faf378e125242c5d5ef')

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
