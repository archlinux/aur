# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='base_quickcheck'
pkgname="ocaml-$_projectname"
pkgver='0.14.0'
pkgrel='3'
pkgdesc='Randomized testing framework, designed for compatibility with Base'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.2' 'ocaml-base>=0.14.0' 'ocaml-ppx_base>=0.14.0' 'ocaml-ppx_fields_conv>=0.14.0' 'ocaml-ppx_let>=0.14.0' 'ocaml-ppx_sexp_message>=0.14.0' 'ocaml-ppx_sexp_value>=0.14.0' 'ocaml-splittable_random>=0.14.0' 'ocaml-ppxlib>=0.11.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	"ppxlib.diff"
)
sha256sums=('eb18152bb29b6484cdb4ae18357b4dfb18b5e6f0d79cb18bd9ed7d8d906ca38b'
            '0723f15c4777de9e94bd56a07616f749cb067089797e2edd7909f19fbdacea7a')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < '../ppxlib.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
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
