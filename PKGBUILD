# Contributor: Thomas Letan <lthms@soap.coffee>

_projectname='jsonm'
pkgname=ocaml-$_projectname
pkgver=1.0.2
pkgrel=1
license=('custom:ISC')
arch=('x86_64')
pkgdesc="Non-blocking streaming JSON codec for OCaml"
url="https://erratique.ch/software/$_projectname"
depends=(
  'ocaml'
  'ocaml-uutf'
)
makedepends=(
  'ocaml-findlib'
  'ocamlbuild'
  'ocaml-topkg'
  'opam'
)
source=(
  "$pkgname-$pkgver.tbz::https://erratique.ch/software/jsonm/releases/jsonm-$pkgver.tbz"
)
options=('!strip')
sha512sums=(
  "0072f5c31080202ed1cb996a8530d72c882723f26b597f784441033f59338ba8c0cbabf901794d5b1ae749a54af4d7ebf7b47987db43488c7f6ac7fe191a042f"
)

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%\(VERSION\|VERSION_NUM\)%%/$pkgver/g" {} +
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build --dev-pkg false
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc'

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
