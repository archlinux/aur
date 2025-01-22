# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='thread-table'
pkgname="ocaml-$_projectname"
pkgver='1.0.0'
pkgrel='3'
pkgdesc='A lock-free thread-safe integer keyed hash table '
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=4.08.0')
makedepends=('dune>=3.3.0')
checkdepends=('ocaml-alcotest>=1.7.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('f6ca73da30fa3e59d620aca45f8895ee3053a5d5d79ab2674c187a837d029509d92cfac94e1d2a4478f32c5a16a737f0373a3aa208d075f0e201dc13a46e4a04')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
