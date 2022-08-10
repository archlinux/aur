# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='uucd'
pkgname="ocaml-$_projectname"
pkgver='14.0.0'
pkgrel='2'
pkgdesc='Unicode character database decoder for OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.01.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam' 'ocaml-xmlm')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('4f52c83c9eab3a111f917a89b11a39ac46f3b6d63b381c0caaa41a2d68d9271a9d9d844de348e176b3059f8185d0149fd3700fd7faf944787fd506cbc2e02f96')

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

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
