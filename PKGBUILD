# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=deheader
pkgver=1.6
pkgrel=3
pkgdesc='Find and optionally remove unneeded includes in C or C++ source files'
arch=('any')
url='http://www.catb.org/~esr/deheader/'
license=('BSD')
depends=('python')
source=("$url/$pkgname-$pkgver.tar.gz" 'deheader_use-system-python.patch')
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('8278d845bf618aabe1fb1da77fb99f6de5efe76a8bd8ae12da0327c0e4df184b7c4d50b2ac2be4a3dd271b8b010818fef83cd80d81f2be2b04bd09e2fee1cea3'
            'e864cd32dca820844c5d4a0ff4f15f18bf7be53231daba54111ea914cbd594f9d0244e4ec05cf806ef85a86662ce434acc41ace97106e846ddb7409be793a0d3')

prepare() {
	# Invalid hardlink in release tarball leads to bsdtar errors during extraction
	# (https://gitlab.com/esr/deheader/issues/7)
	bsdtar --extract -s '|deheader-1.6/deheader.1||R' --file "$pkgname-$pkgver.tar.gz"

	cd "$pkgname-$pkgver"
	patch --strip=1 --input="$srcdir/deheader_use-system-python.patch"
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 deheader -t "$pkgdir/usr/bin"
	install -Dm644 deheader.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
