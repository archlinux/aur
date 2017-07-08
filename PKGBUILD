# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgbase=kibana
pkgname=(kibana kibana-bin)
pkgver=5.5.0
pkgrel=1
pkgdesc="browser based analytics and search dashboard for Elasticsearch"
arch=('any')
url="https://www.elastic.co/products/kibana"
license=('apache')
optdepends=('elasticsearch>=2.4')
backup=('etc/elasticsearch/kibana/kibana.yml')
options=('!strip')
source=(
	"https://artifacts.elastic.co/downloads/$pkgname/$pkgname-$pkgver-linux-x86_64.tar.gz"
	kibana.service)
sha256sums=('8aa30bf3a4a453bdbcfad4e96fabf518b4bff7532a67b8001d3e293fcd625cd2'
            '610c50d38ff0d4cff308b2ff2f38ce3012bf70e396aa25a9b85b821ad3675e3b')

_package() {
	cd "$pkgdir"

	install -dm755 usr/share/kibana
	install -Dm644 "$srcdir/kibana.service" usr/lib/systemd/system/kibana.service
	install -Dm644 "$srcdir"/$pkgbase-$pkgver-linux-x86_64/config/kibana.yml etc/elasticsearch/kibana/kibana.yml

	cp -Rp "$srcdir"/$pkgbase-$pkgver-linux-x86_64/* usr/share/kibana

	chmod -R g+w,o+w usr/share/kibana/{optimize,data}/
}

package_kibana() {
	_package

	pkgdesc="$pkgdesc. Please note; this package replaces the distributed precompiled binary 'node'"
	depends=('nodejs<7')

	rm -R "$pkgdir"/usr/share/kibana/node/
}

package_kibana-bin() {
	_package

	pkgdesc="$pkgdesc. This package uses the precompiled binary 'node'"

	sed -i 's~ExecStart=.*~ExecStart=/usr/share/kibana/bin/kibana --config=/etc/elasticsearch/kibana/kibana.yml~' "$pkgdir"/usr/lib/systemd/system/kibana.service
}
