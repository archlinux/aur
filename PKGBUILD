# Maintainer: Tung Ha <tunght13488 at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Marcello "mererghost" Rocha <https://github.com/mereghost>
# Contributor: Blaž "Speed" Hrastnik <https://github.com/archSeer>

pkgname=elasticsearch6
_pkgname=elasticsearch
pkgver=6.8.13
pkgrel=1
pkgdesc="Distributed RESTful search engine built on top of Lucene"
arch=('any')
url="https://www.elastic.co/products/elasticsearch"
license=('Apache')
depends=('java-runtime-headless' 'systemd')
source=(
  "https://artifacts.elastic.co/downloads/$_pkgname/$_pkgname-oss-$pkgver.tar.gz"
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
sha256sums=('e3a41d1a58898c18e9f80d45b1bf9f413779bdda9621027a6fe87f3a0f59ec90'
            'cce7cfe85ddea80ff6db10ec88f973b87ffa97b9f6a2614234b846551a7731d7'
            'ff1c01c16f77d18b0cf8c94798dd74f86a1f89d132508b98dcc8a8e9251c1750'
            '2af4e23d1e1b99211c413a73600e369b190eb7d5ff1ad844ad93191b0adc5311'
            '51ec569bbcbcb16929f6f39d7dfda9a0a8938225e4041e2e84aa18cb2c36dd3f'
            'bc159a611dbb4a05dfe8805429bc02a65b4f78191e14d17a68f655e90237a327'
            'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
            '815f6a39db6f54bb40750c382ffbdc298d2c4c187ee8ea7e2f855923e2ff354b'
            '0ead1f4724268b51c0db15ee8f0612d23f87c3dc0445b737bc9b96e5511cb38c'
            'bb74e5fb8bc28f2125e015395ab05bea117b72bfc6dadbca827694b362ee0bf8')

backup=('etc/elasticsearch6/elasticsearch.yml'
        'etc/elasticsearch6/log4j2.properties'
        'etc/elasticsearch6/jvm.options'
        'etc/default/elasticsearch6')

prepare() {
  cd "$srcdir"/$_pkgname-$pkgver

  find bin -type f \( -name \*.bat -o -name \*.exe \) -delete
  find bin -type f \( -name \*.jar -o -name \*-env \) -exec chmod a-x {} +
  find bin -type f ! -name \*.jar -exec \
    sed -r 's;source .*/(.*)-env;source /usr/share/elasticsearch6/\1-env;' -i {} +
  find bin -type f -name "elasticsearch-*" ! -name elasticsearch-bin -exec \
    sed 's/`dirname "$0"`/$(dirname "$(realpath "$0")")/' -i {} +
}

package() {
  cd "$pkgdir"
  install -dm750 etc/elasticsearch6{,/scripts}
  install -dm755 {usr/share,var/lib,var/log}/elasticsearch6
  install -dm755 usr/bin

  cd "$srcdir"/$_pkgname-$pkgver
  cp -R bin lib modules plugins "$pkgdir"/usr/share/elasticsearch6/

  cd config
  for conf in *; do
    install -Dm644 "$conf" "$pkgdir/etc/elasticsearch6/$conf"
  done

  cd ..
  mv bin/elasticsearch-env .
  # find bin/ -type f -name elasticsearch-\* ! -name elasticsearch-cli -exec \
  #   ln -s ../share/elasticsearch6/{} "$pkgdir"/usr/{} \;
  ln -s ../share/elasticsearch6/elasticsearch-keystore "$pkgdir"/usr/elasticsearch6-keystore
  ln -s ../share/elasticsearch6/elasticsearch-plugin "$pkgdir"/usr/elasticsearch6-plugin
  ln -s ../share/elasticsearch6/elasticsearch-shard "$pkgdir"/usr/elasticsearch6-shard
  ln -s ../share/elasticsearch6/elasticsearch-translog "$pkgdir"/usr/elasticsearch6-translog

  cd "$pkgdir"/usr/share/elasticsearch6
  ln -s ../../../var/log/elasticsearch6 logs
  ln -s ../../../var/lib/elasticsearch6 data

  cd "$pkgdir"
  install -Dm644 "$srcdir"/elasticsearch-env usr/share/elasticsearch6/elasticsearch-env
  install -Dm644 "$srcdir"/elasticsearch.service usr/lib/systemd/system/elasticsearch6.service
  install -Dm644 "$srcdir"/elasticsearch@.service usr/lib/systemd/system/elasticsearch6@.service
  install -Dm644 "$srcdir"/elasticsearch-keystore.service usr/lib/systemd/system/elasticsearch6-keystore.service
  install -Dm644 "$srcdir"/elasticsearch-keystore@.service usr/lib/systemd/system/elasticsearch6-keystore@.service
  install -Dm644 "$srcdir"/elasticsearch-user.conf usr/lib/sysusers.d/elasticsearch6.conf
  install -Dm644 "$srcdir"/elasticsearch-tmpfile.conf usr/lib/tmpfiles.d/elasticsearch6.conf
  install -Dm644 "$srcdir"/elasticsearch-sysctl.conf usr/lib/sysctl.d/elasticsearch6.conf
  install -Dm644 "$srcdir"/elasticsearch.default etc/default/elasticsearch6
}
