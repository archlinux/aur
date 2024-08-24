# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: éclairevoyant
_projectname='ocaml-version'
pkgname="ocaml-$_projectname"
pkgver='3.6.8'
pkgrel='1'
pkgdesc='Manipulate, parse and generate OCaml compiler version strings'
arch=('x86_64' 'aarch64')
url="https://github.com/ocurrent/$_projectname"
license=('ISC')
depends=('ocaml>=4.07.0')
makedepends=('dune>=3.6.0')
checkdepends=('ocaml-alcotest')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('a998ac03638307ef12f8ea919046b75c1f291ef87e5a4a67b9951b4cfa9b1c85d80e79aab06e414d17ba066cfa514a03121a113596111d0c3734796f7d0f0dc9')

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
