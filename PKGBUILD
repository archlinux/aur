# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=kibana
pkgver=4.4.0
pkgrel=3
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
sha256sums=('a8aeb7c2562c46e26a6841b7c359e90eaf1a7a1964a89466c73002dad022dc43'
			'SKIP')

package() {
	cd "$srcdir/`basename ${source[0]%.tar.gz}`"

	mkdir -p $pkgdir/usr/lib/kibana/
	install -Dm644 "$srcdir/kibana.service" "$pkgdir/usr/lib/systemd/system/kibana.service"
	install -Dm644 "config/kibana.yml" "$pkgdir/etc/elasticsearch/kibana/kibana.yml"
	touch /tmp/.babelcache.json
	install -Dm644 -o nobody /tmp/.babelcache.json $pkgdir/usr/lib/kibana/optimize/.babelcache.json

	rm -R ./node/
	chmod +r -R src/
	find src -type d -exec chmod +x {} \;
	cp -Rp * "$pkgdir/usr/lib/kibana/"
}
