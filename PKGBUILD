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
sha256sums=('9b7e72b6496e2f6abd77d1dd3c4c6b77bdce61ca5531f9f1c62376b020904db7'
            'e4ed6b3ec69e4f0f3011b5ddb6bb8888814be25ef110099c16a1281ba63fc3ad'
            'a4909d42e2e7df439af60e3d9967eabe4575c1e2788accd24d6269c698f359c5'
            'dddb7e52546e5a58d809cbb8214f02c2e5a6c931a622b9cfc26f462481525ac9'
            '9a7126e868ba985a935512b43f699033dd068d8c436d22374ec02d3830dc2159')

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
