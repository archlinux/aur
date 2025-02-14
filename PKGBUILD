# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='saturn'
pkgname="ocaml-$_projectname"
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Lock-free data structures for multicore OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.2.0' 'ocaml-backoff>=0.1.1' 'ocaml-multicore-magic>=2.3.0')
makedepends=('dune>=3.14.0')
checkdepends=('ocaml-alcotest>=1.7.0' 'ocaml-dscheck>=0.5.0' 'ocaml-mdx>=0.4.0' 'ocaml-multicore-bench>=0.1.7' 'ocaml-multicoretests>=0.4' 'ocaml-qcheck>=0.21.3' 'ocaml-yojson>=2.0.2')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-domain-shims-dep.diff'
)
b2sums=('9fa78a46aa74e0e90aff4ac350f767ba117cdc2724476b037f5457e101242fd375198a83fab2e7c498f974ffa7964ae78173aec6c6581940bcc93cc74cd0adaa'
        'fdc83e8db6fe8813f293c8d0ee005ff49b51cc237d39b5fdecf858aed5f5e194f1289c2b30d2f3d727d2e4bdf9cbfa1afae82e1a44939f993f66fa0961cb06fb')

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
