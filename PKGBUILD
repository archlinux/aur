# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='lwt_log'
pkgname="ocaml-$_projectname"
pkgver='1.1.2'
pkgrel='4'
pkgdesc='Lwt-friendly logger'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception AND BSD-3-Clause')
depends=('ocaml>=4.03.0' 'ocaml-lwt>=4.0.0')
makedepends=('dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('d555b2e54b327ddbb68d8fcf1f669eb8b74709673da8c0f0dc32ee5d58c5055ebda52c2f13d39ac37e0fda724e02c057872147b88921ed15dbed73b58c59962d')

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
