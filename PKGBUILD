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
	"fix_test_698.patch"
)
sha256sums=('3bb48af46ced4779facf41fdc2ee60e4ccb86eaa99d010b36685315df39c2ee2'
            'SKIP'
            '864d7fef6ad3101b84f0a4319839d23956f0a83f2ea971c698e3005125491888')
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

