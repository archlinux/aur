# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Lance Roy <ldr709@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='spawn'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='2'
pkgdesc='A small OCaml library for spawning sub-processes'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.05.0' 'ocaml-ppx_bench')
makedepends=('dune>=2.8.0')
checkdepends=('ocaml-ppx_expect')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('07e62ff3dba88132ab1ed1aeab168f6860e0cf50aa2fe6e6f07e495f07d4d1e237c017fd98ce93a613b7e43943d9edb98c51fabb3ad81a2ab1f10903d58f53a2')

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
}
