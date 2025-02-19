# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='markup.ml'
pkgname='ocaml-markup'
pkgver='1.0.3'
pkgrel='4'
pkgdesc='Error-recovering streaming HTML5 and XML parsers for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/aantron/$_projectname"
license=('MIT')
depends=('ocaml>=4.03.0' 'ocaml-lwt' 'ocaml-uutf>=1.0.0')
makedepends=('dune>=2.7.0')
checkdepends=('ocaml-ounit>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-uchar-dep.diff'
)
b2sums=('71e6719c83ea0b456bb72ac469f11f8aab849098728431cf65e63f3484d98957250cec95a6c78e1bb586768f07fdf91bd4a8dc8195815b0bee836ce7c59fd2c8'
        'f817eabda3bac376b96cde7a0d4de00fc47d345889db0f60dd7488392e19ff33564d95dfe8cf61ab99bdc726caf2890b55164ff3c35d44b2558f8b10bf67d14c')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove uchar dependency, as we're always running on OCaml >= 4.03.0
	patch --forward -p1 < '../remove-uchar-dep.diff'
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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
