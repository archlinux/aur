# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='uucd'
pkgname="ocaml-$_projectname"
pkgver='17.0.0'
pkgrel='1'
pkgdesc='Unicode character database decoder for OCaml'
arch=('x86_64' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.08.0' 'ocaml-xmlm')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.1.0' 'opam')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
b2sums=('060fb2ba21bcc0ae1f39d689926e301d05963cd43e867a1836d005811210421cf26bc1fc937a0773e93add583a4e65662c444a7b75b43dc45f32c0026a2cac59')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Get unicode version
	_unicodeversion="$(sed -ne 's|.*"UNICODE_VERSION", `String "\(.*\)".*|\1|p' 'pkg/pkg.ml')"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%\(VERSION\|VERSION_NUM\)%%/$pkgver/g" {} +
	find . -type f -exec sed -i "s/%%UNICODE_VERSION%%/$_unicodeversion/g" {} +
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc/ocaml'

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
