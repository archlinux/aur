pkgname=rsyslog
pkgver=8.2006.0
pkgrel=1
pkgdesc="An enhanced multi-threaded syslogd with a focus on security and reliability"
url="http://www.rsyslog.com/"
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3')
depends=('libestr' 'liblogging' 'librelp' 'libfastjson')
makedepends=('postgresql-libs>=8.4.1' 'libmariadbclient' 'net-snmp' 'gnutls'
	     'python-docutils' 'libestr' 'liblogging' 'librelp' 'libfastjson')
optdepends=('postgresql-libs: PostgreSQL Database Support'
	    'libmariadbclient: MySQL Database Support'
	    'net-snmp'
	    'gnutls')
backup=('etc/rsyslog.conf'
	'etc/logrotate.d/rsyslog')
options=('strip' 'zipman')
source=("https://github.com/rsyslog/rsyslog/archive/v${pkgver}.tar.gz"
	'rsyslog.logrotate'
	'rsyslog.conf'
        'rsyslog.service')

sha256sums=('dc30a2ec02d5fac91d3a4f15a00641e0987941313483ced46592ab0b0d68f324'
            '0f5bea3fd4dff2c9f097bf95768b2e1f6e9cfd9a08eab98bc3b3b4d2ed44119a'
            'bc7ea11a697c20cdaa6730cfa0b4465cef0fec0e3f6b39aeff8deae9756aafbb'
            '81b9f9b78395405b679849143a6709911d00e9317928fdb2a2540f52965847c2')
install=$pkgname.install

prepare() {
  cd "$srcdir"/${pkgname}-${pkgver}
  sed -i rsyslog.service.in \
    -e 's|rsyslogd -n|rsyslogd -n -i /run/rsyslogd.pid|' \
    -e '/ExecStart=.*$/iPIDFile=/run/rsyslogd.pid'
}

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr \
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
              --with-systemdsystemunitdir=/usr/lib/systemd/system

  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make install DESTDIR="$pkgdir"
  install -D -m644 "$srcdir"/${pkgname}.conf "$pkgdir"/etc/${pkgname}.conf
  install -D -m644 "$srcdir"/${pkgname}.logrotate "$pkgdir"/etc/logrotate.d/${pkgname}
  install -D -m644 "$srcdir"/${pkgname}.service "$pkgdir"/usr/lib/systemd/system/${pkgname}.service
}
