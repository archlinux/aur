# Maintainer: Atte Lautanala <atte dot lautanala at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>
# Refactored by Blaž "Speed" Hrastnik <https://github.com/archSeer>

_pkgname=elasticsearch
pkgname=elasticsearch2
pkgver=2.4.6
pkgrel=1
pkgdesc="Distributed RESTful search engine built on top of Lucene"
arch=('any')
url="https://www.elastic.co/products/elasticsearch"
license=('APACHE')
depends=('java-runtime-headless' 'systemd')
conflicts=('elasticsearch')
provides=("elasticsearch=$pkgver")
install='elasticsearch.install'
source=(
  "http://download.elasticsearch.org/$_pkgname/release/org/$_pkgname/distribution/tar/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz"
  elasticsearch.service
  elasticsearch@.service
  elasticsearch-sysctl.conf
  elasticsearch-user.conf
  elasticsearch-tmpfile.conf
  elasticsearch.default
)
sha256sums=('5f7e4bb792917bb7ffc2a5f612dfec87416d54563f795d6a70637befef4cfc6f'
            '339a16452c89d55dba3c693e5979fd331981e79decc5eceb2e9be25670d946d9'
            '5705be6546922d5c0c7aded3b839af25b369ace2af7024ea11e2bce9426ae2f6'
            'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
            '815f6a39db6f54bb40750c382ffbdc298d2c4c187ee8ea7e2f855923e2ff354b'
            '6578cacc9fdbdf4713e9f607710701edcd46b026e99743af0fbb63e177eed9b1'
            'bb74e5fb8bc28f2125e015395ab05bea117b72bfc6dadbca827694b362ee0bf8')

backup=('etc/elasticsearch/elasticsearch.yml'
        'etc/elasticsearch/logging.yml'
        'etc/default/elasticsearch')

prepare() {
  cd "$srcdir"/$_pkgname-$pkgver

  for script in plugin elasticsearch; do
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
  cp config/* "$pkgdir"/etc/elasticsearch/

  install -Dm755 bin/elasticsearch "$pkgdir"/usr/bin/elasticsearch
  install -Dm755 bin/plugin "$pkgdir"/usr/bin/elasticsearch-plugin
  install -Dm644 bin/elasticsearch.in.sh "$pkgdir"/usr/share/elasticsearch/bin/elasticsearch.in.sh
}
