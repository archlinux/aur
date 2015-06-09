# Maintainer: Spider.007 <aur@spider007.net>
pkgname=graylog
replaces=graylog2-server
pkgver=1.1.0
pkgrel=1
pkgdesc="Graylog is an open source syslog implementation that stores your logs in ElasticSearch and MongoDB"
arch=(any)
url="https://graylog.org/"
license=('GPL')
depends=(java-runtime elasticsearch mongodb)
install=graylog.install
backup=(
	etc/graylog/server/server.conf
)
source=(
	https://packages.graylog2.org/releases/$replaces/$pkgname-$pkgver.tgz
	graylog-tmpfiles.conf
	graylog.service
)
sha256sums=('fb84522daaa8f716c16b4d1e1cbfd391ca9cc6d94f9cfe717dec3083d3aa76b1'
            'SKIP'
            'SKIP')

package() {
	cd "$srcdir/$pkgname-${pkgver}"

	mkdir -p $pkgdir/usr/lib/graylog/{spool,plugin,data/journal}
	chown nobody: -R $pkgdir/usr/lib/graylog/*/

	install -Dm644 graylog.jar "$pkgdir/usr/lib/graylog/server.jar"
	install -Dm644 "$srcdir/graylog-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/graylog-server.conf"
	install -Dm644 "$srcdir/graylog.service" "$pkgdir/usr/lib/systemd/system/graylog.service"

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	cp README.markdown COPYING "$pkgdir/usr/share/doc/$pkgname"

	install -Dm644 graylog.conf.example $pkgdir/etc/graylog/server/server.conf
	sed -i 's/_dir = /_dir = \/usr\/lib\/graylog\//g' $pkgdir/etc/graylog/server/server.conf
}
