# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='uunf'
pkgname="ocaml-$_projectname"
pkgver='15.0.0'
pkgrel='3'
pkgdesc='Unicode text normalization for OCaml'
# If you're running on i486, pentium4, armv7h or aarch64, you have to add it to the arch array of the ocaml-cmdliner, ocaml-uchar and ocaml-uutf AUR dependencies
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.03.0' 'ocaml-cmdliner>=1.1.O' 'ocaml-uucd>=15.0.0' 'ocaml-uutf>=1.0.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('cbda968cb07de9b6553652e47ad2f6192f1c1be6081267c31d022f1a6f26af62b8bd7c4365685a0ab6a5d260a574962ddbabae5b19e7695ec5060bbeeb6d9c11')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Get unicode version
	_unicodeversion="$(sed -ne 's|.*"UNICODE_VERSION", `String "\(.*\)".*|\1|p' 'pkg/pkg.ml')"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%VERSION%%/$pkgver/g" {} +
	find . -type f -exec sed -i "s/%%\(UNICODEVERSION\|UNICODE_VERSION\)%%/$_unicodeversion/g" {} +

	# Download a copy of the XML Unicode character database
	ocaml 'pkg/build_support.ml'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build --with-cmdliner true --with-uutf true
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc'

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
