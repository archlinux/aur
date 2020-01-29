# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=('etesync-server')
pkgver=0.3.0
pkgrel=1
pkgdesc="A self-hostable EteSync server"
arch=(any)
depends=('python-django-cors-headers'
         'python-django-etesync-journal' 
         'python-pytz')
optdepends=('postgresql: storage backend'
            'uwsgi-plugin-python: application container')
url="https://github.com/etesync/server"
license=('AGPLv3')
backup=('etc/etesync-server/etesync-server.ini')
options=(!emptydirs)
source=(https://github.com/etesync/server/archive/v"$pkgver".tar.gz
        $pkgname.install
        $pkgname.sysusers
        $pkgname)
sha256sums=('d0728effa898a8b7afb4ce7439e0d0fd46bc819008925f21788d7e113435b579'
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

	install -Dm644 "server-$pkgver/$pkgname.ini.example" "$pkgdir/etc/$pkgname/$pkgname.ini"
	sed -i "s@secret.txt@/var/lib/$pkgname/secret.txt@;s@db.sqlite3@/var/lib/$pkgname/db.sqlite3@" "$pkgdir/etc/$pkgname/$pkgname.ini"

	install -Dm644 "server-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	mv "server-$pkgver/example-configs" "$pkgdir/usr/share/doc/$pkgname/"
	rm -f "server-$pkgver/README.md"

	install -Dm644 "server-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -f "server-$pkgver/LICENSE"

	rm -f "server-$pkgver/icon.svg"

	cp -r "server-$pkgver" "$pkgdir/usr/lib/$pkgname"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/etesync-server"
}
