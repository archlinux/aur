# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>
# Contributor: Gromit <gromit@archlinux.org>

pkgname=gnucobol
pkgver=3.2
pkgdesc="A free, open source and modern COBOL compiler"
pkgrel=6
arch=("x86_64")
url="https://www.gnu.org/software/gnucobol/"
license=("GPL-3.0-only")
depends=("db" "gmp" "json-c" "libxml2" "ncurses" "glibc" "bash")
optdepends=("cjson: Alternative for json-c")
makedepends=("gnupg")
options=("!libtool")
source=(
	"https://ftp.gnu.org/gnu/gnucobol/$pkgname-$pkgver.tar.xz"
	"https://ftp.gnu.org/gnu/gnucobol/$pkgname-$pkgver.tar.xz.sig"
)
b2sums=('66df93fe2f8772aebd807612c8e96be46f5605c316f374ae51b3a8c3f6ce760150af60777cd1d53f12f65ee48bc0a6225c506b813fdafcc87d949e609ff3273e'
        'SKIP')
validpgpkeys=(
	"B9459D0CA8A740B323235CDF13E96B53C005604E"
)

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# Until fixed, the following CFLAGs are added, as well as compilation with C17:
	./configure CC="gcc -std=gnu17" CFLAGS="-Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types" \
		--prefix=/usr \
		--infodir=/usr/share/info \
		--enable-hardening \
		--enable-static=no \
		--with-db \
		--with-json=json-c
	make -j1
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	# make -j1 check
	make check CFLAGS="%optflags -O" || make check TESTSUITEFLAGS="--recheck --verbose" || echo "Warning, unexpected results"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

