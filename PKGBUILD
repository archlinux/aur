# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='saturn'
pkgname="ocaml-$_projectname"
pkgver='0.4.0'
pkgrel='1'
pkgdesc='Lock-free data structures for multicore OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0')
makedepends=('dune>=3.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-domain-shims-dep.diff'
)
sha512sums=('e635f21c25afece7adb731bbc3b61dedef12d83baf68249daa56e4ae1e1ac6ecdd3ce79cc8b78f2487575505a15ffa412cfed4f90fa204002952641a0b8c4d12'
            '5158083b07bfdcef7f03f30f4a950fa0b4efaeac6884031315b956a88696a9ff5feab94cd60f9e9a6377b35f0ca72e51f598958e51f7dbbfc25e36f351697336')

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
