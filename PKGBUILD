# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com
# Contributor: serp <serp256 at gmail dot com>
_projectname='lwt'
pkgname="ocaml-$_projectname"
pkgver='5.5.0'
pkgrel='2'
pkgdesc='A library for cooperative threads in OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('MIT')
depends=('libev' 'dune>=1.8.0' 'ocaml>=4.08.0' 'ocaml-luv' 'ocaml-mmap>=1.1.0' 'ocaml-ocplib-endian' 'ocaml-ppxlib>=0.16.0' 'ocaml-react>=1.0.0' 'ocaml-result' 'ocaml-seq')
makedepends=('cppo>=1.1.0')
checkdepends=('ocaml-ppx_let')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('8951b94555e930634375816d71815b9d85daad6ffb7dab24864661504d11be26575ab0b237196c54693efa372a9b69cdc1d5068a20a250dc0bbb4a3c03c5fda1')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# This test breaks for some people but not for others,
	# see comments from oriba, crave and pha-qu on the AUR page
	sed -i '/test_mcast "mcast-join-loop"/d' 'test/unix/test_mcast.ml'

	# I was unable to persuade dune to not build lwt_domain (which
	# we don't want to build as there's no ocaml-multicore package),
	# so let's just delete it until I figure out what's going on
	rm -rf 'lwt_domain.opam'
	rm -rf {'src','test'}'/domain/'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	LWT_DISCOVER_ARGUMENTS='--use-libev true' dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
