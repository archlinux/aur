# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='base_quickcheck'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='2'
pkgdesc='Randomized testing framework, designed for compatibility with Base'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-ppx_base>=0.17.0' 'ocaml-ppx_fields_conv>=0.17.0' 'ocaml-ppx_let>=0.17.0' 'ocaml-ppx_sexp_message>=0.17.0' 'ocaml-ppx_sexp_value>=0.17.0' 'ocaml-ppxlib_jane>=0.17.0' 'ocaml-splittable_random>=0.17.0' 'ocaml-ppxlib>=0.28.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('acd54bfeb74a3b7f8f72fdcc4b92c8dd161f87f82bb6eca175d15947b6a04b9e13015c10562a5ce1a93c6019498d7c2f9f65dc2a7a5bbfcd78011e5731aabb04')

_sourcedirectory="$_projectname-$pkgver"

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
