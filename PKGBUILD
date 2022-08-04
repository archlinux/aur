# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Thorsten Wißmann <edu@thorsten-wissmann.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>
# Contributor: Thomas Pani <thomas.pani@gmail.com>
# Contributor: crave <crave@infinity>
pkgname='ocaml-fileutils'
pkgver='0.6.3'
pkgrel='1'
pkgdesc='OCaml API to manipulate real files and filenames'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gildor478/$pkgname"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml>=4.03.0' 'ocaml-stdlib-shims')
makedepends=('dune>=1.11.0')
checkdepends=('ocaml-ounit>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	'fix-ounit-name.diff'
)
sha512sums=('491c01347714b9caf69e184be7e031d82d3602b91ce52c5c995b25897090d9af79b2ae058ff92b91ab31b44dd1fdf15fbe1a428d2f3a50872d3f0f7689a64e8c'
            'e68fcb4cd54603573d7175579d7d78045d5b9faf6c3c3dc149f5d6908e301e6518bad41a8793df666b3441331d275040342e5bcb6012851e884b9eeca8f028d9')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/fix-ounit-name.diff"
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

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
