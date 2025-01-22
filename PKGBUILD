# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='async_rpc_kernel'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
pkgdesc='Platform-independent core of Async RPC library for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-async_kernel>=0.17.0' 'ocaml-core>=0.17.0' 'ocaml-core_kernel>=0.17.0' 'ocaml-gel>=0.17.0' 'ocaml-ppx_jane>=0.17.0' 'ocaml-protocol_version_header>=0.17.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('21a47425457a9d62a64664bb87cae64623eaf9c449d1cff06b0260e2938b65e69cc7cad63f74522e205ece01a3f884baab49543a007d792ca6216dda45c0c9bc')

_sourcedirectory="$_projectname-$pkgver"

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
