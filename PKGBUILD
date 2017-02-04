# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>
# Refactored by Blaž "Speed" Hrastnik <https://github.com/archSeer>

_pkgname=elasticsearch
pkgname=elasticsearch17
pkgver=1.7.6
pkgrel=1
pkgdesc="Distributed RESTful search engine built on top of Lucene (1.7.x)"
arch=('i686' 'x86_64')
url="https://www.elastic.co/products/elasticsearch"
license=('APACHE')
depends=('java-runtime-headless' 'systemd')
conflicts=('elasticsearch')
provides=("elasticsearch=$pkgver")
install='elasticsearch.install'
source=(
  "http://download.elasticsearch.org/$_pkgname/$_pkgname/$_pkgname-$pkgver.tar.gz"
  elasticsearch.service
  elasticsearch@.service
  elasticsearch-sysctl.conf
  elasticsearch-user.conf
  elasticsearch-tmpfile.conf
  elasticsearch.default
)
sha256sums=('78affc30353730ec245dad1f17de242a4ad12cf808eaa87dd878e1ca10ed77df'
            '8f1b4f6e22b472a4f4e711f010d6733a06935b46bb7314360f27c2ab506d6e46'
            '7c1e06cdf838b5ad090e0463de5dab3e8d62f0d7e6ac04e0b0049a4007dee612'
            'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
            'a76c03afe30dc3434bf55b5b50f0867c3670dcaebcc8b522f42277ff523b7277'
            '39ab5801b45c0f49af43c4d1826a655a981bfa07e4b3791d7a0719f8c191d8d9'
            'bb74e5fb8bc28f2125e015395ab05bea117b72bfc6dadbca827694b362ee0bf8')

backup=('etc/elasticsearch/elasticsearch.yml'
        'etc/elasticsearch/logging.yml'
        'etc/default/elasticsearch')

prepare() {
  cd "$srcdir"/$_pkgname-$pkgver

  for script in plugin elasticsearch; do
    sed 's|^ES_HOME=.*dirname.*|ES_HOME=/usr/share/elasticsearch|' \
      -i bin/$script
  done

  sed 's|$ES_HOME/lib|/usr/lib/elasticsearch|g' -i bin/elasticsearch.in.sh bin/plugin

  echo -e '\nJAVA_OPTS="$JAVA_OPTS -Des.path.conf=/etc/elasticsearch"' >> bin/elasticsearch.in.sh

  sed -re 's;#\s*(path\.conf:).*$;\1 /etc/elasticsearch;' \
    -e '0,/#\s*(path\.data:).*$/s;;\1 /var/lib/elasticsearch;' \
    -e 's;#\s*(path\.work:).*$;\1 /tmp/elasticsearch;' \
    -e 's;#\s*(path\.logs:).*$;\1 /var/log/elasticsearch;' \
    -i config/elasticsearch.yml
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  install -dm755 "$pkgdir"/etc/elasticsearch

  if [ $CARCH = 'x86_64' ]; then
    install -Dm644 lib/sigar/libsigar-amd64-linux.so "$pkgdir"/usr/lib/elasticsearch/sigar/libsigar-amd64-linux.so
  else
    install -Dm644 lib/sigar/libsigar-x86-linux.so "$pkgdir"/usr/lib/elasticsearch/sigar/libsigar-x86-linux.so
  fi
  cp lib/sigar/sigar*.jar "$pkgdir"/usr/lib/elasticsearch/sigar/
  cp lib/*.jar "$pkgdir"/usr/lib/elasticsearch/

  cp config/* "$pkgdir"/etc/elasticsearch/

  install -Dm755 bin/elasticsearch "$pkgdir"/usr/bin/elasticsearch
  install -Dm755 bin/plugin "$pkgdir"/usr/bin/elasticsearch-plugin
  install -Dm644 bin/elasticsearch.in.sh "$pkgdir"/usr/share/elasticsearch/elasticsearch.in.sh

  install -Dm644 "$srcdir"/elasticsearch.service "$pkgdir"/usr/lib/systemd/system/elasticsearch.service
  install -Dm644 "$srcdir"/elasticsearch@.service "$pkgdir"/usr/lib/systemd/system/elasticsearch@.service
  install -Dm644 "$srcdir"/elasticsearch-user.conf "$pkgdir"/usr/lib/sysusers.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch-tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch-sysctl.conf "$pkgdir"/usr/lib/sysctl.d/elasticsearch.conf

  install -Dm644 "$srcdir"/elasticsearch.default "$pkgdir"/etc/default/elasticsearch

  ln -s ../../../var/lib/elasticsearch "$pkgdir"/usr/share/elasticsearch/data

  chown -R 114:114 "$pkgdir"/usr/share/elasticsearch
}
