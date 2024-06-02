# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Thorsten Wißmann <edu@thorsten-wissmann.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>
# Contributor: Thomas Pani <thomas.pani@gmail.com>
# Contributor: crave <crave@infinity>
pkgname='ocaml-fileutils'
pkgver='0.6.4'
pkgrel='4'
pkgdesc='OCaml API to manipulate real files and filenames'
arch=('x86_64' 'aarch64')
url="https://github.com/gildor478/$pkgname"
license=('LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.08.0')
makedepends=('dune>=1.11.0')
checkdepends=('ocaml-ounit>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'remove-shim-deps.diff'
)
b2sums=('9acb26570fca578cb24436864765a9e4f7fe5fbdae43417eb543cef9849c94173cd20a4833ae43d8971a4e43f75f62c309cc0e176b1c4487a1c65955b588b6f1'
        'c45474edb4c620def55ab241a073b3bfa74352072c67492384ca3a22dbe9246d5fea647922e673e696f29fb10b251fe0a202f932ceeb7eddd142e2dff144f003')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove seq and stdlib-shims dependencies, as we're always running on OCaml >= 4.08.0
	patch --forward -p1 < '../remove-shim-deps.diff'
}

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
