# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='variantslib'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
epoch='1'
pkgdesc='OCaml variants as first class values'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('33bd75495e23aa0d1f07a35e4a5de37e9485c3ceb00196e3884d7e93baca1588198f8f886ee5407632ccafda1aaa1ed1def05422a58cb6e66e7a31b0518a164d')

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
