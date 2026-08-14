# Maintainer: Inochi Amaoto <inochiama@gmail.com>

pkgname=sail-isa-spec
pkgver=0.20.2
pkgrel=1
pkgdesc="Sail architecture definition language"
arch=('x86_64')
url="https://opam.ocaml.org"
license=(custom)
depends=('dune' 'ocaml' 'opam')
options=('!strip')
makedepends=('git')
source=("git+https://github.com/rems-project/sail.git#branch=sail2")
sha512sums=('SKIP')

build() {
	cd $srcdir/sail
	opam switch create 5.1.0 || true
	eval $(opam env --switch=5.1.0)
	opam install . -y --deps-only
	dune build --release
}

package() {
	cd $srcdir/sail

	DESTDIR=$pkgdir dune install \
		   --prefix "/usr" \
		   --libdir "/usr/lib/ocaml" \
		   --docdir "/usr/share/doc"

	# Move doc
	# mv $pkgdir/usr/share/doc/${_ocamlname} $pkgdir/usr/share/doc/$pkgname

	# Move license file
	install -d $pkgdir/usr/share/licenses/$pkgname
	cp $srcdir/sail/LICENSE $pkgdir/usr/share/licenses/$pkgname
}
