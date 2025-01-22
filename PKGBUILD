# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mew'
pkgname="ocaml-$_projectname"
pkgver='0.1.0'
_commit='e2a5ca84d9c3c4142a47ef867b2bbc44083246c5'
pkgrel='11'
pkgdesc='A general modal editing engine generator'
arch=('x86_64' 'aarch64')
url="https://github.com/kandu/$_projectname"
license=('MIT')
depends=('ocaml>=4.03.0' 'ocaml-trie')
makedepends=('git' 'dune>=1.1.0')
checkdepends=('ocaml-ppx_expect')
options=('!strip')
source=(
	"$pkgname-$pkgver::git+$url#commit=$_commit?signed"
	'remove-result-dep.diff'
)
b2sums=('8c70dce7f77bb7644d036dfeea03386bc23111573b7efef3fe80d486cb43ead33e6a7fe59c6c42b4663bbc01139708b2c37b8c420b5bdb0d85d41acef51e331b'
        'd8655aa2975030649c8115bbe1920be3764f9eba31205ff998a690e48839b4289747e057220be62713b521e57afde380dcc5ee52ad127458bd22bce6642e9c07')
validpgpkeys=('364216C4466A9E17A97CD5DBEECA66966D9E4261') # ZAN DoYe <zandoye@gmail.com> (https://github.com/kandu.gpg)

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove result dependency, as we're always running on OCaml >= 4.03.0
	patch --forward -p1 < '../remove-result-dep.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
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
