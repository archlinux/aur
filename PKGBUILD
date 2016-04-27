# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=logstash
pkgver=2.3.2
pkgrel=1
pkgdesc='A tool for managing events and logs'
arch=('any')
url='https://www.elastic.co/products/logstash'
license=('Apache License')
depends=('java-runtime-headless')
install=logstash.install

source=("https://download.elasticsearch.org/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz"
        "logstash.service"
        "logstash@.service"
        "logstash-web.service"
        "user.conf"
        "bundle.config")

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
  install -Dm644 logstash-web.service "$pkgdir"/usr/lib/systemd/system/logstash-web.service
	install -Dm644 user.conf "$pkgdir"/usr/lib/sysusers.d/logstash.conf

  install -Dm644 bundle.config "$pkgdir"/opt/logstash/.bundle/config

  install -dm755 "$pkgdir"/var/lib/logstash
  install -dm755 "$pkgdir"/etc/logstash/conf.d
}

sha256sums=('b3c9d943fa273c8087386736ef6809df9c5959bab870a6ab4723f58d48dd38c1'
            'c53800afaec5295963e4c8073e5ebda1008729830a5453d40b1aea6f58bf8a41'
            'edc0ff1b4c2ba10c7907c4ed7e93cd035cc9c352b6c00cc514dc14cd3fa686cf'
            '0fac736ad8c27dc3465074a14cfe3111dbb834edd92090598fd696c6840d78c0'
            'f1dc558bcb50893fe744b9c3ba208829db9e242a83d30493795f837c05f5d89c'
            'd19e7bd73fb602419602296b113047df06688a9c15f5b3436602cc41afa1c486')
