# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='uucp'
pkgname="ocaml-$_projectname"
pkgver='14.0.0'
pkgrel='2'
pkgdesc='Unicode character properties for OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.03.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam' 'ocaml-cmdliner' 'ocaml-uucd' 'ocaml-uunf' 'ocaml-uutf')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('b8e70cd89ef8e58f9808db4314c2a56f02ec869d48908e8243adafd33c75d2df7233e22eca156febf3e3e6c93bfc7af735ae54f486f19b5bc36531df4c85ae72')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Get unicode version
	_unicodeversion="$(sed -ne 's|.*"UNICODE_VERSION", `String "\(.*\)".*|\1|p' 'pkg/pkg.ml')"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%\(VERSION\|VERSION_NUM\)%%/$pkgver/g" {} +
	find . -type f -exec sed -i "s|%%PKG_HOMEPAGE%%|$url|g" {} +
	find . -type f -exec sed -i "s/%%UNICODE_VERSION%%/$_unicodeversion/g" {} +

	# Download a copy of the XML Unicode character database
	ocaml 'pkg/build_support.ml'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build --with-cmdliner true --with-uunf true --with-uutf true
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc'

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
