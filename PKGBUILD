# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
_projectname='gen'
pkgname="ocaml-$_projectname"
pkgver='1.1'
_commit='30802b92145e0c9cd235d3d2ba4d2210fda5612a'
pkgrel='3'
pkgdesc='Simple, efficient iterators for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/c-cube/$_projectname"
license=('MIT')
depends=('ocaml>=4.03.0' 'ocaml-seq')
makedepends=('dune>=1.1.0')
options=('!strip')
source=("$pkgname-$pkgver::git+$url#commit=$_commit?signed")
sha512sums=('438dab1de8fade55742aab94f542b84a35a207b5a1aedf82275723aad08206d3273f9788bedd7b949a3f5336292b60c4e62f6d1f43dc8df72930828fe9714caf')
validpgpkeys=('1370978BC81E9735DFE727E1EBFFF6F283F3A2B4') # Simon Cruanes <simon.cruanes.2007@m4x.org> (https://github.com/c-cube.gpg)

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
