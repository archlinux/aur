# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com
# Contributor: serp <serp256 at gmail dot com>
_projectname='lwt'
pkgname="ocaml-$_projectname"
pkgver='5.3.0'
pkgrel='1'
pkgdesc='A library for cooperative threads in OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocsigen/lwt"
license=('MIT')
depends=('dune-configurator' 'libev' 'ocaml>=4.02.0' 'ocaml-mmap>=1.1.0' 'ocaml-ocplib-endian' 'ocaml-result' 'ocaml-seq' 'ocaml-migrate-parsetree>=1.5.0' 'ocaml-ppx_tools_versioned>=5.3.0' 'ocaml-react>=1.0.0')
makedepends=('cppo>=1.1.0' 'dune>=1.8.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('38ce928378a07b685f4606b60cbe37c26ef93ccb3e808c218e7d34ece9e659ad')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	LWT_DISCOVER_ARGUMENTS='--use-libev true' dune build -p "$_projectname,${_projectname}_ppx,${_projectname}_react" --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest -p "$_projectname,${_projectname}_ppx,${_projectname}_react" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
