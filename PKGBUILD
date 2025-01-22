# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Thorsten Wißmann <edu@thorsten-wissmann.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>
# Contributor: Thomas Pani <thomas.pani@gmail.com>
# Contributor: crave <crave@infinity>
pkgname='ocaml-fileutils'
pkgver='0.6.6'
pkgrel='2'
pkgdesc='OCaml API to manipulate real files and filenames'
arch=('x86_64' 'aarch64')
url="https://github.com/gildor478/$pkgname"
license=('LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.14.0')
makedepends=('dune>=2.9.0')
checkdepends=('ocaml-ounit>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('61ccd9173b55573eca52fe70d4076a7047e3fc9f0fb3de44ff9f65dc8fb5832f84aa1ed8a89aebd7ad892188e32c2595bc34855df46dbe07c1d1314109c5eabc')

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
