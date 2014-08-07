# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor: Ryan Corder <ryanc@greengrey.org>

pkgname=tenshi
pkgver=0.15
pkgrel=1
pkgdesc="real-time log monitor from the Gentoo Linux project"
url="http://dev.inversepath.com/trac/tenshi"
arch=(any)
license=("custom")
depends=('perl' 'perl-io-bufferedselect')
install="$pkgname.install"
source=("http://dev.inversepath.com/tenshi/$pkgname-$pkgver.tar.gz"
        'tenshi.install'
        'tenshi.service'
        'conf.diff')
backup=(etc/tenshi/tenshi.conf)
md5sums=('3eb858893e29f0f6e7fb9f58f653a5b1'
         'd8a70806f3a2a498d9d8ef2ecb171ad8'
         '8c8a582c6a8c61d4ff596ed3af8ab593'
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
	install -dm755 "$pkgdir/usr/share/licenses/tenshi"
	mv "$pkgdir/usr/share/doc/tenshi/LICENSE" "$pkgdir/usr/share/licenses/tenshi/LICENSE"
	chmod 750 "$pkgdir/etc/tenshi" "$pkgdir/var/lib/tenshi"
}
