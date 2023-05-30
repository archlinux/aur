# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: mortzu
_projectname='uutf'
pkgname="ocaml-$_projectname"
pkgver='1.0.3'
pkgrel='2'
pkgdesc='Non-blocking streaming Unicode codec for OCaml'
# If you're running on aarch64, you have to add it to the arch array of the ocaml-cmdliner AUR dependency
arch=('x86_64' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.03.0' 'ocaml-cmdliner')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('c29da8709687727f1c3baad82ded1463ac8a07063bd51cf1c9e3b1fde230ba3cb6d932f2f97f22bbcd7436d868b2f4098a474160f37a4fc94d3d66ae079904ed')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%\(VERSION\|VERSION_NUM\)%%/$pkgver/g" {} +
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build --with-cmdliner true
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc'

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
