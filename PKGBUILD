# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com
# Contributor: serp <serp256 at gmail dot com>
_projectname='lwt'
pkgname="ocaml-$_projectname"
pkgver='5.9.1'
pkgrel='2'
pkgdesc='A library for cooperative threads in OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('MIT')
depends=('libev' 'dune>=2.7.0' 'ocaml>=4.08.0' 'ocaml-findlib>=1.7.3' 'ocaml-ocplib-endian' 'ocaml-ppxlib>=0.36.0' 'ocaml-react>=1.0.0' 'zstd')
makedepends=('cppo>=1.1.0')
checkdepends=('ocaml-ppx_let')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'ppxlib-compat.diff'
)
b2sums=('4aa1bd218f206e52037f846a49ed5354b5719960cc12e7eca8e31dd5a17f5d0a1cdf35ab5041729c75999b3b599cc575397748ef5acccad0984640f4d6f2b69e'
        'db748567a6b7fe84c8383ed572ca04e7e148abc9f88c2d2253f93bde7ed2bbbc4c5180c123baa90a1b0455d3dca2b139973fdd5b73070b3c984118322512edc4')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# This test breaks for some people but not for others, see comments from oriba, crave and pha-qu on the AUR page
	sed -i '/test_mcast "mcast-join-loop"/d' 'test/unix/test_mcast.ml'

	# Fix compatibility with ocaml-ppxlib>=0.36.0 (based on https://github.com/ocsigen/lwt/pull/1033)
	patch --forward -p1 < '../ppxlib-compat.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	LWT_DISCOVER_ARGUMENTS='--use-libev true --use-pthread true --libev-default true --verbose' dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
