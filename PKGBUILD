# Maintainer: Boris Momčilović <boris@momcilovic.org>
# Contributor: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>
# Refactored by Blaž "Speed" Hrastnik <https://github.com/archSeer>

pkgname=elasticsearch
pkgver=8.4.1
pkgrel=1
pkgdesc="Distributed RESTful search engine built on top of Lucene"
arch=('x86_64')
url="https://www.elastic.co/products/elasticsearch"
license=('custom:SSPL+Elastic-2.0')
depends=('java-environment>=17' 'systemd' 'libxml2')
makedepends=('java-environment>=17')
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
sha256sums=('f266b43dab221e0576702101335c762c98aa0204c32284653d1fc479561d6c19'
            '040fe3d528255cc82e3b018eb05802131de8e1d4deb1e299d4d86a0ab5e08311'
            '8a76ad9a44a34eca8d6cb7ec9d8f1b01d46c114765b0a76094de8d72f0477351'
            'bac40d87acaa5bee209ceb6dfa253009a072e9243fe3b94be42fb5cd44727d6f'
            '22a78a165a810608188faea6f2b0b381f27b1e9d60126c3b3e729124540589a8'
            'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
            'fc9683349457f56bcd044cd8e711bc8efd43d32f9547d5b21a66650c6dfbed73'
            '74a772e9f73e2cecda45dcd30ade2f6114db657ed36231292bdf9a7ca04eab78'
            'bb74e5fb8bc28f2125e015395ab05bea117b72bfc6dadbca827694b362ee0bf8'
            '96934e6518245a4110714c3e1c1eb7bfaf4dd0026cc917efc322f3bfa4c3b5ec'
            'e00c45812db63a0fa6ea4de27e8f489e38e01fafdb155e5421f5faf659c2905d')

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
  ln -s /usr/lib/jvm/java-17-openjdk "$pkgdir"/usr/share/elasticsearch/jdk

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
