pkgname=rsyslog
pkgver=8.2608.0
pkgrel=1
pkgdesc="An enhanced multi-threaded syslogd with a focus on security and reliability"
url="http://www.rsyslog.com/"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('LGPL-3.0-only' 'GPL-3.0-only' 'Apache-2.0')
depends=('libestr' 'liblogging' 'librelp' 'libfastjson' 'protobuf-c' 'snappy' 'libyaml')
makedepends=('postgresql-libs>=8.4.1' 'libmariadbclient' 'net-snmp' 'gnutls' 'autoconf-archive'
	     'python-docutils' 'libestr' 'liblogging' 'librelp' 'libfastjson' 'bison' 'flex')
optdepends=('postgresql-libs: PostgreSQL Database Support'
	    'libmariadbclient: MySQL Database Support'
	    'net-snmp'
	    'gnutls')
backup=('etc/rsyslog.conf'
	'etc/logrotate.d/rsyslog')
options=('strip' 'zipman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rsyslog/rsyslog/archive/v${pkgver}.tar.gz"
        'rsyslog.logrotate'
        'rsyslog.conf'
        'rsyslog.service'
        'rsyslog.tmpfiles'
        )

sha256sums=('addd5b8394c11c6e876769aaa546909ee47eaaa898d2bd352d447df9f822b777'
            '0f5bea3fd4dff2c9f097bf95768b2e1f6e9cfd9a08eab98bc3b3b4d2ed44119a'
            'bc7ea11a697c20cdaa6730cfa0b4465cef0fec0e3f6b39aeff8deae9756aafbb'
            '81b9f9b78395405b679849143a6709911d00e9317928fdb2a2540f52965847c2'
            'b287a96834da6cbb0b539d50171ac27bcf677505145fb935da72f751987df686')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  #patch configure.ac ../5406.patch
  ./autogen.sh --prefix=/usr \
               --sbindir=/usr/bin \
               --enable-mysql \
               --enable-pgsql \
               --enable-mail \
               --enable-imfile \
               --enable-snmp \
               --enable-gnutls \
               --enable-inet \
               --enable-imjournal \
               --enable-omjournal \
               --enable-relp \
               --enable-impstats \
               --enable-imptcp \
               --enable-omprog \
               --with-systemdsystemunitdir=/usr/lib/systemd/system \
               HAVE_PKG_CONFIG=yes

  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make install DESTDIR="$pkgdir"
  install -D -m644 "$srcdir"/${pkgname}.conf "$pkgdir"/etc/${pkgname}.conf
  install -D -m644 "$srcdir"/${pkgname}.logrotate "$pkgdir"/etc/logrotate.d/${pkgname}
  install -D -m644 "$srcdir"/${pkgname}.service "$pkgdir"/usr/lib/systemd/system/${pkgname}.service
  install -D -m644 "$srcdir"/${pkgname}.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/${pkgname}.conf
}
