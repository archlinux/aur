# Maintainer: Timo Sarawinski <timo at it-kraut DOT net>

pkgname=elasticsearch-latest
_pkgname=elasticsearch
pkgver=7.12.0
pkgrel=4
pkgdesc="Distributed RESTful search engine built on top of Lucene"
arch=('x86_64')
url="https://www.elastic.co/products/elasticsearch"
license=('custom:Elastic2')
depends=('java-runtime-headless' 'systemd')
makedepends=('jdk-openjdk' 'gradle')
provides=('elasticsearch')
conflicts=('elasticsearch')
source=(
  $_pkgname-$pkgver.tar.gz::"https://github.com/elastic/elasticsearch/archive/v${pkgver}.tar.gz"
  elasticsearch.service
  elasticsearch@.service
  elasticsearch-keystore.service
  elasticsearch-keystore@.service
  elasticsearch-sysctl.conf
  elasticsearch-user.conf
  elasticsearch-tmpfile.conf
  elasticsearch.default
  remove-systemd-distribution-check.patch
  gradle.patch
)
sha256sums=('4cf2b69a8878f7a24086891922459bc9797e4cd5ba5874aa50700629c011280a'
            '9e1f68ff275ef2b5f2b93d2823efc5cc9643da696fcbe09a3ea7520ada35ffba'
            '8a76ad9a44a34eca8d6cb7ec9d8f1b01d46c114765b0a76094de8d72f0477351'
            'bac40d87acaa5bee209ceb6dfa253009a072e9243fe3b94be42fb5cd44727d6f'
            '22a78a165a810608188faea6f2b0b381f27b1e9d60126c3b3e729124540589a8'
            'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
            '815f6a39db6f54bb40750c382ffbdc298d2c4c187ee8ea7e2f855923e2ff354b'
            '05a73496766a869134cf8a73f2de552bcf9bd1b10a3257e2cbc15f476093c9a6'
            'bb74e5fb8bc28f2125e015395ab05bea117b72bfc6dadbca827694b362ee0bf8'
            '96934e6518245a4110714c3e1c1eb7bfaf4dd0026cc917efc322f3bfa4c3b5ec'
            '1af5d3ab223d7215109fa2a6f6699b922e2a8b5260dd6395a49e170be7d9e226')

backup=('etc/default/elasticsearch'
        'etc/elasticsearch/elasticsearch.yml'
        'etc/elasticsearch/jvm.options'
        'etc/elasticsearch/log4j2.properties'
        'etc/elasticsearch/roles.yml'
        'etc/elasticsearch/role_mapping.yml'
        'etc/elasticsearch/users'
        'etc/elasticsearch/users_roles')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i "$srcdir"/remove-systemd-distribution-check.patch
   patch -Np1 -i "$srcdir"/gradle.patch
}

build() {
  cd $_pkgname-$pkgver
  export PATH=/usr/lib/jvm/java-15-openjdk/bin:$PATH
  export GRADLE_OPTS="-Dbuild.snapshot=false -Dlicense.key=x-pack/plugin/core/snapshot.key"
  ./gradlew wrapper --gradle-version=6.8.3
  ./gradlew :distribution:buildSystemdModule
  ./gradlew :distribution:archives:linux-tar:build
}

package() {
  cd $_pkgname-$pkgver

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
  sed -i 's/will be removed in a future release" \>\&2/will be removed in a future release" \&\>\/dev\/null/g' "$pkgdir"/usr/share/elasticsearch/bin/elasticsearch-env

}
