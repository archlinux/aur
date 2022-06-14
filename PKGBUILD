# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='dtoa'
pkgname="ocaml-$_projectname"
pkgver='0.3.2'
pkgrel='7'
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
sha512sums=('a5dcce83f53725c45b0891f6af6275c5e617d536a2d491852215c9aefbbd22c7ac65f2738795eaba3a162e360d2fa86b33a98cdefb030230045789179c300604'
            'a2a35245f4d50db7d6c81bd8a2f94021a11493e40c7caae2a78e5ac989dbd99e6bc1cfa885ecf49161aab67eca9666c0370bb9dfb0df5905e85b463beefc5f79'
            'eb52bd485c41458c782227e88a649083aeef3e3372de1c5240237da5f25075d4cc98a8ff18bda1e9a2ee2e4d9d3c3509e80c34dce0426bc61992410cb438f271')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/fix-ounit-name.diff"
	patch --forward -p1 < "$srcdir/fix-tests.diff"
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
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
