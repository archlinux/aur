# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=syslog-ng-nosystemd
pkgver=3.21.1
pkgrel=1
pkgdesc="Next-generation syslogd with advanced networking and filtering capabilities"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
groups=('eudev-base')
url="https://www.syslog-ng.com/products/open-source-log-management/"
depends=('awk' 'glib2' 'libcap' 'libnsl' 'udev' 'json-c' 'curl' 'libnet')
makedepends=('flex' 'pkg-config' 'libxslt' 'mongo-c-driver' 'librabbitmq-c'
             'python' 'libesmtp' 'hiredis' 'libdbi' 'geoip' 'libmaxminddb')
optdepends=('logrotate: for rotating log files'
            'libdbi: for the SQL plugin'
            'librabbitmq-c: for the AMQP plugin'
            'mongo-c-driver: for the MongoDB plugin'
            'python: for the Python plugin'
            'libesmtp: for the SMTP plugin'
            'hiredis: fir the redis plugin'
            'geoip: for the GeoIP plugin'
            'libmaxminddb: for the GeoIP2 plugin'
            'python: for Python-based plugins'
            'syslog-ng-openrc: syslog-ng openrc initscript')
provides=("syslog-ng=${pkgver}")
replaces=('syslog-ng' 'syslog-ng-eudev' 'eventlog')
conflicts=('syslog-ng' 'syslog-ng-eudev' 'eventlog')
backup=('etc/syslog-ng/scl.conf'
        'etc/syslog-ng/syslog-ng.conf'
        'etc/conf.d/initscripts/syslog-ng'
        'etc/logrotate.d/syslog-ng')
source=(https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$pkgver/syslog-ng-$pkgver.tar.gz
        syslog-ng.conf
        syslog-ng.conf.d
        syslog-ng.logrotate
        syslog-ng.rc)
sha256sums=('8d163da5ad79cf3a5f043b2ed0fe18a4888d0d740542703bf2508f0b9996cd25'
            '9175deae0b16c0c8a501919c533695254afefd52daf1dae229077cd8f71d0cd9'
            'fe6ebe5c281b34bad201d9206e607857db9a5a78f03bb4dc4440584dca610f61'
            '93c935eca56854011ea9e353b7a1da662ad40b2e8452954c5b4b5a1d5b2d5317'
            'db643d69e840dfd5d7849e857291f15fd60913527402fde806ce3911e3523063')

prepare() {
  cd "syslog-ng-$pkgver"

  # the version in pkg-config is 0.0.0 and so it won't detect the flags without
  # this. since your version is newer this is an easy fix for now, but should
  # eventually be removed when this bug is fixed:
  # https://bugs.archlinux.org/task/61888
  sed -i -e 's|^LMC_MIN_VERSION="1.0.0"|LMC_MIN_VERSION="0.0.0"|' configure.ac configure
}

build() {
  cd "syslog-ng-$pkgver"

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/syslog-ng \
    --libexecdir=/usr/lib \
    --sbindir=/usr/bin \
    --localstatedir=/var/lib/syslog-ng \
    --datadir=/usr/share \
    --with-pidfile-dir=/run \
    --enable-spoof-source \
    --enable-ipv6 \
    --enable-manpages \
    --enable-all-modules \
    --disable-java \
    --disable-java-modules \
    --disable-riemann \
    --with-python=3 \
    --with-jsonc=system \
    --disable-systemd

  make
}

package() {
  make -C "syslog-ng-$pkgver" DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/var/lib/syslog-ng" "$pkgdir/etc/syslog-ng/patterndb.d"
  install -Dm644 "$srcdir/syslog-ng.conf" "$pkgdir/etc/syslog-ng/syslog-ng.conf"
  install -Dm644 "$srcdir/syslog-ng.logrotate" "$pkgdir/etc/logrotate.d/syslog-ng"
  install -Dm755 "$srcdir/syslog-ng.rc" "$pkgdir/etc/rc.d/syslog-ng"
  install -Dm644 "$srcdir/syslog-ng.conf.d" "$pkgdir/etc/conf.d/initscripts/syslog-ng"
}
