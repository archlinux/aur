# $Id$
# Maintainer: Marton Suranyi <marton.suranyi@gmail.com>

pkgname=syslog-ng-latest
shortname=syslog-ng
pkgver=3.9.1
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

source=(https://github.com/balabit/syslog-ng/releases/download/${shortname}-${pkgver}/${shortname}-${pkgver}.tar.gz
        syslog-ng.conf syslog-ng.logrotate)
sha1sums=('1ca437393d8895654452bef8ac0b996fe73284f8'
          '273990d01e1f044dc090bba8098161dc12dd24ea'
          '949128fe3d7f77a7aab99048061f885bc758000c')

prepare() {
  cd $shortname-$pkgver
  sed -i -e 's,/bin/,/usr/bin/,' -e 's,/sbin/,/bin/,' contrib/systemd/syslog-ng.service
}

build() {
  cd $shortname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/syslog-ng --libexecdir=/usr/lib \
    --sbindir=/usr/bin --localstatedir=/var/lib/syslog-ng --datadir=/usr/share/syslog-ng \
    --with-pidfile-dir=/run --disable-spoof-source --enable-ipv6 --enable-sql \
    --enable-systemd --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-manpages --with-jsonc=system
  make
}

check() {
  cd $shortname-$pkgver
  make check
}

package() {
  make -C $shortname-$pkgver DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/var/lib/syslog-ng" "$pkgdir/etc/syslog-ng/patterndb.d"
  install -Dm644 "$srcdir/syslog-ng.conf" "$pkgdir/etc/syslog-ng/syslog-ng.conf"
  install -Dm644 "$srcdir/syslog-ng.logrotate" "$pkgdir/etc/logrotate.d/syslog-ng"
}
