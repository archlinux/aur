# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=syslog-ng-nosystemd
pkgver=3.6.3
pkgrel=1
pkgdesc="Next-generation syslogd with advanced networking and filtering capabilities"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
groups=('eudev-base')
url="http://www.balabit.com/network-security/syslog-ng/"
depends=('awk' 'eventlog' 'glib2' 'libcap' 'libdbi' 'glib2' 'udev')
makedepends=('flex' 'pkg-config' 'python2' 'libxslt' 'json-c')
optdepends=('logrotate: for rotating log files'
            'json-c: for json-plugin'
            'syslog-ng-openrc: syslog-ng openrc initscript')
provides=("syslog-ng=${pkgver}")
replaces=('syslog-ng' 'syslog-ng-eudev')
conflicts=('syslog-ng' 'syslog-ng-eudev')
backup=('etc/syslog-ng/scl.conf'
        'etc/syslog-ng/syslog-ng.conf'
        'etc/conf.d/syslog-ng'
        'etc/logrotate.d/syslog-ng')
source=("http://www.balabit.com/downloads/files/syslog-ng/sources/$pkgver/source/syslog-ng_$pkgver.tar.gz"
        syslog-ng.conf
        syslog-ng.conf.d
        syslog-ng.logrotate
        syslog-ng.rc)
sha1sums=('33a8983d8324abf88975838149cbb772f5860d8a'
          '3e7ec4f3f68265aaa98f37338f801c5c22b85c17'
          'eb2aa25737e0cb9453c7b058f0e2dcf16abf21cd'
          '949128fe3d7f77a7aab99048061f885bc758000c'
          '94af81a84e3add6653755122cdd5080694de059d')

build() {
  cd "syslog-ng-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/syslog-ng \
    --libexecdir=/usr/lib \
    --sbindir=/usr/bin \
    --localstatedir=/var/lib/syslog-ng \
    --datadir=/usr/share/syslog-ng \
    --with-pidfile-dir=/run \
    --disable-spoof-source \
    --enable-ipv6 \
    --enable-sql \
    --enable-manpages \
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
  install -Dm644 "$srcdir/syslog-ng.conf.d" "$pkgdir/etc/conf.d/syslog-ng"
}
