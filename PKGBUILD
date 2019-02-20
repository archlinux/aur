# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=peertube
pkgver=1.2.1
_pkgver=1.2.1
pkgrel=2
pkgdesc="Federated (ActivityPub) video streaming platform using P2P (BitTorrent) directly in the web browser with WebTorrent and Angular."
arch=("x86_64")
depends=("nodejs-lts-carbon" "ffmpeg" "postgresql" "openssl" "redis" "npm")
makedepends=("yarn" "npm" "python2" "git")
url="https://joinpeertube.org/"
license=("AGPL")
backup=('etc/peertube/production.yaml')
install=$pkgname.install
source=("https://github.com/Chocobozzz/PeerTube/releases/download/v$_pkgver/$pkgname-v$_pkgver.zip"
		"$pkgname.install"
		"$pkgname.sysusers"
		"$pkgname")
sha256sums=('c7bb269861e22d2e359d284edfd9ad547a78e41bf46c668f0f2340c03af21ed5'
            'f2ce66e100c213b3db7e2f65e8678d06e5d5c37c4ac06ba5cde673a7e9e058cb'
            '61683c744a60f4e0ef43607b25db3173a9d070ad0b9cf6ab50e79825ae365a92'
            '6376f2aaafa826188ecd58097e31b70c35b597745bb90fb3a5e534af8196caca')

build() {
	cd "$pkgname-v$_pkgver"
	yarn install --production --pure-lockfile
}

package() {
	install -d "$pkgdir/usr/share/webapps"
	install -d "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

	install -Dm644 "$pkgname-v$_pkgver/config/production.yaml.example" "$pkgdir/etc/$pkgname/production.yaml"
	sed -i  "s@/var/www/$pkgname@/var/lib/$pkgname@g" "$pkgdir/etc/$pkgname/production.yaml"

	install -Dm644 "$pkgname-v$_pkgver/CREDITS.md" "$pkgdir/usr/share/doc/$pkgname/CREDITS"
	install -Dm644 "$pkgname-v$_pkgver/FAQ.md" "$pkgdir/usr/share/doc/$pkgname/FAQ.md"
	install -Dm644 "$pkgname-v$_pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	cp -a "$pkgname-v$_pkgver/support/doc" "$pkgdir/usr/share/doc/$pkgname"

	install -Dm644 "$pkgname-v$_pkgver/support/systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	sed -i "s@redis-server@redis@;s@/var/www/$pkgname/config@/etc/$pkgname@;s@/var/www/$pkgname/$pkgname-latest@/usr/share/webapps/$pkgname@;s@ProtectSystem=full@ProtectSystem=true@" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$pkgname-v$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	rm -rf "$pkgname-v$_pkgver"/{config,*.md,LICENSE}
	cp -a "$pkgname-v$_pkgver" "$pkgdir/usr/share/webapps/$pkgname"
}
