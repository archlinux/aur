# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='domain-local-await'
pkgname="ocaml-$_projectname"
pkgver='1.0.1'
pkgrel='1'
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
sha512sums=('4c6e70959a7be52e80141cc7bd0952cf46c248fa6496a734a6ed2efcb61c7af033aecf8716445a62e838601fbfde59af8ad4c7c4617c515aa7fadfa254038ebf'
            '3c587358e21c1a2b6bb9bb1dee04e7c4c1193dd8d93d4f05ee2dfc7de3fae382486a33279dbcf63ee6b0cd5ea441dccf19f3afaa60ac83769e65f0a7e5f30235')

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
