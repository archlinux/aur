pkgname=rsyslog
pkgver=8.2508.0
pkgrel=2
pkgdesc="An enhanced multi-threaded syslogd with a focus on security and reliability"
url="http://www.rsyslog.com/"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('GPL3')
depends=('libestr' 'liblogging' 'librelp' 'libfastjson')
makedepends=('postgresql-libs>=8.4.1' 'libmariadbclient' 'net-snmp' 'gnutls'
	     'python-docutils' 'libestr' 'liblogging' 'librelp' 'libfastjson' 'bison' 'flex')
optdepends=('postgresql-libs: PostgreSQL Database Support'
	    'libmariadbclient: MySQL Database Support'
	    'net-snmp'
	    'gnutls')
backup=('etc/rsyslog.conf'
	'etc/logrotate.d/rsyslog')
options=('strip' 'zipman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rsyslog/rsyslog/archive/v${pkgver}.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/rsyslog/rsyslog/pull/5406.patch"
        'rsyslog.logrotate'
        'rsyslog.conf'
        'rsyslog.service')

sha256sums=('4e97b88ed3cbd46972bbd65f26f187bf7dbcab56311c26d9528f23ffabbaa7ec'
            '1036f6a1e90abf3f38d5d50034f54fa5ebe5d6a824e11720b7f6b419765c694c'
            '0f5bea3fd4dff2c9f097bf95768b2e1f6e9cfd9a08eab98bc3b3b4d2ed44119a'
            'bc7ea11a697c20cdaa6730cfa0b4465cef0fec0e3f6b39aeff8deae9756aafbb'
            '81b9f9b78395405b679849143a6709911d00e9317928fdb2a2540f52965847c2')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  patch configure.ac ../5406.patch
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
}
