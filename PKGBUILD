# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='backoff'
pkgname="ocaml-$_projectname"
pkgver='0.1.1'
pkgrel='1'
pkgdesc='Exponential backoff mechanism for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0')
makedepends=('dune>=3.3.0')
checkdepends=('ocaml-alcotest>=1.7.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-domain-shims-dep.diff'
)
b2sums=('23b109fbc8e97a7244e8747825f58921fa2a8d675965726fbe014a9d764c401e49ff1f07f26ea3b16ba22c3212088752787242ee1ad0de4c63a2e8475f164ff6'
        '2f961aef7410a8e9cba7da0c8b2f9ec58ab12b9225fac1c82c2dd6462aa3b99abfa3032577c1075b2a92bd406515f6b54c93a62fbec15c6858ee8f540153d5f9')

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
