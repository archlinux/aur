# Maintainer: Tung Ha <tunght13488 PLUS archlinux AT gmail DOT com>
# Contributor: Bill Ruddock <https://github.com/biinari>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>
# Contributor: Blaž "Speed" Hrastnik <https://github.com/archSeer>

_pkgname=elasticsearch
pkgname=elasticsearch5-noconflict
pkgver=5.6.9
pkgrel=2
pkgdesc="Distributed RESTful search engine built on top of Lucene"
arch=('any')
url="https://www.elastic.co/products/elasticsearch"
license=('APACHE')
depends=('java-runtime-headless=8' 'systemd')
provides=("elasticsearch=$pkgver")
install='elasticsearch5.install'
source=(
  "https://artifacts.elastic.co/downloads/$_pkgname/$_pkgname-$pkgver.tar.gz"
  elasticsearch5.service
  elasticsearch5@.service
  elasticsearch5-sysctl.conf
  elasticsearch5-user.conf
  elasticsearch5-tmpfile.conf
  elasticsearch5.default
)
sha256sums=('64b9486d5bdeb6f85d09fdc30aa2d0e1ce7fb8f253084a8d7cb15652494da96a'
            '645b819bc01652d483202f76f42c0c0d5929c55e28492ad743caeb16087cc537'
            'e54f7857cfdaf7bc8d28f081864c363634e2e3d4e603c146b298bfe3c430d7ad'
            'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
            '815f6a39db6f54bb40750c382ffbdc298d2c4c187ee8ea7e2f855923e2ff354b'
            '19fb0e711354d014473dadb0cf37117ab7557887443177de0d091f5991a9376c'
            'bb74e5fb8bc28f2125e015395ab05bea117b72bfc6dadbca827694b362ee0bf8')

backup=('etc/elasticsearch5/elasticsearch.yml'
        'etc/elasticsearch5/log4j2.properties'
        'etc/elasticsearch5/jvm.options'
        'etc/default/elasticsearch5')

prepare() {
  cd "$srcdir"/$_pkgname-$pkgver

  for script in elasticsearch{,-plugin,-translog}; do
    sed -e 's|^ES_HOME=.*dirname.*|ES_HOME=/usr/share/elasticsearch5|' \
        -e '/^ES_HOME=.*pwd/d' \
        -e 's|$ES_HOME/config|/etc/elasticsearch5|' \
        -i bin/$script
  done

  sed -re 's;#\s*(path\.conf:).*$;\1 /etc/elasticsearch5;' \
    -e '0,/#\s*(path\.data:).*$/s;;\1 /var/lib/elasticsearch5;' \
    -e 's;#\s*(path\.work:).*$;\1 /tmp/elasticsearch5;' \
    -e 's;#\s*(path\.logs:).*$;\1 /var/log/elasticsearch5;' \
    -i config/elasticsearch.yml
}

package() {
  cd "$pkgdir"
  install -dm750 etc/elasticsearch5/scripts
  install -dm755 usr/share/elasticsearch5/plugins
  install -dm755 var/lib/elasticsearch5
  install -dm755 var/log/elasticsearch5

  install -Dm644 "$srcdir"/elasticsearch5.service usr/lib/systemd/system/elasticsearch5.service
  install -Dm644 "$srcdir"/elasticsearch5@.service usr/lib/systemd/system/elasticsearch5@.service
  install -Dm644 "$srcdir"/elasticsearch5-user.conf usr/lib/sysusers.d/elasticsearch5.conf
  install -Dm644 "$srcdir"/elasticsearch5-tmpfile.conf usr/lib/tmpfiles.d/elasticsearch5.conf
  install -Dm644 "$srcdir"/elasticsearch5-sysctl.conf usr/lib/sysctl.d/elasticsearch5.conf
  install -Dm644 "$srcdir"/elasticsearch5.default etc/default/elasticsearch5

  cd "$srcdir"/$_pkgname-$pkgver
  cp -R lib modules "$pkgdir"/usr/share/elasticsearch5/

  cd config
  for conf in *; do
    install -Dm644 "$conf" "$pkgdir/etc/elasticsearch5/$conf"
  done
  cd ..

  install -Dm755 bin/elasticsearch "$pkgdir"/usr/bin/elasticsearch5
  for script in {-plugin,-translog}; do
    install -Dm755 bin/elasticsearch$script "$pkgdir"/usr/bin/elasticsearch5$script
  done
  install -Dm644 bin/elasticsearch.in.sh "$pkgdir"/usr/share/elasticsearch5/bin/elasticsearch.in.sh
}
