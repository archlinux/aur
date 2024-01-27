# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='saturn'
pkgname="ocaml-$_projectname"
pkgver='0.4.1'
pkgrel='1'
pkgdesc='Lock-free data structures for multicore OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0')
makedepends=('dune>=3.2.0')
checkdepends=('ocaml-yojson>=2.0.2' 'ocaml-qcheck>=0.18.1' 'ocaml-multicoretests>=0.2' 'ocaml-dscheck>=0.1.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-domain-shims-dep.diff'
)
sha512sums=('334157b53318bb35daecedddca671ce6d844512577f8f73c6f7dbfe4f4939379788bf8823dfd84effde9ec924103a0a8221f2bc22d2c16ca97aa82a73b29c8c4'
            '52200c0b70f64aa383532ddfd0b38475ac6b40770937963192d156d79c9533d934f4e8cf49fef701fb884aafcb6c94c1f21e1c659962c758df90b9d26a9ffc60')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove domain_shims dependency, as we're always running on OCaml >= 5.0.0
	patch --forward -p1 < '../remove-domain-shims-dep.diff'
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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
