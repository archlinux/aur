# Maintainer: Bill Ruddock <https://github.com/biinari>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>
# Refactored by Blaž "Speed" Hrastnik <https://github.com/archSeer>

_pkgname=elasticsearch
pkgname=elasticsearch5
pkgver=5.6.9
pkgrel=1
pkgdesc="Distributed RESTful search engine built on top of Lucene"
arch=('any')
url="https://www.elastic.co/products/elasticsearch"
license=('APACHE')
depends=('java-runtime-headless=8' 'systemd')
conflicts=('elasticsearch')
provides=("elasticsearch=$pkgver")
install='elasticsearch.install'
source=(
  "https://artifacts.elastic.co/downloads/$_pkgname/$_pkgname-$pkgver.tar.gz"
  elasticsearch.service
  elasticsearch@.service
  elasticsearch-sysctl.conf
  elasticsearch-user.conf
  elasticsearch-tmpfile.conf
  elasticsearch.default
)
sha256sums=('64b9486d5bdeb6f85d09fdc30aa2d0e1ce7fb8f253084a8d7cb15652494da96a'
            'f228b588345780cfc84c229dd92722e024c0da155976afc96fc5e5970428a9e4'
            '4dc14262b67399f741c303cce7d18f9d3d220285778a2deb50fb0640161179c7'
            'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
            '815f6a39db6f54bb40750c382ffbdc298d2c4c187ee8ea7e2f855923e2ff354b'
            '3173e3efa429507e6329f518699a072dfd442d9b5da7c62452a55f82334dd2b5'
            'bb74e5fb8bc28f2125e015395ab05bea117b72bfc6dadbca827694b362ee0bf8')

backup=('etc/elasticsearch/elasticsearch.yml'
        'etc/elasticsearch/log4j2.properties'
        'etc/elasticsearch/jvm.options'
        'etc/default/elasticsearch')

prepare() {
  cd "$srcdir"/$_pkgname-$pkgver

  for script in elasticsearch{,-plugin,-translog}; do
    sed -e 's|^ES_HOME=.*dirname.*|ES_HOME=/usr/share/elasticsearch|' \
        -e '/^ES_HOME=.*pwd/d' \
        -e 's|$ES_HOME/config|/etc/elasticsearch|' \
        -i bin/$script
  done

  sed -re 's;#\s*(path\.conf:).*$;\1 /etc/elasticsearch;' \
    -e '0,/#\s*(path\.data:).*$/s;;\1 /var/lib/elasticsearch;' \
    -e 's;#\s*(path\.work:).*$;\1 /tmp/elasticsearch;' \
    -e 's;#\s*(path\.logs:).*$;\1 /var/log/elasticsearch;' \
    -i config/elasticsearch.yml
}

package() {
  cd "$pkgdir"
  install -dm750 etc/elasticsearch/scripts
  install -dm755 usr/share/elasticsearch/plugins
  install -dm755 var/lib/elasticsearch
  install -dm755 var/log/elasticsearch

  install -Dm644 "$srcdir"/elasticsearch.service usr/lib/systemd/system/elasticsearch.service
  install -Dm644 "$srcdir"/elasticsearch@.service usr/lib/systemd/system/elasticsearch@.service
  install -Dm644 "$srcdir"/elasticsearch-user.conf usr/lib/sysusers.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch-tmpfile.conf usr/lib/tmpfiles.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch-sysctl.conf usr/lib/sysctl.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch.default etc/default/elasticsearch

  cd "$srcdir"/$_pkgname-$pkgver
  cp -R lib modules "$pkgdir"/usr/share/elasticsearch/

	cd config
	for conf in *; do
		install -Dm644 "$conf" "$pkgdir/etc/elasticsearch/$conf"
	done
	cd ..

  for script in elasticsearch{,-plugin,-translog}; do
    install -Dm755 bin/$script "$pkgdir"/usr/bin/$script
  done
  install -Dm644 bin/elasticsearch.in.sh "$pkgdir"/usr/share/elasticsearch/bin/elasticsearch.in.sh
}
