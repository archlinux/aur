# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Lance Roy <ldr709@gmail.com>
_projectname='sexp_pretty'
pkgname="ocaml-$_projectname"
pkgver='0.16.0'
pkgrel='1'
epoch='1'
pkgdesc='S-expression pretty-printer for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'ocaml-base>=0.16.0' 'ocaml-ppx_base>=0.16.0' 'ocaml-re>=1.8.0' 'ocaml-sexplib>=0.16.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('531c71dc77abfe9d088eb6213ae9d6563d9a6e1db58a710974120ece6465e192aab4ede6e36e12b6a386bbcfcfa497d5f7a5ac250ea54bdf641cbd597ffc96b6')

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
