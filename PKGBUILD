# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='uucd'
pkgname="ocaml-$_projectname"
pkgver='15.0.0'
pkgrel='3'
pkgdesc='Unicode character database decoder for OCaml'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.01.0' 'ocaml-xmlm')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('771d877e2d1a61b0db637c4ff7b1e820786739226254facec2bdac97fd7b9f6ac9ed5041d310e425b941bfcc47912c806d0d2db4168a69fb0bd418c0025817bb')

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
