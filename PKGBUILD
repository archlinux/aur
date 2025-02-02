# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='sexplib'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
epoch='1'
pkgdesc='Library for serializing OCaml values to and from S-expressions'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT AND BSD-3-Clause')
depends=('ocaml>=5.1.0' 'ocaml-parsexp>=0.17.0' 'ocaml-sexplib0>=0.17.0' 'ocaml-num')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('feff6594ce144e1f25efec60009874210e71ba19fff5edffe46e25510a73a235ce28333888c2bc6839c5cffb901a70b2463853b4ca02cf93d89aaa6a15f154b7')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE-Tywith.txt" "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}
