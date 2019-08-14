# Maintainer: Dave Wheeler <dwwheeler at gmail dot com>
# Maintainer: Eric Liu <eric at hnws dot me>
# Official repo maintainer: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>
# Refactored by Blaž "Speed" Hrastnik <https://github.com/archSeer>

pkgname=elasticsearch-xpack
pkgver=7.3.0
pkgrel=1
pkgdesc="Distributed RESTful search engine built on top of Lucene"
arch=('x86_64')
url="https://www.elastic.co/products/elasticsearch"
license=('Apache')
depends=('java-runtime-headless' 'systemd')
provides=('elasticsearch')
conflicts=('elasticsearch')
relpkgname=elasticsearch
source=(
  "https://artifacts.elastic.co/downloads/$relpkgname/$relpkgname-$pkgver-linux-x86_64.tar.gz"
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
sha256sums=('6cddb4d9a3c5e730f8e35e2155937c069d057129808ea135d31f0ed5f7f2ea22'
            'ff530bf9440364955e9f38b5c5cc0782da1b1ac1c54870b162b7ded81e56eebc'
            'de3842935b6ef9cb8a05dc18334112f534dccc2292e36052df942a92de7e66db'
            '13090c1d23ae0a21bf6f0f1d1da795d38972f1674b20c3d2d32f54311aa99094'
            'bac40d87acaa5bee209ceb6dfa253009a072e9243fe3b94be42fb5cd44727d6f'
            '22a78a165a810608188faea6f2b0b381f27b1e9d60126c3b3e729124540589a8'
            'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
            '815f6a39db6f54bb40750c382ffbdc298d2c4c187ee8ea7e2f855923e2ff354b'
            '3173e3efa429507e6329f518699a072dfd442d9b5da7c62452a55f82334dd2b5'
            'bb74e5fb8bc28f2125e015395ab05bea117b72bfc6dadbca827694b362ee0bf8')

backup=('etc/elasticsearch/elasticsearch.yml'
        'etc/elasticsearch/log4j2.properties'
        'etc/elasticsearch/jvm.options'
        'etc/default/elasticsearch')

prepare() {
  cd "$srcdir"/$relpkgname-$pkgver

  find bin -type f \( -name \*.bat -o -name \*.exe \) -delete
  find bin -type f \( -name \*.jar -o -name \*-env \) -exec chmod a-x {} +
  find bin -type f ! -name \*.jar -exec \
    sed -r 's;source .*/(.*)-env;source /usr/share/elasticsearch/\1-env;' -i {} +
  find bin -type f -name "elasticsearch-*" ! -name elasticsearch-bin -exec \
    sed 's/`dirname "$0"`/$(dirname "$(realpath "$0")")/' -i {} +
}

package() {
  cd "$pkgdir"
  install -dm750 etc/elasticsearch{,/scripts}
  install -dm755 {usr/share,var/lib,var/log}/elasticsearch
  install -dm755 usr/bin

  cd "$srcdir"/$relpkgname-$pkgver
  cp -R bin lib modules plugins "$pkgdir"/usr/share/elasticsearch/

  cd config
  for conf in *; do
    install -Dm644 "$conf" "$pkgdir/etc/elasticsearch/$conf"
  done

  cd ..
  mv bin/elasticsearch-env .
  find bin/ -type f -name elasticsearch-\* ! -name elasticsearch-cli -exec \
    ln -s ../share/elasticsearch/{} "$pkgdir"/usr/{} \;

  cd "$pkgdir"/usr/share/elasticsearch
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
