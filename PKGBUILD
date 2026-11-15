# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='lwt_log'
pkgname="ocaml-$_projectname"
pkgver='1.1.3'
pkgrel='1'
pkgdesc='Lwt-friendly logger'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception AND BSD-3-Clause')
depends=('ocaml>=4.03.0' 'ocaml-lwt>=4.0.0')
makedepends=('dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('ad832daad0fe3aecec740deafde28226fdde4c5cdfc58dd6ec5964a93ac21f09b5b9b5769129873ea403b180306d08622999984546a96bd2f9e3cc33f9dd5a7c')

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

	install -Dm644 'COPYING' "$pkgdir/usr/share/doc/$pkgname/COPYING"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
