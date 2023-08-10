# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='tyxml'
pkgname="ocaml-$_projectname"
pkgver='4.5.0'
pkgrel='1'
pkgdesc='A library for building correct HTML and SVG documents for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml>=4.04.0' 'ocaml-markup>=0.7.2' 'ocaml-ppxlib' 'ocaml-re>=1.5.0' 'ocaml-seq' 'ocaml-uutf>=1.0.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'ocaml5-compatibility.diff'
)
sha512sums=('44591c4c32cb7e9425c1ca257624f12d6301709d33522672e13d28a6397da7e6b4eac0780e384763f26d5bc0e935a042d8224c22ea29a16d924f03a3c5b5a714'
            '0a635e8d4fb3a4ffdafb51dc4e91151a32ea72b98664f2832be89d1922ba00e3c9fa0da4d23340a3d46571fa61758c22f540f9fc07eff27c24d14f86b68ea878')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Fix ocaml 5 compatibility (based on https://github.com/ocsigen/tyxml/commit/2f2faf3bc2fb0be5a9c0bd2f2f440a98dde73f80)
	patch --forward -p1 < '../ocaml5-compatibility.diff'
}

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# CHECK_DISABLED_CIRCULAR_DEP
