# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='fmt'
pkgname="ocaml-$_projectname"
pkgver='0.9.0'
pkgrel='1'
pkgdesc='OCaml Format pretty-printer combinators'
# If you're running on aarch64, you have to add it to the arch array of the ocaml-cmdliner AUR dependency
arch=('x86_64' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.08.0' 'ocaml-cmdliner>=0.9.8')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('54ab2bdd2b5d0fb1f9be234a354ba32a45bcc167b30c1b57d70653e02bce2e5c5ffa1ecb1fdb1296bb44028cc432ac8273f5be210178ba33d631df0a9df47ab1')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%\(VERSION\|VERSION_NUM\)%%/$pkgver/g" {} +
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build --with-base-unix true --with-cmdliner true
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
