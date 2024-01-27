# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='lwt_domain'
pkgname="ocaml-$_projectname"
pkgver='0.3.0'
pkgrel='1'
pkgdesc='Parallelism in Lwt using domainslib'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('MIT')
depends=('dune>=1.8.0' 'ocaml>=5.0.0' 'ocaml-domainslib>=0.5.0' 'ocaml-lwt>=5.6.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('db01ca6d6acffe7eb51961d5a200e6fee25c099b422fd49d5e89ff90c3fbe3e80a044eabbf9a77a89feeaf1cbb56708457efe0cc827eb49643e571e82e3d1cdf')

_sourcedirectory="$_projectname-$pkgver"

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
