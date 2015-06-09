# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=logstash-forwarder-git
pkgver=v0.3.1.79.g0ae8ca7
pkgrel=1
pkgdesc="Logstash shipping tool using the lumberjack protocol"
arch=('x86_64')
url="https://github.com/elasticsearch/logstash-forwarder"
license=('APACHE')
depends=('glibc')
makedepends=('go')
backup=(etc/logstash-forwarder.conf)
source=('git+https://github.com/elasticsearch/logstash-forwarder.git'
        'logstash-forwarder.service'
        'logstash-forwarder-journal.service'
        'logstash-forwarder-journalctl')

pkgver() {
	cd "$srcdir/logstash-forwarder"
	git describe --tags --always | sed 's|-|.|g'
}

build() {
	cd "$srcdir/logstash-forwarder"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/logstash-forwarder"
	install -dm755 "$pkgdir"/var/lib/logstash-forwarder
	install -Dm644 logstash-forwarder.conf.example "$pkgdir"/etc/logstash-forwarder.conf
	install -Dm755 logstash-forwarder "$pkgdir"/usr/bin/logstash-forwarder
	install -Dm644 "$srcdir"/logstash-forwarder.service "$pkgdir"/usr/lib/systemd/system/logstash-forwarder.service
	install -Dm644 "$srcdir"/logstash-forwarder-journal.service "$pkgdir"/usr/lib/systemd/system/logstash-forwarder-journal.service
	install -Dm0755 "$srcdir/logstash-forwarder-journalctl" "$pkgdir/usr/lib/systemd/scripts/logstash-forwarder-journalctl"
}

sha256sums=('SKIP'
            'c2346140c185d21a1216f834395340fb9c5024c604d40e19666502e7dafde836'
            'e4b235576964209ca5f11df2185e7255010c2dc2baea0b72327bbe8f6bbe2c52'
            '024b7f7859eaba144950b3cc2d9a0a97694ec99babc30c421490ba25f9012139')
