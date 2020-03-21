# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='dtoa'
pkgname="ocaml-$_projectname"
pkgver='0.3.2'
pkgrel='3'
pkgdesc='double-to-ascii ocaml implementation'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/flowtype/$pkgname"
license=('MIT')
depends=('ocaml>=4.01.0')
makedepends=('dune>=1.0.0')
checkdepends=('ocaml-ounit>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	'fix-ounit-name.diff'
	'fix-tests.diff'
)
sha256sums=('967bdcf83f67491a27a3e0c31bb55696f4f89a00be9aa0b3a248c7ef14374afd'
            '9b26ee783aeba8c8a2f299e2fd061d06ebceac61cbe13becd2debb93b61aa4e4'
            'fc4ab96c8be38e7a2440ad80b474631829d48ae4a25c16a886997304d44da4b1')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/fix-ounit-name.diff"
	patch --forward -p1 < "$srcdir/fix-tests.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest -p "$_projectname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
