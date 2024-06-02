# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_diff'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='2'
pkgdesc='A PPX rewriter that generates the implementation of [Ldiffable.S]'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-gel>=0.17.0' 'ocaml-ppx_compare>=0.17.0' 'ocaml-ppx_enumerate>=0.17.0' 'ocaml-ppx_jane>=0.17.0' 'ocaml-ppxlib_jane>=0.17.0' 'ocaml-ppxlib>=0.28.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('0ff71cade9b94b9a4352958c5d288d910676cc43524bf060b25a0d63ed75ac9b8241ecfeae7f928806269a0fbe961ddc6f60388bd134bc609bebd12971ce13e6')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# No tests available

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
