# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='lwt_domain'
pkgname="ocaml-$_projectname"
pkgver='0.3.0'
pkgrel='3'
pkgdesc='Parallelism in Lwt using domainslib'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('MIT')
depends=('dune>=1.8.0' 'ocaml>=5.0.0' 'ocaml-domainslib>=0.5.0' 'ocaml-lwt>=5.6.0' 'libev')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('453ac890badf36bcb7b5bf56e27f810ec492cc32d2bdff7817b4d9bcf20c9369851c473281bdad7c60b16091fd6d33dbf834d2faf1d55d547fa4c297ede13f30')

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
