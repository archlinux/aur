# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='bin_prot'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='2'
epoch='1'
pkgdesc='A binary protocol generator'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT' 'BSD-3-Clause')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-ppx_compare>=0.17.0' 'ocaml-ppx_custom_printf>=0.17.0' 'ocaml-ppx_fields_conv>=0.17.0' 'ocaml-ppx_optcomp>=0.17.0' 'ocaml-ppx_sexp_conv>=0.17.0' 'ocaml-ppx_stable_witness>=0.17.0' 'ocaml-ppx_variants_conv>=0.17.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('bad3203bc42f6f95550a29392fe419d3159614743736ee3bf5855765330c2549575d7af8d42f3534be37fb346d43aa56667d71af328c7ea8ba6c4a64006f695a')

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

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
	ln -sf "/usr/share/doc/$pkgname/LICENSE-Tywith.txt" "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}
