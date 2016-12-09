# $Id$
# Maintainer: Marton Suranyi <marton.suranyi@gmail.com>

pkgname=syslog-ng-latest
pkgver=3.8.1
pkgrel=1
pkgdesc="Next-generation syslogd with advanced networking and filtering capabilities"
arch=('i686' 'x86_64' 'arm')
url="http://www.balabit.com/network-security/syslog-ng/"
license=('GPL2' 'LGPL2.1')
conflicts=('syslog-ng')
depends=('awk' 'eventlog' 'systemd' 'glib2' 'libdbi')
makedepends=('python2' 'libxslt' 'json-c')
optdepends=('logrotate: for rotating log files'
	    'json-c: for json-plugin')
backup=('etc/syslog-ng/scl.conf'
        'etc/syslog-ng/syslog-ng.conf'
        'etc/logrotate.d/syslog-ng')

source=(https://github.com/balabit/syslog-ng/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz
        syslog-ng.conf syslog-ng.logrotate)
sha1sums=('e66cc7538eec245b80dda4624671a61932c856c3'
          '621e885bf5f460c190665fad62e47d7edb69a0c8'
          '949128fe3d7f77a7aab99048061f885bc758000c')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e 's,/bin/,/usr/bin/,' -e 's,/sbin/,/bin/,' contrib/systemd/syslog-ng.service
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/syslog-ng --libexecdir=/usr/lib \
    --sbindir=/usr/bin --localstatedir=/var/lib/syslog-ng --datadir=/usr/share/syslog-ng \
    --with-pidfile-dir=/run --disable-spoof-source --enable-ipv6 --enable-sql \
    --enable-systemd --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-manpages --with-jsonc=system
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/var/lib/syslog-ng" "$pkgdir/etc/syslog-ng/patterndb.d"
  install -Dm644 "$srcdir/syslog-ng.conf" "$pkgdir/etc/syslog-ng/syslog-ng.conf"
  install -Dm644 "$srcdir/syslog-ng.logrotate" "$pkgdir/etc/logrotate.d/syslog-ng"
}
