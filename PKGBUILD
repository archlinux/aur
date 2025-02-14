# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='multicore-bench'
pkgname="ocaml-$_projectname"
pkgver='0.1.7'
pkgrel='1'
pkgdesc='Framework for benchmarking on multiple cores on current-bench for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0' 'ocaml-backoff>=0.1.0' 'ocaml-domain-local-await>=1.0.1' 'ocaml-mtime>=2.0.0' 'ocaml-multicore-magic>=2.1.0' 'ocaml-yojson>=2.1.0')
makedepends=('dune>=3.14.0')
checkdepends=('ocaml-mdx>=2.4.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-domain-shims-dep.diff'
)
b2sums=('77ef2294188b7c31f6acd999b4c76e31f66fb19436ed6bf1586957d5139f615aead2be7a7a0e51af1ae81482639325e19bc03649487bd658376ff7c07175016d'
        'd4bb65ef16ef26ae2d0d6fec3025ebe9fa09796f59ec119123d8ac1994ce49c37a52e7bc6e5ddd710f79b797814211ff31ea5b5aa18a65d329a46a9550739271')

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
