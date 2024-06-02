# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='saturn'
pkgname="ocaml-$_projectname"
pkgver='0.4.1'
pkgrel='2'
pkgdesc='Lock-free data structures for multicore OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0')
makedepends=('dune>=3.2.0')
checkdepends=('ocaml-yojson>=2.0.2' 'ocaml-qcheck>=0.18.1' 'ocaml-multicoretests>=0.2' 'ocaml-dscheck>=0.1.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-domain-shims-dep.diff'
)
b2sums=('bcfa0177272edffb735085def417e755f54f779c41b831cb1249ff632df3185b9ae8d113a5fa1403b6abe783eb3946dd12389b938437200b813cd0eea5ab5563'
        '29b7898324b9dac98574173fe42c1ef1d6d4de929eab3d2b8a5b04d6651b8cec26130f50c8fdb77d07f9e032689637f1f34c3605b74d5060d2585bbabb87b0f8')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove domain_shims dependency, as we're always running on OCaml >= 5.0.0
	patch --forward -p1 < '../remove-domain-shims-dep.diff'
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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
