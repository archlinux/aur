# $Id: PKGBUILD 272173 2017-12-04 22:15:16Z arojas $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=rsyslog
pkgver=8.31.0
pkgrel=1
pkgdesc="An enhanced multi-threaded syslogd with a focus on security and reliability"
url="http://www.rsyslog.com/"
arch=('x86_64')
license=('GPL3')
depends=('libestr' 'liblogging' 'librelp' 'libfastjson')
makedepends=('postgresql-libs>=8.4.1' 'libmariadbclient' 'net-snmp' 'gnutls'
	     'python-docutils')
optdepends=('postgresql-libs: PostgreSQL Database Support'
	    'libmariadbclient: MySQL Database Support'
	    'net-snmp'
	    'gnutls')
backup=('etc/rsyslog.conf'
	'etc/logrotate.d/rsyslog')
options=('strip' 'zipman')
source=("http://www.rsyslog.com/files/download/rsyslog/rsyslog-$pkgver.tar.gz"
	'rsyslog.logrotate'
	'rsyslog.conf')
sha256sums=('eee6318f8127f56500c1e1f672fac6207eeb87bbf0985f5af964f881a96601b2'
            '0f5bea3fd4dff2c9f097bf95768b2e1f6e9cfd9a08eab98bc3b3b4d2ed44119a'
            '5fd51665ab9a81fbb24773068cb261b8dec073d74082c121633f49b9381d9a3f')

prepare() {
  cd "$srcdir"/${pkgname}-${pkgver}
  sed -i rsyslog.service.in \
    -e 's|rsyslogd -n|rsyslogd -n -i /run/rsyslogd.pid|' \
    -e '/ExecStart=.*$/iPIDFile=/run/rsyslogd.pid'
}

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
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
}
