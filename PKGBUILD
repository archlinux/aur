# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=('etesync-server')
pkgver=0.1.0
pkgrel=3
pkgdesc="A self-hostable EteSync server"
arch=(any)
depends=('python-django'
         'python-django-cors-headers' 
         'python-django-etesync-journal' 
         'python-django-rest-framework' 
         'python-drf-nested-routers' 
         'python-pytz')
optdepends=('postgresql: storage backend'
            'uwsgi-plugin-python: application container')
url="https://github.com/etesync/server-skeleton"
license=('AGPLv3')
backup=('usr/share/etesync-server/etesync_server/settings.py')
options=(!emptydirs)
source=('https://github.com/etesync/server-skeleton/archive/v0.1.0.tar.gz'
        $pkgname.install
        $pkgname.sysusers
        $pkgname)
sha256sums=('9ab6ac6d3517023ad6702843e855dc2f89edf32388a058439d6248c2d6f1ae52'
            '8737998b58b9a101f33e911e4f1f413399a0bfa6b72533ddf00eb7dd963e8ddd'
            '7363b065206a40e067675d072c5ff269b32704ec89c4eed98e5d3edd71fca122'
            'd822ce24a223016f4576ea46c86d912721eb423ebc6c54f0db5f0c9cff1613e7')
install=$pkgname.install

package() {
	mkdir -p "$pkgdir/etc/etesync-server/"
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share"
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

	install -Dm644 "server-skeleton-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	rm -f "server-skeleton-$pkgver/README.md"
	install -Dm644 "server-skeleton-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -f "server-skeleton-$pkgver/LICENSE"
	rm -f "server-skeleton-$pkgver/icon.svg"
	rm -rf "server-skeleton-$pkgver/example-configs"
	cp -a "server-skeleton-$pkgver" "$pkgdir/usr/share/$pkgname" 
	sed -i 's@SECRET_FILE = os.path.join(BASE_DIR, "secret.txt")@SECRET_FILE = os.path.join("/etc/etesync-server/", "secret.txt")@' "$pkgdir/usr/share/$pkgname/etesync_server/settings.py"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/etesync-server"
}
