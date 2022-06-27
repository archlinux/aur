# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=prjtrellis
pkgname=$_pkgname-git
pkgver=1.2.1.r4.g64b38df
pkgrel=2
pkgdesc='Tools for working with the Lattice ECP5 bit-stream format'
arch=('x86_64')
url="https://github.com/YosysHQ/$_pkgname"
license=('custom:ISC' 'MIT')
depends=('boost-libs')
makedepends=("$_pkgname-db" 'git' 'cmake' 'boost' 'python' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-recommonmark')
optdepends=(
	'python: python support'
)
provides=("$_pkgname=$pkgver" 'libtrellis.so' 'pytrellis.so')
conflicts=("$_pkgname")
replaces=('trellis-git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S "$_pkgname/libtrellis" -B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None
	make -C build

	make -C "$_pkgname/docs" html
}

package() {
	make -C build DESTDIR="$pkgdir" install

	rmdir "$pkgdir/usr/share/trellis/database/"

	cd "$_pkgname"

	install -dm 755 "$pkgdir/usr/share/doc/$pkgname"
	cp -r --no-preserve=ownership docs/_build/* "$pkgdir/usr/share/doc/$pkgname/"
	rm -rf "$pkgdir/usr/share/doc/$pkgname/html/.doctrees"

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

	# used by the examples to convert the bitstreams to SVF files for programming
	install -D tools/bit_to_svf.py "$pkgdir/usr/share/trellis/tools/bit_to_svf.py"
}
