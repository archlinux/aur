# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com
# Contributor: serp <serp256 at gmail dot com>
_projectname='lwt'
pkgname="ocaml-$_projectname"
pkgver='5.4.1'
pkgrel='2'
pkgdesc='A library for cooperative threads in OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('MIT')
depends=('libev' 'dune>=1.8.0' 'ocaml>=4.08.0' 'ocaml-luv' 'ocaml-mmap>=1.1.0' 'ocaml-ocplib-endian' 'ocaml-ppxlib>=0.16.0' 'ocaml-react>=1.0.0' 'ocaml-result' 'ocaml-seq')
makedepends=('cppo>=1.1.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9090e646cff89435971a9bca08c4ddbb4719f5d6c8745cfd617d3a549a0ed1cf')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	# this test breaks for some people but not for others
	# see comments from oriba, crave and pha-qu on the AUR page
	sed -i '/test_mcast "mcast-join-loop"/d' 'test/unix/test_mcast.ml'
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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' --release --verbose

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
