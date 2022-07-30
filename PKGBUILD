# Maintainer: Dave Wheeler <dwwheeler at gmail dot com>
# Contributor: Eric Liu <eric at hnws dot me>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>
# Contributor: Blaž "Speed" Hrastnik <https://github.com/archSeer>

pkgname=elasticsearch-xpack
pkgver=8.2.3
pkgrel=1
pkgdesc="Distributed RESTful search engine built on top of Lucene"
arch=('x86_64')
url="https://www.elastic.co/products/elasticsearch"
license=('custom:Elastic2')
depends=('java-runtime-headless>=17')
provides=("elasticsearch=$pkgver")
conflicts=('elasticsearch')
_relpkgname=elasticsearch
source=(
  https://artifacts.elastic.co/downloads/$_relpkgname/$_relpkgname-$pkgver-x86_64.rpm{,.asc}
  elasticsearch.service
  elasticsearch@.service
  elasticsearch-keystore.service
  elasticsearch-keystore@.service
  elasticsearch-user.conf
  elasticsearch-tmpfile.conf
)
sha512sums=('cb4b58b289e8cef5e54c1724ea828d10ac9b8fa8d45b94e1dbf32ce0424e2c7ca06a313b68c0c5636872c71f0c5940b421abc31976006753cd7ee36a2d3d46fc'
            'SKIP'
            '50d8cff9af937f0dbfc4e85ad326039f82470ef1b4546f4cd6cea38da3f6a82a0f9f7f1abc7c2b446963b48f04f9810dcaf9201827dd1e959a0514a9445fd2b0'
            'b8646b71bd9c1794776d2d10edab2a748bcd40efdfd5840a3c74d6736816cb6908fddfed754a1562062c745ab419256bef74dda9aaeef45e20845c43f0ecf6c3'
            '87ff9026db8883dab2b1c5dcf7ead2700de6aa37000631d153fb61cccf7ab42edbd5eeac4e320e9d6aa2aadbe76f2c6386efb1aefde6f02aef95680f6ffafd0b'
            '337c7c4c0f37430523b9a89e716051f1a05abbc71c3109dbf201bcf1b6839a88b5edb2c6498937552e8e92255e143ea344e55478543ff1c4623ed14ea04e7af1'
            '1c1b3dfe28cd2f9026fdfa373bc59be35cf281bf22fcab12150ddded40b1355268078b9197559c4bdb9665177924fe95786028386baec90dede53264506383fd'
            '753e0dd4ee115bd508f8a6b59309408b4ec45b95624751ac770d350acc1541defeb729d72b6f767beb2864b76e92a1baa882ea34a2f72ab6ffc92b5dc77c61fe')
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
  find usr/share/elasticsearch/bin -type f -name "elasticsearch-*" ! -name elasticsearch-bin -exec \
    sed 's/`dirname "$0"`/$(dirname "$(realpath "$0")")/' -i {} +
}

package() {
  cd "$pkgdir"
  install -dm2750 etc/elasticsearch
  install -dm750 etc/elasticsearch/{scripts,jvm.options.d}
  install -dm755 {usr/share,var/lib,var/log}/elasticsearch usr/share/licenses/$pkgname usr/bin

  cd "$srcdir"
  install -vm644 usr/share/elasticsearch/{LICENSE,NOTICE}.txt \
    "$pkgdir/usr/share/licenses/$pkgname"
  find etc/elasticsearch/ -type f -exec \
    install -Dm644 {} "$pkgdir/"{} \;

  cp -R usr/share/elasticsearch/{bin,lib,modules,plugins} "$pkgdir"/usr/share/elasticsearch

  cd "$pkgdir"/usr/share/elasticsearch
  find bin/ -type f -name elasticsearch-\* ! -name elasticsearch-cli -exec \
    ln -s ../share/elasticsearch/{} "$pkgdir"/usr/{} \;

  ln -s /var/log/elasticsearch logs
  ln -s /var/lib/elasticsearch data

  cd "$pkgdir"
  install -Dm644 "$srcdir"/elasticsearch.service usr/lib/systemd/system/elasticsearch.service
  install -Dm644 "$srcdir"/elasticsearch@.service usr/lib/systemd/system/elasticsearch@.service
  install -Dm644 "$srcdir"/elasticsearch-keystore.service usr/lib/systemd/system/elasticsearch-keystore.service
  install -Dm644 "$srcdir"/elasticsearch-keystore@.service usr/lib/systemd/system/elasticsearch-keystore@.service
  install -Dm644 "$srcdir"/elasticsearch-user.conf usr/lib/sysusers.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch-tmpfile.conf usr/lib/tmpfiles.d/elasticsearch.conf
  install -Dm644 "$srcdir"/usr/lib/sysctl.d/elasticsearch.conf usr/lib/sysctl.d/elasticsearch.conf
  install -Dm644 "$srcdir"/etc/sysconfig/elasticsearch etc/default/elasticsearch

  sed -i 's@/etc/sysconfig/elasticsearch@/etc/default/elasticsearch@' usr/share/elasticsearch/bin/elasticsearch-env
  sed -i 's@.*ES_JAVA_HOME=.*@ES_JAVA_HOME=/usr/lib/jvm/default-runtime@' etc/default/elasticsearch
}
