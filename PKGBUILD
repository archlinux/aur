# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='lockfree'
pkgname="ocaml-$_projectname"
pkgver='0.3.1'
pkgrel='1'
pkgdesc='Lock-free data structures for multicore OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0' 'ocaml-yojson>=2.0.2')
makedepends=('dune>=3.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-domain-shims-dep.diff'
)
sha512sums=('084ca49cea0c13f82b857e900172d7ed5f43c4dfb81dab82799888419f9cc0f799c3f12e250b34c84960ace9145c593012b98647caa450f89bfb241256a4bba9'
            '863b9b557e94a5c07a31ba222257c4f4153200e084be48de4b7ec71df301282f48d512da0e6d185f6f8a40a8e08275cd58ef230d46263031b03b0a1927881ab9')

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

# Ignoring this for now, as I would have to package ocaml-alcotest and its dependencies
# (about 20 packages) just for this single package, which is not something I want to do
# check() {
# 	cd "$srcdir/$_sourcedirectory/"
# 	dune runtest --release --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
