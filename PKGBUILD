# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor: Ryan Corder <ryanc@greengrey.org>

pkgname=tenshi
pkgver=0.13
pkgrel=1
pkgdesc="real-time log monitor from the Gentoo Linux project"
url="http://dev.inversepath.com/trac/tenshi"
arch=(any)
license=("custom")
depends=('perl' perl-io-bufferedselect)
install="$pkgname.install"
source=(http://dev.inversepath.com/tenshi/$pkgname-$pkgver.tar.gz
        'rc-script'
        'rc-conf'
        'tenshi.install'
        'conf.diff'
        'make.diff')
backup=(etc/tenshi/tenshi.conf etc/conf.d/tenshi)
md5sums=('86233a514b3a6fbc9a76493513119342'
         '94104e395d33c4f72cb6bbfe3591b7a0'
         '302037a01958993b31988d3f50ee20b1'
         'd8a70806f3a2a498d9d8ef2ecb171ad8'
         '451250b1955b14691ca1c7124d1991f2'
         'fb582be4bb1f2840f25a41330a32f692')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	patch -i "$srcdir/make.diff"
	patch -i "$srcdir/conf.diff"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" docdir=/usr/share/doc/tenshi install
	install -Dm644 "$srcdir/rc-conf" "$pkgdir/etc/conf.d/tenshi"
	install -Dm755 "$srcdir/rc-script" "$pkgdir/etc/rc.d/tenshi"
	install -dm755 "$pkgdir/usr/share/licenses/tenshi"
	mv "$pkgdir/usr/share/doc/tenshi/LICENSE" "$pkgdir/usr/share/licenses/tenshi/LICENSE"
	chmod 750 "$pkgdir/etc/tenshi" "$pkgdir/var/lib/tenshi"
}
