# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=kibana
pkgver=4.4.1
pkgrel=1
pkgdesc="browser based analytics and search dashboard for Elasticsearch. Please note; this package replaces the distributed precompiled binary 'node'"
arch=('any')
url="https://www.elastic.co/products/kibana"
license=('apache')
depends=('nodejs')
optdepends=('elasticsearch>=2.2')
backup=('etc/elasticsearch/kibana/kibana.yml')
install=kibana.install
source=(
	"https://download.elasticsearch.org/kibana/kibana/$pkgname-$pkgver-linux-x64.tar.gz"
	kibana.service)
sha256sums=('fb536696b27b9807507c5d9014c90722e7b28cb2e068a80879cc9bb861316be1'
			'SKIP')

package() {
	cd "$srcdir/`basename ${source[0]%.tar.gz}`"

	mkdir -p $pkgdir/usr/lib/kibana/
	install -Dm644 "$srcdir/kibana.service" "$pkgdir/usr/lib/systemd/system/kibana.service"
	install -Dm644 "config/kibana.yml" "$pkgdir/etc/elasticsearch/kibana/kibana.yml"
	touch $srcdir/.babelcache.json
	install -Dm644 -o nobody $srcdir/.babelcache.json $pkgdir/usr/lib/kibana/optimize/.babelcache.json

	rm -R ./node/
	chmod +r -R src/
	find src -type d -exec chmod +x {} \;
	cp -Rp * "$pkgdir/usr/lib/kibana/"
}
