# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='psq'
pkgname="ocaml-$_projectname"
pkgver='0.2.1'
pkgrel='1'
pkgdesc='Functional Priority Search Queues for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/pqwy/$_projectname"
license=('ISC')
depends=('ocaml>=4.07.0')
makedepends=('dune>=1.7.0')
checkdepends=('ocaml-alcotest' 'ocaml-qcheck')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'remove-seq-dep.diff'
)
b2sums=('c2eb2f4cc45e683858a434241a7ed4ad8abac4b30c5aaf0e211abbe2fa5a942faf7a0e317bc014ccb726ce15444b72a9b3323493fcffc5ec6937dc3860d69994'
        '4b275f91583950e42759e970843128c98a1b0416dab8d818aa1499d1c3849a1ef345f56aab81ea78136eb10044292fd31236b16a0be239e674c767e047ed644a')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove seq dependency, as we're always running on OCaml >= 4.07.0
	patch --forward -p1 < '../remove-seq-dep.diff'
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
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
