# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Gregory BELLIER <gregory.bellier -- gmail -- com>
pkgname='ocaml-inotify'
pkgver='2.5'
_commit='5e5853680c2b2e41091c1ed030eef9ab008203bb'
pkgrel='1'
pkgdesc='OCaml bindings for inotify'
arch=('x86_64' 'aarch64')
url="https://github.com/whitequark/$pkgname"
license=('LGPL-2.1-only WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.03.0' 'ocaml-lwt')
makedepends=('dune>=2.9.0')
checkdepends=('ocaml-fileutils>=0.4.4' 'ocaml-ounit>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver::git+$url#commit=$_commit?signed")
sha512sums=('SKIP')
validpgpkeys=('1370978BC81E9735DFE727E1EBFFF6F283F3A2B4') # Simon Cruanes <simon.cruanes.2007@m4x.org> (https://github.com/c-cube.gpg)

_sourcedirectory="$pkgname-$pkgver"

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
