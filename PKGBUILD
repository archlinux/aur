# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Lance Roy <ldr709@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='spawn'
pkgname="ocaml-$_projectname"
pkgver='0.15.1'
pkgrel='2'
pkgdesc='A small OCaml library for spawning sub-processes'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.05.0' 'ocaml-ppx_expect')
makedepends=('dune>=2.8.0')
checkdepends=('ocaml-ppx_expect')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('efdb31d5ec5ea36d0bc80224d4ee04e46ce3428d1662870e6cebece92bc313d6eebee378802c0c059dd6e0cafea515308c31b7dfaf04a098eb4566583c1e9ed4')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
