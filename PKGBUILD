# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='uucp'
pkgname="ocaml-$_projectname"
pkgver='15.0.0'
pkgrel='3'
pkgdesc='Unicode character properties for OCaml'
# If you're running on i486, pentium4, armv7h or aarch64, you have to add it to the arch array of the ocaml-cmdliner, ocaml-uchar and ocaml-uutf AUR dependencies
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.03.0' 'ocaml-cmdliner>=1.1.0' 'ocaml-uucd' 'ocaml-uunf' 'ocaml-uutf>=1.0.1')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('bae1409937321e59764fa00d5ee4c85697096609d9b02a948ec31c00f8efb4ad96ae99741ac172be169cbbee211dab26f58b6a3e524341fb3908d52b33378aa1')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Get unicode version
	_unicodeversion="$(sed -ne 's|.*"UNICODE_VERSION", `String "\(.*\)".*|\1|p' 'pkg/pkg.ml')"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%\(VERSION\|VERSION_NUM\)%%/$pkgver/g" {} +
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
