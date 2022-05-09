# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=etebase-server
pkgver=0.8.3
pkgrel=2
pkgdesc="A self-hostable Etebase (EteSync 2.0) server"
arch=(any)
depends=(
	'python-aioredis'
	'python-aiofiles'
	'python-django'
	'python-fastapi'
	'python-pynacl'
	'python-msgpack'
)
optdepends=(
	'postgresql: storage backend'
	'python-daphne: application container'
)
url="https://github.com/etesync/server"
license=('AGPL3')
backup=('etc/etebase-server/etebase-server.ini')
options=(!emptydirs)
source=(https://github.com/etesync/server/archive/v"$pkgver".tar.gz
        $pkgname.sysusers
        $pkgname.tmpfiles
        $pkgname)
sha256sums=('53680e044c976b862f7dacde72402f86bbff3f7a7455ef517f8ad591a42e0944'
            'd42e2518975363aed2900fe4e03eefade98ed9b6f8b8140fd1eddc081d4081e7'
            'f8b9bdbfdd90365a6b463ab2af4320eb2fddb527e6c33d0f02f4f8820864eb43'
            'fb2d4fbec4faf951b0c5df0552eb8afaa8aff85278b43faa018e2e9a77e23591')

package() {
	mkdir -p "$pkgdir/etc/etebase-server/"
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

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
