# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=peertube
pkgver=1.0.0_beta.9
_pkgver=1.0.0-beta.9
pkgrel=2
pkgdesc="Federated (ActivityPub) video streaming platform using P2P (BitTorrent) directly in the web browser with WebTorrent and Angular."
arch=("x86_64")
depends=("nodejs-lts-carbon" "ffmpeg" "postgresql" "openssl" "redis")
makedepends=("yarn" "npm" "python2" "git")
url="https://joinpeertube.org/"
license=("AGPL")
backup=('etc/peertube/production.yaml')
install=$pkgname.install
source=("https://github.com/Chocobozzz/PeerTube/releases/download/v$_pkgver/$pkgname-v$_pkgver.zip"
        "$pkgname.install")
sha256sums=("c140fd5cc1ea1a6b142afd81b741a0dbe20d4720d3473701ac11fa5024ef4108"
"d4c5c6d5de78af18bc4d9c090950b0ad71ae056ed85992baee66dcd21600a51a")

build() {
        cd "$pkgname-v$_pkgver"
        yarn install --production --pure-lockfile
}

package() {
	install -d "$pkgdir/usr/share/webapps"
	install -d "$pkgdir/usr/share/doc/$pkgname"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -d "$pkgdir/var/lib/$pkgname"

	install -Dm644 "$pkgname-v$_pkgver/config/production.yaml.example"  "$pkgdir/etc/$pkgname/production.yaml"
	sed -i  "s@/var/www/$pkgname@/var/lib/$pkgname@g" "$pkgdir/etc/$pkgname/production.yaml"

	cp -a "$pkgname-v$_pkgver/support/doc"  "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 "$pkgname-v$_pkgver/CREDITS.md" "$pkgdir/usr/share/doc/$pkgname/CREDITS"
	install -Dm644 "$pkgname-v$_pkgver/FAQ.md" "$pkgdir/usr/share/doc/$pkgname/FAQ.md"
	install -Dm644 "$pkgname-v$_pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dm644 "$pkgname-v$_pkgver/support/systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	sed -i  "s@/var/www/$pkgname/config@/etc/$pkgname@;s@/var/www/$pkgname/$pkgname-latest@/usr/share/webapps/$pkgname@g" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$pkgname-v$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	rm -rf "$pkgname-v$_pkgver"/{config,*.md,LICENSE}
	cp -a "$pkgname-v$_pkgver" "$pkgdir/usr/share/webapps/$pkgname"
}
sha256sums=('bc9b1fcae47dc37fd00dbe91518d7723a0d0e4fb929371df7ee1108f48a9c816'
            'd4c5c6d5de78af18bc4d9c090950b0ad71ae056ed85992baee66dcd21600a51a')
