# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='domain-local-await'
pkgname="ocaml-$_projectname"
pkgver='1.0.0'
pkgrel='1'
pkgdesc='A scheduler independent blocking mechanism'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=4.12.0' 'ocaml-compiler-libs' 'ocaml-thread-table>=1.0.0')
makedepends=('dune>=3.3.0')
checkdepends=('ocaml-alcotest>=1.7.0' 'ocaml-mdx>=1.10.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a3cfb61aec8b53ec432b6f5d13760437d47888fc2578f880e1abf9bafe93236e5757b43a6c52d0b1cf19a4f29c8aefd049a388234a0b83200f38ecfc0e8ea214')

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
