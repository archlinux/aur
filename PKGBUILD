# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=syslog-ng-nosystemd
pkgver=3.14.1
pkgrel=1
pkgdesc="Next-generation syslogd with advanced networking and filtering capabilities"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
groups=('eudev-base')
url="http://www.balabit.com/network-security/syslog-ng/"
depends=('awk' 'glib2' 'libcap' 'libdbi' 'glib2' 'udev')
makedepends=('flex' 'pkg-config' 'libxslt' 'json-c' 'libmongoc' 'librabbitmq-c' 'python')
optdepends=('logrotate: for rotating log files'
            'json-c: for json-plugin'
            'curl: for the HTTP module'
            'librabbitmq-c: for the AMQP plugin'
            'libmongoc: for the MongoDB plugin'
            'python: for the Python plugin'
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
sha256sums=('0245260dc9942a9a07110948151654a60992e039821358da348fb34356c4e944'
            '40dee47045c814fc1ec8537a450ae2de849ab5f931ecc6de1bfde26573839b2b'
            'fe6ebe5c281b34bad201d9206e607857db9a5a78f03bb4dc4440584dca610f61'
            '93c935eca56854011ea9e353b7a1da662ad40b2e8452954c5b4b5a1d5b2d5317'
            'c55c1d78d81f7cda543b8391aa5aaa786224071707b924d43b80749678daf452')

build() {
  cd "syslog-ng-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/syslog-ng \
    --libexecdir=/usr/lib \
    --sbindir=/usr/bin \
    --localstatedir=/var/lib/syslog-ng \
    --datadir=/usr/share \
    --with-pidfile-dir=/run \
    --disable-spoof-source \
    --enable-ipv6 \
    --enable-sql \
    --enable-manpages \
    --with-jsonc=system \
    --with-mongoc=system \
    --with-librabbitmq-client=system \
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

  # See http://lists.balabit.hu/pipermail/syslog-ng/2016-February/022667.html
  rm -r "$pkgdir/usr/share/syslog-ng/include/scl/cim"
}
