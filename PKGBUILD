# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='bin_prot'
pkgname="ocaml-$_projectname"
pkgver='0.16.0'
pkgrel='1'
epoch='1'
pkgdesc='A binary protocol generator'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT' 'BSD-3-Clause')
depends=('ocaml>=4.14.0' 'ocaml-base>=0.16.0' 'ocaml-ppx_compare>=0.16.0' 'ocaml-ppx_custom_printf>=0.16.0' 'ocaml-ppx_fields_conv>=0.16.0' 'ocaml-ppx_optcomp>=0.16.0' 'ocaml-ppx_sexp_conv>=0.16.0' 'ocaml-ppx_stable_witness>=0.16.0' 'ocaml-ppx_variants_conv>=0.16.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e6e2b4c2984fc89fc7ceb57cae7b7f796e6a0441e4d37da1b6bc1f167d8900b1c4bc0174d5d9de5669b7539d9256293365242e9875ef78fccbda226635c63b5d')

_sourcedirectory="$_projectname-$pkgver"

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

	for _copy in 'COPYRIGHT.txt' 'THIRD-PARTY.txt'; do
		install -Dm644 "$_copy" "$pkgdir/usr/share/doc/$pkgname/$_copy"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
	ln -sf "/usr/share/doc/$pkgname/LICENSE-Tywith.txt" "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
	for _license in 'COPYRIGHT.txt' 'THIRD-PARTY.txt'; do
		ln -sf "/usr/share/doc/$pkgname/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
