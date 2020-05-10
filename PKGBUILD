# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor: Ryan Corder <ryanc@greengrey.org>

pkgname=tenshi
pkgver=0.17
pkgrel=2
pkgdesc="real-time log monitor from the Gentoo Linux project"
url="https://inversepath.com/tenshi.html"
arch=(any)
license=("custom")
depends=('perl' 'perl-io-bufferedselect')
source=("$pkgname-$pkgver.tar.gz::https://github.com/inversepath/tenshi/archive/$pkgver.tar.gz"
        'tenshi.service'
        'tenshi.sysusers'
        'tenshi.tmpfiles'
        'conf.diff')
md5sums=('5ff83250bd5dd8eaf01714e8318ddde8'
         '8c8a582c6a8c61d4ff596ed3af8ab593'
         '19314a464da97b3046a2c7b7c81cd2e6'
         '68aafee3a3c8ea472296408854adac76'
         '451250b1955b14691ca1c7124d1991f2')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	patch -i "$srcdir/conf.diff"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" docdir=/usr/share/doc/tenshi bindir=/usr/bin install
	install -Dm644 "$srcdir/tenshi.service" "$pkgdir/usr/lib/systemd/system/tenshi.service"
	install -Dm644 "$srcdir/tenshi.sysusers" "$pkgdir/usr/lib/sysusers.d/tenshi.conf"
	install -Dm644 "$srcdir/tenshi.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/tenshi.conf"
	install -dm755 "$pkgdir/usr/share/licenses/tenshi"
	mv "$pkgdir/usr/share/doc/tenshi/LICENSE" "$pkgdir/usr/share/licenses/tenshi/LICENSE"

	# Set more secure permissions for configuration via tmpfiles.d
	install -Dm644 "$pkgdir"/{,usr/share/factory/}etc/tenshi/tenshi.conf
	rm -rf "$pkgdir"/{etc,var}
}
