# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='domainslib'
pkgname="ocaml-$_projectname"
pkgver='0.5.1'
pkgrel='4'
pkgdesc='Nested-parallel programming library for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0' 'ocaml-saturn>=0.4.0' 'ocaml-domain-local-await>=0.1.0')
makedepends=('dune>=3.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-fix-saturn-queue.diff::https://github.com/ocaml-multicore/domainslib/pull/121.diff"
)
b2sums=('d92416a075e182086c80bceac76118ba9a24fad2b4840b7b7fff20997122971a951c2c5154275037ae5a066a22650a5d0a8df9e35b12d132b8ffaad3e33eb0ce'
        '5ed8411f35b728ec26e6115970955ba61350257c131dc3c36f262221d8a161c08c428f032a5dd476df12d48100f9c73a4247e0380ac24961de2c38e4313b3709')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Fix build
	patch --forward -p1 < "../$pkgname-$pkgver-fix-saturn-queue.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
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
