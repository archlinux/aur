# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=etebase-server
pkgver=0.6.1
pkgrel=1
pkgdesc="A self-hostable Etebase (EteSync 2.0) server"
arch=(any)
depends=('python-django'
         'python-django-rest-framework'
         'python-drf-nested-routers'
         'python-django-cors-headers'
         'python-pynacl'
         'python-msgpack'
         'python-pytz')
optdepends=('postgresql: storage backend'
            'python-daphne: application container')
url="https://github.com/etesync/server"
license=('AGPLv3')
backup=('etc/etebase-server/etebase-server.ini')
options=(!emptydirs)
source=(https://github.com/etesync/server/archive/v"$pkgver".tar.gz
        $pkgname.install
        $pkgname.sysusers
        $pkgname)
sha256sums=('4832c35fa1b46936bfde894a8c888989e9a37dd64ca588df22524825f3e568ec'
            '22ecfe8c6df3fe615a90db03afbdbc53c0c46cb9546eb61ca433392587725b41'
            'd42e2518975363aed2900fe4e03eefade98ed9b6f8b8140fd1eddc081d4081e7'
            'fb2d4fbec4faf951b0c5df0552eb8afaa8aff85278b43faa018e2e9a77e23591')
install=$pkgname.install

package() {
	mkdir -p "$pkgdir/etc/etebase-server/"
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
	chmod +x "$pkgdir/usr/bin/etebase-server"
}
