# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='core_kernel'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
epoch='1'
pkgdesc="Industrial strength alternative to OCaml's standard library (system-independent part)"
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-core>=0.17.0' 'ocaml-int_repr>=0.17.0' 'ocaml-ppx_jane>=0.17.0' 'ocaml-ppx_optcomp>=0.17.0' 'ocaml-uopt>=0.17.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('d49d6e987502a3830a1b49d67ae3a05779298b6d2cbd3537dc9f9f0941298c0f4c9b76722678f32a4808fde95909d83afa45126f36853346f247a70841448226')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# fails because of a circular dependency on core
# check() {
# 	cd "$srcdir/$_sourcedirectory/"
# 	dune runtest --release --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
