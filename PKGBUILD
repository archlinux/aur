# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='tyxml'
pkgname="ocaml-$_projectname"
pkgver='4.6.0'
pkgrel='3'
pkgdesc='A library for building correct HTML and SVG documents for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('LGPL-2.1-only WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.07.0' 'ocaml-markup>=0.7.2' 'ocaml-ppxlib>=0.18.0' 'ocaml-re>=1.5.0' 'ocaml-uutf>=1.0.0' 'zstd')
makedepends=('dune>=2.7.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-seq-dep.diff'
)
b2sums=('2c419db5d43d839bdf043dfe0663e5416fffab8ce01b3c755b8563ebf1cf298fd579f8573c26eb6034a8a9e286dc571ae4574dbb1cb3f77043b39697a078f80f'
        '20fbb16f3361965f5ed9b9b29f584c973d8e2199048873fbd59af91c8e9d094b4efcbfe83d1d02b38b18060579588a4db8c1f6ac805aae8c2218285d8fc253db')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove seq dependency, as we're always running on OCaml >= 4.07.0
	patch --forward -p1 < '../remove-seq-dep.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# Not running tests because of a circular dependency on ocaml-js_of_ocaml

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
