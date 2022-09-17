# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Spider.007 <aur@spider007.net>

pkgname=graylog
pkgver=4.3.7
pkgrel=1
pkgdesc='Free and open source log management platform'
arch=('any')
url="https://github.com/graylog2/graylog2-server"
license=('custom:SSPL')
depends=('java-runtime')
optdepends=('elasticsearch<7.11' 'mongodb')
changelog=UPGRADING.md
backup=('etc/graylog/server/server.conf')
source=(
	"$pkgname-$pkgver.tar.gz::https://packages.graylog2.org/releases/$pkgname/$pkgname-${pkgver/_/-}.tgz"
	graylog-tmpfiles.conf
	graylog.service)
sha256sums=('5ee86ef7bf902640b006b2ea65abec1727b96a89b7d0bc497edfe0264436dd13'
            '4d3c0bb83c7a02a5a902670b060d045068f5201728194a4473b2c2ba99bbd43d'
            '42340980c59327d40354863da7431c4f92b45a19cea2cdccf2f2ae26e0adc38c')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 "$pkgname.jar" "$pkgdir/usr/lib/$pkgname/server.jar"
	install -Dm644 plugin/*.jar -t "$pkgdir/usr/lib/$pkgname/plugin/"
	install -Dm644 "$srcdir/$pkgname-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname-server.conf"
	install -Dm644 "$pkgname.conf.example" "$pkgdir/etc/$pkgname/server/server.conf"
	install -Dm644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"

	# make absolute just in case
	sed -i \
		-e 's~^\(plugin_dir =\) plugin$~\1 /usr/lib/graylog/plugin~g' \
		-e 's~^\(message_journal_dir =\) data/journal$~\1 /var/lib/graylog/data/journal~g' \
		-e 's~^\(content_packs_dir =\) data/contentpacks$~\1 /usr/lib/graylog/data/contentpacks~g' \
		"$pkgdir/etc/$pkgname/server/server.conf"
}
