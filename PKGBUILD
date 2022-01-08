# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>
# Refactored by Blaž "Speed" Hrastnik <https://github.com/archSeer>

pkgname=elasticsearch
pkgver=7.10.2
pkgrel=2
pkgdesc="Distributed RESTful search engine built on top of Lucene"
arch=('x86_64')
url="https://www.elastic.co/products/elasticsearch"
license=('Apache')
depends=('java-runtime-headless<=16' 'systemd' 'libxml2')
makedepends=('java-environment=11')
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
  patch-log4j-JAR-to-remove-JndiLookup-class-81629.patch
)
sha256sums=('bdb7811882a0d9436ac202a947061b565aa71983c72e1c191e7373119a1cdd1c'
            '9e1f68ff275ef2b5f2b93d2823efc5cc9643da696fcbe09a3ea7520ada35ffba'
            '8a76ad9a44a34eca8d6cb7ec9d8f1b01d46c114765b0a76094de8d72f0477351'
            'bac40d87acaa5bee209ceb6dfa253009a072e9243fe3b94be42fb5cd44727d6f'
            '22a78a165a810608188faea6f2b0b381f27b1e9d60126c3b3e729124540589a8'
            'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
            '815f6a39db6f54bb40750c382ffbdc298d2c4c187ee8ea7e2f855923e2ff354b'
            '74a772e9f73e2cecda45dcd30ade2f6114db657ed36231292bdf9a7ca04eab78'
            'bb74e5fb8bc28f2125e015395ab05bea117b72bfc6dadbca827694b362ee0bf8'
            '96934e6518245a4110714c3e1c1eb7bfaf4dd0026cc917efc322f3bfa4c3b5ec'
            '98724575d454a49ec419eb39c53565cba5d2901eef6246d63205d02b8c6a68e2')

backup=('etc/elasticsearch/elasticsearch.yml'
        'etc/elasticsearch/log4j2.properties'
        'etc/elasticsearch/jvm.options'
        'etc/default/elasticsearch')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "$srcdir"/remove-systemd-distribution-check.patch
  patch -Np1 -i "$srcdir"/patch-log4j-JAR-to-remove-JndiLookup-class-81629.patch
  sed -i 's|${versions.log4j}|2.11.1|' libs/log4j/build.gradle
}

build() {
  cd $pkgname-$pkgver
  export PATH=/usr/lib/jvm/java-11-openjdk/bin:$PATH
  export GRADLE_OPTS="-Dbuild.snapshot=false -Dlicense.key=x-pack/plugin/core/snapshot.key"
  ./gradlew :distribution:buildSystemdModule
  ./gradlew :distribution:archives:linux-tar:build
}

package() {
  cd $pkgname-$pkgver

  install -dm755 "$pkgdir"/{usr/share,var/lib,var/log}/elasticsearch
  install -dm755 "$pkgdir"/usr/bin

  tar xf distribution/archives/linux-tar/build/distributions/elasticsearch-$pkgver-*linux-x86_64.tar.gz \
      --strip 1 -C "$pkgdir"/usr/share/elasticsearch
  rm -r "$pkgdir"/usr/share/elasticsearch/{jdk,logs}

  install -dm755 "$pkgdir"/etc
  mv "$pkgdir"/usr/share/elasticsearch/config "$pkgdir"/etc/elasticsearch
  chmod 2750 "$pkgdir"/etc/elasticsearch

  for bin in "$pkgdir"/usr/share/elasticsearch/bin/*; do
    ln -sT /usr/share/elasticsearch/bin/$(basename $bin) "$pkgdir"/usr/bin/$(basename $bin)
  done

  ln -s /etc/elasticsearch "$pkgdir"/usr/share/elasticsearch/config
  ln -s /var/log/elasticsearch "$pkgdir"/usr/share/elasticsearch/logs
  ln -s /var/lib/elasticsearch "$pkgdir"/usr/share/elasticsearch/data

  install -Dm644 "$srcdir"/elasticsearch.service "$pkgdir"/usr/lib/systemd/system/elasticsearch.service
  install -Dm644 "$srcdir"/elasticsearch@.service "$pkgdir"/usr/lib/systemd/system/elasticsearch@.service
  install -Dm644 "$srcdir"/elasticsearch-keystore.service "$pkgdir"/usr/lib/systemd/system/elasticsearch-keystore.service
  install -Dm644 "$srcdir"/elasticsearch-keystore@.service "$pkgdir"/usr/lib/systemd/system/elasticsearch-keystore@.service
  install -Dm644 "$srcdir"/elasticsearch-user.conf "$pkgdir"/usr/lib/sysusers.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch-tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch-sysctl.conf "$pkgdir"/usr/lib/sysctl.d/elasticsearch.conf
  install -Dm644 "$srcdir"/elasticsearch.default "$pkgdir"/etc/default/elasticsearch

  cp -r distribution/build/outputs/systemd/modules/systemd "$pkgdir"/usr/share/elasticsearch/modules/

  sed -i '2iJAVA_HOME=/usr/lib/jvm/default-runtime' "$pkgdir"/usr/share/elasticsearch/bin/elasticsearch-env
  sed -i 's/ES_BUNDLED_JDK=true/ES_BUNDLED_JDK=false/g' "$pkgdir"/usr/share/elasticsearch/bin/elasticsearch-env

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
