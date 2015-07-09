# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=logstash
pkgver=1.5.2
pkgrel=1
pkgdesc='A tool for managing events and logs'
arch=('any')
url='https://www.elastic.co/products/logstash'
license=('Apache License')
depends=('java-runtime')
install=logstash.install

source=("https://download.elasticsearch.org/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz"
        "logstash.service"
        "logstash@.service"
        "logstash-web.service"
        "bundle.config")

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  rm -f bin/logstash.bat

  sed -e '1i [ -f /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh' \
      -e '2i [ -f /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh' \
      -i bin/logstash.lib.sh

  cd vendor/jruby/lib/jni
  rm -rf *Darwin *Windows *SunOS *FreeBSD
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir"/opt
  cp -a logstash-$pkgver "$pkgdir"/opt/logstash

  install -Dm644 logstash.service "$pkgdir"/usr/lib/systemd/system/logstash.service
  install -Dm644 logstash@.service "$pkgdir"/usr/lib/systemd/system/logstash@.service
  install -Dm644 logstash-web.service "$pkgdir"/usr/lib/systemd/system/logstash-web.service

  install -Dm644 bundle.config "$pkgdir"/opt/logstash/.bundle/config

  install -dm755 "$pkgdir"/var/lib/logstash
  install -dm755 "$pkgdir"/etc/logstash/conf.d
}

sha256sums=('1d1805d388392a69f5049b35c176186389a7f8bf7347c4528c255edc1f9b0d6a'
            'c53800afaec5295963e4c8073e5ebda1008729830a5453d40b1aea6f58bf8a41'
            'edc0ff1b4c2ba10c7907c4ed7e93cd035cc9c352b6c00cc514dc14cd3fa686cf'
            '0fac736ad8c27dc3465074a14cfe3111dbb834edd92090598fd696c6840d78c0'
            'd19e7bd73fb602419602296b113047df06688a9c15f5b3436602cc41afa1c486')
