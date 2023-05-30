# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com
# Contributor: serp <serp256 at gmail dot com>
_projectname='lwt'
pkgname="ocaml-$_projectname"
pkgver='5.6.1'
pkgrel='4'
pkgdesc='A library for cooperative threads in OCaml'
# If you're running on aarch64, you have to add it to the arch array of the cppo, ocaml-biniou, ocaml-easy-format and ocaml-yojson AUR dependencies
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('MIT')
depends=('libev' 'dune>=1.8.0' 'ocaml>=4.08.0' 'ocaml-domainslib>=0.5.0' 'ocaml-luv' 'ocaml-ocplib-endian' 'ocaml-ppxlib>=0.16.0' 'ocaml-react>=1.0.0')
makedepends=('cppo>=1.1.0')
checkdepends=('ocaml-ppx_let')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-domainslib-compatibility.diff::$url/commit/69bd080c843d457eb6543ab9e8a4c88da11f7939.diff"
)
sha512sums=('698875bd3bfcd5baa47eb48e412f442d289f9972421321541860ebe110b9af1949c3fbc253768495726ec547fe4ba25483cd97ff39bc668496fba95b2ed9edd8'
            '3416dafee3913c71ec90fa3b966b2afb936188ba4cddc7590c36561336c72a0e997536f67651fe33ae1b7c7b5e05a82341fec1d60b9e089e426b6d95f66febc2')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Fix domainslib 0.5.0 compatibility
	patch --forward -p1 < "../$pkgname-$pkgver-$pkgrel-domainslib-compatibility.diff"

	# This test breaks for some people but not for others,
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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
