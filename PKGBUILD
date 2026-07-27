# Maintainer: Klaus Tachtler <klaus@tachtler.net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Spider.007 <aur@spider007.net>

pkgname=graylog
pkgver=7.1.6
pkgrel=1
pkgdesc='Free and open source log management platform'
arch=('any')
url="https://github.com/graylog2/graylog2-server"
license=('custom:SSPL')
depends=('java-runtime>=21')
optdepends=('mongodb-bin' 'mongodb-tools-bin' 'opensearch>1.1' 'opensearch<=2.19.5')
changelog=UPGRADING.md
backup=('etc/graylog/server/server.conf')
install=graylog.install
source=(
	"$pkgname-$pkgver.tar.gz::https://packages.graylog2.org/releases/$pkgname/$pkgname-${pkgver/_/-}.tgz"
	graylog-tmpfiles.conf
	graylog.service)
sha256sums=('3c38dd7b9cd0bd994066d390b3e8f3ef72aec802f540b5e1b8068f963e33d14a'
            'c29ccbf1fc25f6d00afd520811c3aab4b6adcb4d12bb4686400adeb0b040409a'
            'fc94037dd0c40999c7316b8347259b5de56414bc0849248fb52959c00c98e506')

package() {
	cd "$pkgname-$pkgver"
	install -Dvm644 "$pkgname.jar" "$pkgdir/usr/lib/$pkgname/server.jar"
	install -Dvm644 plugin/*.jar -t "$pkgdir/usr/lib/$pkgname/plugin/"
	install -Dvm644 "$srcdir/$pkgname-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname-server.conf"
	install -Dvm644 "$pkgname.conf.example" "$pkgdir/etc/$pkgname/server/server.conf"
	install -Dvm644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"

	# make absolute just in case
	sed -i \
		-e 's~^\(plugin_dir =\) plugin$~\1 /usr/lib/graylog/plugin~g' \
		-e 's~^\(message_journal_dir =\) data/journal$~\1 /var/lib/graylog/data/journal~g' \
		-e 's~^\(content_packs_dir =\) data/contentpacks$~\1 /usr/lib/graylog/data/contentpacks~g' \
		"$pkgdir/etc/$pkgname/server/server.conf"
}
