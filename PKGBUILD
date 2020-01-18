# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Jesin <Jesin00@gmail.com>

pkgname=libb2
pkgver=0.98.1
pkgrel=1
arch=(i686 x86_64)
pkgdesc='C library providing BLAKE2b, BLAKE2s, BLAKE2bp, BLAKE2sp hash functions'
url=https://blake2.net/
license=(custom:CC0)
depends=(gcc-libs)
source=(https://github.com/BLAKE2/libb2/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('53626fddce753c454a3fea581cbbc7fe9bbcf0bc70416d48fdbbf5d87ef6c72e')

# libb2's build system discards the $CFLAGS variable.
# We can get around this by putting those flags in $CC.
export CC="${CC-cc} $CFLAGS"

prepare() {
	cd "$pkgname-$pkgver"
	autoreconf -fisv
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --disable-static --enable-shared "--build=$CHOST" #--disable-native --enable-fat
	# Uncomment the flags at the end of the previous line if you intend
	# to distribute the binary package to other computers.
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make "DESTDIR=$pkgdir" install
	install -Dm644 "-t$pkgdir/usr/share/licenses/$pkgname" COPYING
}
