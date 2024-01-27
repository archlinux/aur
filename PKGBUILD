# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='lambda-term'
pkgname="ocaml-$_projectname"
pkgver='3.3.2'
pkgrel='2'
pkgdesc='Terminal manipulation library for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD-3-Clause')
depends=('ocaml>=4.08.0' 'ocaml-logs_lwt' 'ocaml-lwt>=4.2.0' 'ocaml-mew_vi>=0.5.0' 'ocaml-react' 'ocaml-zed>=3.2.0')
makedepends=('dune>=3.0.0')
options=('!strip')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('78648768644058337e22c79cf1fbb1a36472b24f11b1dc0461fc38419be6ec01b02d8d0ac45fed0bc99f91ba4c0f19d3bda113e834e064bee973b734527b9766')

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

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}
