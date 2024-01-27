# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: mortzu
_projectname='uchar'
pkgname="ocaml-$_projectname"
pkgver='0.0.2'
pkgrel='2'
pkgdesc="Compatibility library for OCaml's Uchar module"
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml/$_projectname"
license=('LGPL-2.1-only WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=3.12.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg' 'opam')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ocaml/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('487a9706cf9dfc9b9c94442a51766cc211687d6ebcb4dd3c94d09cb1ed6d7fd61e966e91a4121fe2d1681b2fd6bfee9079d3bccccdb6d65ba2111524ab5dd1bc')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%NAME%%/$_projectname/g" {} +
	find . -type f -exec sed -i "s/%%VERSION%%/$pkgver/g" {} +
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/build.ml' 'native=true' 'native-dynlink=true'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc'

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
