# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='uucd'
pkgname="ocaml-$_projectname"
pkgver='15.1.0'
pkgrel='1'
pkgdesc='Unicode character database decoder for OCaml'
arch=('x86_64' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.08.0' 'ocaml-xmlm')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('907eb31b2eb6eba1ff5c236ed063902f12808b6e89db4735bec83c1c0f0abb527fb68890947c41532a0b1c1828de5c1c56b789afec736e300626c9cf7d61d84f')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Get unicode version
	_unicodeversion="$(sed -ne 's|.*"UNICODE_VERSION", `String "\(.*\)".*|\1|p' 'pkg/pkg.ml')"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%VERSION%%/$pkgver/g" {} +
	find . -type f -exec sed -i "s/%%UNICODE_VERSION%%/$_unicodeversion/g" {} +
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc'

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
