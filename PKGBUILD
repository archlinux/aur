# Maintainer: Dave Wheeler <dwwheeler at gmail dot com>
# Maintainer: Eric Liu <eric at hnws dot me>
# Official repo maintainer: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>
# Refactored by Blaž "Speed" Hrastnik <https://github.com/archSeer>

pkgname=elasticsearch-xpack
pkgver=7.10.1
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
  https://artifacts.elastic.co/downloads/$relpkgname/$relpkgname-$pkgver-x86_64.rpm{,.asc}
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
sha512sums=('950ab2f73aedb7004d5565e927ba85b9c8a8acca320f6398b248e7e409a6842306005ea798e0f39cd177d5e428e1811ec317ab23244b6ba9b4b27b02308840d0'
            'SKIP'
            '52556e0709590f0e15039d89b64c08c9bbeb0c61d29e3cd5a4471744968c882eb559081db1c89e846fa33d50b31e2fe9ba46d7e7e2cf5d4a23e78bc97a50c853'
            '8280cfd911c1762a1cba67a72bf01c593dbcec00ab02b5f7ca2ef05dbcbae835f2d0e20f3143b0f601e233708e7a60148a1b2087aaff0e0b239361ca4792409f'
            '712974b708f54b631d635601e7dff037a2fff0cd927cd09b27974fdb9232c1e495d70232afad5eaa4d2876665e099f880c23f914ed602700ef1962b5f137879f'
            '87ff9026db8883dab2b1c5dcf7ead2700de6aa37000631d153fb61cccf7ab42edbd5eeac4e320e9d6aa2aadbe76f2c6386efb1aefde6f02aef95680f6ffafd0b'
            '337c7c4c0f37430523b9a89e716051f1a05abbc71c3109dbf201bcf1b6839a88b5edb2c6498937552e8e92255e143ea344e55478543ff1c4623ed14ea04e7af1'
            '4926e63ed247f9ced0674a55d01fdf7708b468a5f4b1bdb246f60c4e80d4980f21c811b952340d3e8d1c1dde77af87e062c1b66ec6818f90fb128a713c349050'
            '1c1b3dfe28cd2f9026fdfa373bc59be35cf281bf22fcab12150ddded40b1355268078b9197559c4bdb9665177924fe95786028386baec90dede53264506383fd'
            'af1af8854ca5a129b6c1d5fd3d977d99af0acef4490f2a9d39ee0746467a3305e223031c4ca5cebbb1629b8611e04ea61a1bf57f7fcef4ff4da0d6bae0df8c72'
            '4ef74026f82b6f0cb6cec9b992cd3f9b145083da39a37b7d8da01824c44054c72644ee0fe6d92f0329496f0fce97b7b913bca1402ef922b6cceccc360e35c5b1')
validpgpkeys=('46095ACC8548582C1A2699A9D27D666CD88E42B4') # Elasticsearch (Elasticsearch Signing Key) <dev_ops@elasticsearch.org>

backup=('etc/default/elasticsearch'
        'etc/elasticsearch/elasticsearch.yml'
        'etc/elasticsearch/jvm.options'
        'etc/elasticsearch/log4j2.properties'
        'etc/elasticsearch/roles.yml'
        'etc/elasticsearch/role_mapping.yml'
        'etc/elasticsearch/users'
        'etc/elasticsearch/users_roles')

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
  install -dm750 etc/elasticsearch/{scripts,jvm.options.d}
  install -dm755 {usr/share,var/lib,var/log}/elasticsearch
  install -dm755 usr/bin

  cd "$srcdir"
  install -Dvm644 usr/share/elasticsearch/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find etc/elasticsearch/ -type f -exec \
    install -Dm644 {} "$pkgdir/"{} \;

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
