# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='domain-local-await'
pkgname="ocaml-$_projectname"
pkgver='1.0.1'
pkgrel='3'
pkgdesc='A scheduler independent blocking mechanism'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=4.12.0' 'ocaml-compiler-libs' 'ocaml-thread-table>=1.0.0')
makedepends=('dune>=3.8.0')
checkdepends=('ocaml-alcotest>=1.7.0' 'ocaml-mdx>=2.3.0' 'ocaml-ocaml-version>=3.6.1')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-domain-shims-dep.diff'
)
b2sums=('b5485cc9210b5a3d73fc8ecf5ae0784920f982ccb35aa490ae36cbffd83e8b305cd41d9e18055418c18d9a266db4c807448f25f4d69a0e927b6b080821ad7f8d'
        '1de318e9178335a9f5f2030c4ec86d086baf20ad4d6e2464f11de9631cc3694b475c2a7c6e4b67aa6d5147e9377fb895b4086d775b9482da140c465f030e5989')

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
