# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>
# Contributor: Gromit <gromit@archlinux.org>

pkgname=gnucobol
pkgver=3.2
pkgdesc="A free, open source and modern COBOL compiler"
pkgrel=8
arch=("x86_64")
url="https://www.gnu.org/software/gnucobol/"
license=("GPL-3.0-only AND LGPL-3.0")
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

	# The FORTIFY_SOURCE=3 flag from /etc/makepkg.conf causes the 'make tests' to fail.
	# FORTIFY_SOUCE=2 is what is used by upstream, so:
	# Remove any non-2 FORTIFY_SOURCE definitions from the system's CFLAGS
	CFLAGS="${CFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}"
	CFLAGS="${CFLAGS//-Wp,-D_FORTIFY_SOURCE=1/}"
	CFLAGS="${CFLAGS//-D_FORTIFY_SOURCE=3/}"
	CFLAGS="${CFLAGS//-D_FORTIFY_SOURCE=1/}"
	# And add the FORTIFY_SOURCE=2 flag
	CFLAGS="$CFLAGS -D_FORTIFY_SOURCE=2"

	# Until code is fixed, we need to set the C language standard to GNU C17, and also add the following CFLAGs:
	./configure \
		CC="gcc -std=gnu17" \
		CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types" \
		--prefix=/usr \
		--infodir=/usr/share/info \
		--enable-hardening \
		--enable-static=no \
		--with-db \
		--with-json=json-c \
		--with-xml2
	make -j1
}

check() {
	cd "$srcdir/$pkgname-$pkgver"

	# make check CFLAGS="%optflags -O" || make check TESTSUITEFLAGS="--recheck --verbose" || echo "Warning, unexpected results"

	# The test suite must succeed. However,
	# Test 0843 will fail due to system CFLAGS with hardening. Cf.: https://lists.gnu.org/archive/html/bug-gnucobol/2024-08/msg00001.html
	# If you run the test suite, you should see that only 1 test fails: 0843.
#	make -j1 check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

	# documentation
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	for f in README README.md; do
		cp $f "$pkgdir/usr/share/doc/$pkgname/$f"
	done

	# license for everything except $srcdir/lib and $srcdir/libcob
	install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
	# license for everything inside $srcdir/lib and $srcdir/libcob
	install -Dm644 COPYING.LESSER -t "$pkgdir"/usr/share/licenses/$pkgname
}

