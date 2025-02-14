# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='multicore-magic'
pkgname="ocaml-$_projectname"
pkgver='2.3.1'
pkgrel='1'
pkgdesc='Low-level multicore utilities for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0' 'ocaml-dscheck>=0.5.0')
makedepends=('dune>=3.14.0')
checkdepends=('nodejs' 'ocaml-alcotest>=1.7.0' 'ocaml-js_of_ocaml>=5.4.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-domain-shims-dep.diff'
)
b2sums=('7f2b4eb0094cea46dbb88bb027e617a6e494e2816175c805931526339eac2f07a8f3e26bed3bbf1bf0cce9b35a22c1946fd49f589d3296d17aeaf8edda125aad'
        '41f48d4f7103e59ffb3fb9d6be0fe8bfb320ed2c5448e12469410917f66f9db4c4e6a0463335228b11782e1a4f7b00ffea070efe37e142784448c4ad1942ff26')

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
