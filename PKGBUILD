# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=logstash
pkgver=5.0.1
pkgrel=1
pkgdesc='A tool for managing events and logs'
arch=('any')
url='https://www.elastic.co/products/logstash'
license=('Apache License')
depends=('java-runtime-headless>=8')
install=logstash.install

source=("https://artifacts.elastic.co/downloads/$pkgname/$pkgname-$pkgver.tar.gz"
        "logstash.service"
        "logstash@.service"
        "user.conf"
        "bundle.config")
sha256sums=('d4cb9a624e12f8e4cf852a251c96b371094009b84a85231c9604ba7d6523da4d'
            '5d104679e730589d8822a0296ef921c34b8328761d2c5378429c1a65c529938a'
            'a01ea29d4f53d785f6eb926ebfe445e64ed5b3dab5d0418848589dd79502d876'
            'f1dc558bcb50893fe744b9c3ba208829db9e242a83d30493795f837c05f5d89c'
            'd19e7bd73fb602419602296b113047df06688a9c15f5b3436602cc41afa1c486')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  rm -f bin/logstash.bat

  sed -e '1i [ -f /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh' \
      -e '2i [ -f /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh' \
      -i bin/logstash.lib.sh

  cd vendor/jruby/lib/jni
  rm -rf *Darwin *Windows *SunOS *FreeBSD arm-* ppc64*
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir"/opt
  cp -a logstash-$pkgver "$pkgdir"/opt/logstash

  install -Dm644 logstash.service "$pkgdir"/usr/lib/systemd/system/logstash.service
  install -Dm644 logstash@.service "$pkgdir"/usr/lib/systemd/system/logstash@.service
	install -Dm644 user.conf "$pkgdir"/usr/lib/sysusers.d/logstash.conf

  install -Dm644 bundle.config "$pkgdir"/opt/logstash/.bundle/config

  install -dm755 "$pkgdir"/var/lib/logstash
  install -dm755 "$pkgdir"/etc/logstash/conf.d
}
