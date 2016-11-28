# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=logstash
pkgver=5.0.1
pkgrel=3
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
            '456ac4cb956c53512201a257dc9a4603a5ac4d317c2f02c7da5cd68060c0fee6'
            'a01ea29d4f53d785f6eb926ebfe445e64ed5b3dab5d0418848589dd79502d876'
            'f1dc558bcb50893fe744b9c3ba208829db9e242a83d30493795f837c05f5d89c'
            'fe05315345e4489458c3eecac43726800109c1e390e74a14584096f6c041fee1')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  rm -f bin/logstash.bat

	sed -e 's|LS_SETTINGS_DIR=.*|LS_SETTINGS_DIR="/etc/logstash/config"|' \
	    -i config/startup.options

  sed -e '1i [ -f /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh' \
      -i bin/logstash.lib.sh

  cd vendor/jruby/lib/jni
  rm -rf *Darwin *Windows *SunOS *FreeBSD arm-* ppc64*
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir"/usr/share "$pkgdir"/etc/conf.d
  cp -a logstash-$pkgver "$pkgdir"/usr/share/logstash

  cd "$pkgdir"/usr/share/logstash
  mv config/startup.options "$pkgdir"/etc/conf.d/logstash
  mv config "$pkgdir"/etc/logstash

  cd "$srcdir"
  install -Dm644 logstash.service "$pkgdir"/usr/lib/systemd/system/logstash.service
  install -Dm644 logstash@.service "$pkgdir"/usr/lib/systemd/system/logstash@.service
	install -Dm644 user.conf "$pkgdir"/usr/lib/sysusers.d/logstash.conf

  install -Dm644 bundle.config "$pkgdir"/usr/share/logstash/.bundle/config

  install -dm755 "$pkgdir"/var/lib/logstash
  install -dm755 "$pkgdir"/var/log/logstash
  install -dm755 "$pkgdir"/etc/logstash/conf.d
}
