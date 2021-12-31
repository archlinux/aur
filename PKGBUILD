# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>
# Refactored by Blaž "Speed" Hrastnik <https://github.com/archSeer>

pkgname=opensearch
_pkgname=OpenSearch
pkgver=1.2.3
pkgrel=1
pkgdesc="Search and analytics suite derived from Apache 2.0 licensed elasticsearch"
arch=('x86_64')
url="https://opensearch.org/"
license=('Apache')
depends=('java-runtime-headless<=16' 'systemd' 'libxml2')
makedepends=('java-environment=11')
source=(
  $pkgname-$pkgver.tar.gz::"https://github.com/opensearch-project/${_pkgname}/archive/${pkgver}.tar.gz"
  opensearch.service
  opensearch@.service
  opensearch-keystore.service
  opensearch-keystore@.service
  opensearch-sysctl.conf
  opensearch-user.conf
  opensearch-tmpfile.conf
  opensearch.default
  remove-systemd-distribution-check.patch
)
sha256sums=('d2d0133a1eabaa9ab39fcea2cfec3fdcd787330d125daa406acdaf1fd8783bf6'
            'ede02faa5d4f635e15c02653be37d0140f425ec18c2357e94d477b7ddd7f0c6b'
            'c749a2f8cd597a085bfa45089df125cbfdc0382c499c12542837b2e16f14c999'
            '097de1fc6ef1f12e99d2b3def9c9803cf0dd8609aeace608048d599a2cb85c5c'
            'ec20f13e0d0040042cb284423a84bd23d36d05a1059c182c804515b6e112a951'
            'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
            '79cb5856b7105da7f25c6da2a25be88ccba2b849fd92cc32c3204e2fad530efc'
            '7ca9e6e72d284f791f6e7bd4fd8ac68f5ff9aeb23dd9a6fe37ed353f71b5406d'
            '52c238bff8c4c8bf49e8844f3f121275cca4e0c00346ad90177f69f634e67a2b'
            'fbc2b6ec44a644cabc6a89ccd50546cf5f6f3cf409c984d1657238169f0cafad')

backup=('etc/opensearch/opensearch.yml'
        'etc/opensearch/log4j2.properties'
        'etc/opensearch/jvm.options'
        'etc/default/opensearch')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i "$srcdir"/remove-systemd-distribution-check.patch
}

build() {
  cd $_pkgname-$pkgver
  export PATH=/usr/lib/jvm/java-11-openjdk/bin:$PATH
  export GRADLE_OPTS="-Dbuild.snapshot=false"
  ./gradlew :distribution:buildSystemdModule
  ./gradlew :distribution:archives:linux-tar:build
}

package() {
  cd $_pkgname-$pkgver

  install -dm755 "$pkgdir"/{usr/share,var/lib,var/log}/opensearch
  install -dm755 "$pkgdir"/usr/bin

  tar xf distribution/archives/linux-tar/build/distributions/opensearch-min-$pkgver-linux-x64.tar.gz \
      --strip 1 -C "$pkgdir"/usr/share/opensearch/
  rm -r "$pkgdir"/usr/share/opensearch/{jdk,logs}

  install -dm755 "$pkgdir"/etc
  mv "$pkgdir"/usr/share/opensearch/config "$pkgdir"/etc/opensearch
  chmod 2750 "$pkgdir"/etc/opensearch

  for bin in "$pkgdir"/usr/share/opensearch/bin/*; do
    ln -sT /usr/share/opensearch/bin/$(basename $bin) "$pkgdir"/usr/bin/$(basename $bin)
  done

  ln -s /etc/opensearch "$pkgdir"/usr/share/opensearch/config
  ln -s /var/log/opensearch "$pkgdir"/usr/share/opensearch/logs
  ln -s /var/lib/opensearch "$pkgdir"/usr/share/opensearch/data

  install -Dm644 "$srcdir"/opensearch.service "$pkgdir"/usr/lib/systemd/system/opensearch.service
  install -Dm644 "$srcdir"/opensearch@.service "$pkgdir"/usr/lib/systemd/system/opensearch@.service
  install -Dm644 "$srcdir"/opensearch-keystore.service "$pkgdir"/usr/lib/systemd/system/opensearch-keystore.service
  install -Dm644 "$srcdir"/opensearch-keystore@.service "$pkgdir"/usr/lib/systemd/system/opensearch-keystore@.service
  install -Dm644 "$srcdir"/opensearch-user.conf "$pkgdir"/usr/lib/sysusers.d/opensearch.conf
  install -Dm644 "$srcdir"/opensearch-tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/opensearch.conf
  install -Dm644 "$srcdir"/opensearch-sysctl.conf "$pkgdir"/usr/lib/sysctl.d/opensearch.conf
  install -Dm644 "$srcdir"/opensearch.default "$pkgdir"/etc/default/opensearch

  cp -r distribution/build/outputs/systemd/modules/systemd "$pkgdir"/usr/share/opensearch/modules/

  sed -i '2iJAVA_HOME=/usr/lib/jvm/default-runtime' "$pkgdir"/usr/share/opensearch/bin/opensearch-env
  sed -i 's/OPENSEARCH_BUNDLED_JDK=true/OPENSEARCH_BUNDLED_JDK=false/g' "$pkgdir"/usr/share/opensearch/bin/opensearch-env

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
