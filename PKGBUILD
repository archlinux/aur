# Maintainer:  HLFH <gaspard@dhautefeuille.eu>
# Contributor: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>

pkgname=elasticsearch
pkgver=8.5.3
pkgrel=2
pkgdesc="Distributed RESTful search engine built on top of Lucene"
arch=('x86_64')
url="https://www.elastic.co/products/elasticsearch"
license=('custom:SSPL+Elastic-2.0')
depends=('jdk19-openjdk' 'systemd' 'libxml2')
makedepends=('jdk17-openjdk')
source=(
  $pkgname-$pkgver.tar.gz::"https://github.com/elastic/elasticsearch/archive/v${pkgver}.tar.gz"
  elasticsearch.service
  elasticsearch@.service
  elasticsearch-keystore.service
  elasticsearch-keystore@.service
  elasticsearch-sysctl.conf
  elasticsearch-user.conf
  elasticsearch-tmpfile.conf
  elasticsearch.default
  remove-systemd-distribution-check.patch
  remove-systemd-package-check.patch
)
b2sums=('b058aea27dd2b3c8c072fe80d2d16102297efd3f684d88b9fd608d119dbaeff2dd2f961a4aa42c948bf66780a0b28f5fea65907804486eadedfbd02458670d79'
        '069bc68cec0d4638a90205ddf61e36224c73898b219e14d36e8340fb4ff8a5e9f6bbb7c12c0e69ad0f245db7ee67c2c0afac241484f4a9c5595c22ab4e575e55'
        'de3e45081e9f4d75c47b2d2ea4c9faabb0499153914c940faf055f34a823df1e4d244041520686fe6e6dabdb01520c3c48c9382613aeeadc3f5376bf0d1c367d'
        '48a332da75e1d8c7624a5948c4b145ad6ec6aca7ed2da31802920fa99490cc99a354e06d635b8937217404bcb99302f8d95b7af99d6af8e3227e39cdb80fa3cd'
        '91ca815aa29f619e74b8d735af234705aed7254e4ecdde5248ab2a971a6b13e4c3897ed54933b2d68d3f16c266cd20d6ce14377f988199c367c39b892ddf5bca'
        '5690e288a5d288931094db9e1532737b641d9852c2dc5cf45c2853e20c6ab013b1cf056f2cd325ad0703c2075dac7bd16c99c7f1ba202f5d94aac336508f7417'
        '21cc254940924675bd24e07f6af1f58c89530abfb075637279798bdbba80772c6a4659361e9e8e58a5b2a5ffb21e55e40c91a270ff10da5ab467f63ce34e9f76'
        'b54cc37b1e5b4f054fc14d3112bee2cbad1ba48f7f15364366473753767fa74f38874da35083f9f7d840286052d3da970cdcf509569aa8b5fff39e4941959678'
        'f346ba285e045e3982da1841adc8625ebf1a662882d20a7c69bd76911782e1bdf30883b16dffe32cd2355349738b9b6c275b9ff6b11dfdd7fd56b509bcd19c31'
        '67790af829e62fdb224b8725e64757c592d34690fd726a1ccd654621ccf973b732e1032bcd046c724ecd20ab5d0ba76067af081fdf483f87283df907fc8745f8'
        '1b03079b6937c9c2d5bf23f43a82870e38d62515e08a20f1300999c06fbe66deb8f3b8c6274807aa805cd464801cb56bf0aab356093319b89b2ceac08ed43ab9')

backup=('etc/elasticsearch/elasticsearch.yml'
        'etc/elasticsearch/log4j2.properties'
        'etc/elasticsearch/jvm.options'
        'etc/default/elasticsearch')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "$srcdir"/remove-systemd-distribution-check.patch
  patch -Np1 -i "$srcdir"/remove-systemd-package-check.patch
}

build() {
  cd $pkgname-$pkgver
  export PATH=/usr/lib/jvm/`archlinux-java get`/bin:$PATH
  export GRADLE_OPTS="-Dbuild.snapshot=false -Dlicense.key=x-pack/plugin/core/snapshot.key"
  export JAVA_HOME='/usr/lib/jvm/java-17-openjdk'
  ./gradlew :modules:systemd:assemble
  ./gradlew :distribution:archives:linux-tar:assemble
}

package() {
  cd $pkgname-$pkgver

  install -dm755 "$pkgdir"/{usr/share,var/lib,var/log}/elasticsearch
  install -dm755 "$pkgdir"/usr/bin

  tar xf distribution/archives/linux-tar/build/distributions/elasticsearch-$pkgver-*linux-x86_64.tar.gz \
      --strip 1 -C "$pkgdir"/usr/share/elasticsearch
  rm -r "$pkgdir"/usr/share/elasticsearch/{jdk,logs}

  install -dm755 "$pkgdir"/etc
  echo 'xpack.security.enabled: false' >> "$pkgdir"/usr/share/elasticsearch/config/elasticsearch.yml
  echo 'path.data: /var/lib/elasticsearch' >> "$pkgdir"/usr/share/elasticsearch/config/elasticsearch.yml
  mv "$pkgdir"/usr/share/elasticsearch/config "$pkgdir"/etc/elasticsearch
  chmod 2750 "$pkgdir"/etc/elasticsearch

  for bin in "$pkgdir"/usr/share/elasticsearch/bin/*; do
    ln -sT /usr/share/elasticsearch/bin/$(basename $bin) "$pkgdir"/usr/bin/$(basename $bin)
  done

  ln -s /etc/elasticsearch "$pkgdir"/usr/share/elasticsearch/config
  ln -s /var/log/elasticsearch "$pkgdir"/usr/share/elasticsearch/logs
  ln -s /usr/lib/jvm/java-19-openjdk "$pkgdir"/usr/share/elasticsearch/jdk

  install -Dm644 "$srcdir"/elasticsearch.service "$pkgdir"/usr/lib/systemd/system/elasticsearch.service
  install -Dm644 "$srcdir"/elasticsearch@.service "$pkgdir"/usr/lib/systemd/system/elasticsearch@.service
  install -Dm644 "$srcdir"/elasticsearch-keystore.service "$pkgdir"/usr/lib/systemd/system/elasticsearch-keystore.service
  install -Dm644 "$srcdir"/elasticsearch-keystore@.service "$pkgdir"/usr/lib/systemd/system/elasticsearch-keystore@.service
  install -Dm644 "$srcdir"/elasticsearch-user.conf "$pkgdir"/usr/lib/sysusers.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch-tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch-sysctl.conf "$pkgdir"/usr/lib/sysctl.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch.default "$pkgdir"/etc/default/elasticsearch

  cp -r distribution/build/outputs/default/modules/systemd "$pkgdir"/usr/share/elasticsearch/modules/

  sed -i '2iJAVA_HOME=/usr/lib/jvm/default-runtime' "$pkgdir"/usr/share/elasticsearch/bin/elasticsearch-env
  sed -i 's/ES_BUNDLED_JDK=true/ES_BUNDLED_JDK=false/g' "$pkgdir"/usr/share/elasticsearch/bin/elasticsearch-env

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
