# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: éclairevoyant
_projectname='ocaml-version'
pkgname="ocaml-$_projectname"
pkgver='3.7.0'
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
b2sums=('709b157eae949c4c797713bfcec3908c178dd0bb2f0401b9e990bf62d1869ae73ce868c972359f4aed8d91450e307e7619159b4645c5be5b116c4c9eb2659769')

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
