# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='uunf'
pkgname="ocaml-$_projectname"
pkgver='14.0.0'
pkgrel='2'
pkgdesc='Unicode text normalization for OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.03.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam' 'ocaml-cmdliner' 'ocaml-uucd' 'ocaml-uutf')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('e7da8386419b03ea6aa4acda7a5562d6248292b8d108ea8c8f1913eb1f34a56d76199e53fff38184e998c32db9c954cd934232d0d826956172706830fd637b7b')

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
