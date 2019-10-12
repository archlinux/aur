# Maintainer: Dave Wheeler <dwwheeler at gmail dot com>
# Maintainer: Eric Liu <eric at hnws dot me>
# Official repo maintainer: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>
# Refactored by Blaž "Speed" Hrastnik <https://github.com/archSeer>

pkgname=elasticsearch-xpack
pkgver=7.4.0
pkgrel=1
pkgdesc="Distributed RESTful search engine built on top of Lucene"
arch=('x86_64')
url="https://www.elastic.co/products/elasticsearch"
license=('custom:Elastic')
depends=('java-runtime-headless' 'systemd')
provides=('elasticsearch')
conflicts=('elasticsearch')
relpkgname=elasticsearch
source=(
  "https://artifacts.elastic.co/downloads/$relpkgname/$relpkgname-$pkgver-x86_64.rpm"
  elasticsearch-env
  elasticsearch.service
  elasticsearch@.service
  elasticsearch-keystore.service
  elasticsearch-keystore@.service
  elasticsearch-sysctl.conf
  elasticsearch-user.conf
  elasticsearch-tmpfile.conf
  elasticsearch.default
)
sha256sums=('1bfae41734c77af3bc66084ac0cc04add1190f9311b045d3c184ea7b3e688334'
            '830bf17a9e1f88a8d6152899af2674571ecace88e202e484b56bf24f67d96e10'
            '9e1f68ff275ef2b5f2b93d2823efc5cc9643da696fcbe09a3ea7520ada35ffba'
            '8a76ad9a44a34eca8d6cb7ec9d8f1b01d46c114765b0a76094de8d72f0477351'
            'bac40d87acaa5bee209ceb6dfa253009a072e9243fe3b94be42fb5cd44727d6f'
            '22a78a165a810608188faea6f2b0b381f27b1e9d60126c3b3e729124540589a8'
            'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
            '815f6a39db6f54bb40750c382ffbdc298d2c4c187ee8ea7e2f855923e2ff354b'
            '0a344d779c550de324bfda385896caf0d728563751c176127b63ebf2354abee0'
            'bb74e5fb8bc28f2125e015395ab05bea117b72bfc6dadbca827694b362ee0bf8')

backup=('etc/elasticsearch/elasticsearch.yml'
        'etc/elasticsearch/log4j2.properties'
        'etc/elasticsearch/jvm.options'
        'etc/default/elasticsearch')

prepare() {
  cd "$srcdir"
  find usr/share/elasticsearch/bin -type f ! -name \*.jar -exec \
    sed -r 's;source .*/(.*)-env;source /usr/share/elasticsearch/\1-env;' -i {} +
  find usr/share/elasticsearch/bin -type f -name "elasticsearch-*" ! -name elasticsearch-bin -exec \
    sed 's/`dirname "$0"`/$(dirname "$(realpath "$0")")/' -i {} +
}

package() {
  cd "$pkgdir"
  install -dm2750 etc/elasticsearch
  install -dm750 etc/elasticsearch/scripts
  install -dm755 {usr/share,var/lib,var/log}/elasticsearch
  install -dm755 usr/bin

  cd "$srcdir"
  install -Dvm644 usr/share/elasticsearch/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for conf in etc/elasticsearch/*; do
    install -Dm644 "$conf" "$pkgdir/$conf"
  done
  cp -R usr/share/elasticsearch/{bin,lib,modules,plugins} "$pkgdir"/usr/share/elasticsearch

  cd "$pkgdir"/usr/share/elasticsearch
  rm -rf bin/elasticsearch-env

  find bin/ -type f -name elasticsearch-\* ! -name elasticsearch-cli -exec \
    ln -s ../share/elasticsearch/{} "$pkgdir"/usr/{} \;

  ln -s ../../../var/log/elasticsearch logs
  ln -s ../../../var/lib/elasticsearch data

  cd "$pkgdir"
  install -Dm644 "$srcdir"/elasticsearch-env usr/share/elasticsearch/elasticsearch-env
  install -Dm644 "$srcdir"/elasticsearch.service usr/lib/systemd/system/elasticsearch.service
  install -Dm644 "$srcdir"/elasticsearch@.service usr/lib/systemd/system/elasticsearch@.service
  install -Dm644 "$srcdir"/elasticsearch-keystore.service usr/lib/systemd/system/elasticsearch-keystore.service
  install -Dm644 "$srcdir"/elasticsearch-keystore@.service usr/lib/systemd/system/elasticsearch-keystore@.service
  install -Dm644 "$srcdir"/elasticsearch-user.conf usr/lib/sysusers.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch-tmpfile.conf usr/lib/tmpfiles.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch-sysctl.conf usr/lib/sysctl.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch.default etc/default/elasticsearch
}
