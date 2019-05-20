# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=('etesync-server')
pkgver=0.2.0
pkgrel=1
pkgdesc="A self-hostable EteSync server"
arch=(any)
depends=('python-django-cors-headers'
         'python-django-etesync-journal' 
         'python-pytz')
optdepends=('postgresql: storage backend'
            'uwsgi-plugin-python: application container')
url="https://github.com/etesync/server-skeleton"
license=('AGPLv3')
backup=('etc/etesync-server/etesync-server.ini')
options=(!emptydirs)
source=(https://github.com/etesync/server-skeleton/archive/v"$pkgver".tar.gz
        $pkgname.install
        $pkgname.sysusers
        $pkgname)
sha256sums=('435aef6f8f33f82b13dbb99f00c16fa92743194aedb0b4a88ee51001e51244f1'
            '965e5eb9664f7aaf4e071c901d3be9b345b6480846c7146697d945e877a5480e'
            '7363b065206a40e067675d072c5ff269b32704ec89c4eed98e5d3edd71fca122'
            'd695d13c339c72fde298d5f751e99a6f6c4da467692a6c1be352dfe7a9c8791a')
install=$pkgname.install

package() {
	mkdir -p "$pkgdir/etc/etesync-server/"
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

	install -Dm644 "server-skeleton-$pkgver/$pkgname.ini" "$pkgdir/etc/$pkgname/$pkgname.ini"
	sed -i "s@secret.txt@/var/lib/$pkgname/secret.txt@;s@db.sqlite3@/var/lib/$pkgname/db.sqlite3@" "$pkgdir/etc/$pkgname/$pkgname.ini"

	install -Dm644 "server-skeleton-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	mv "server-skeleton-$pkgver/example-configs" "$pkgdir/usr/share/doc/$pkgname/"
	rm -f "server-skeleton-$pkgver/README.md"

	install -Dm644 "server-skeleton-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -f "server-skeleton-$pkgver/LICENSE"

	rm -f "server-skeleton-$pkgver/icon.svg"

	cp -r "server-skeleton-$pkgver" "$pkgdir/usr/lib/$pkgname"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/etesync-server"
}
