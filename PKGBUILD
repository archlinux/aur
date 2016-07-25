# Maintainer: Idares <idares at seznam dot cz>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=zabbix-server
pkgver=3.0.4
pkgrel=1
pkgdesc="Software designed for monitoring availability and performance of IT infrastructure components"
arch=('i686' 'x86_64')
url="http://www.zabbix.com"
license=('GPL')
depends=('postgresql-libs' 'php' 'php-pgsql' 'php-gd' 'fping' 'net-snmp' 'curl' 'libxml2' 'iksemel')
backup=('etc/zabbix/zabbix_server.conf')
install='zabbix-server.install'
options=('emptydirs')
source=("http://downloads.sourceforge.net/sourceforge/zabbix/zabbix-$pkgver.tar.gz"
        'zabbix-server.install'
        'zabbix-server.service'
		'zabbix-server.tmpfiles'
        )

_HTMLPATH='usr/share/webapps/zabbix'

build() {
  cd "$srcdir/zabbix-$pkgver"

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --enable-server \
    --enable-ipv6 \
    --with-net-snmp \
    --with-libcurl \
    --with-postgresql \
    --with-libxml2 \
    --with-jabber \
    --with-openssl \
    --sysconfdir=/etc/zabbix

  make
}

package() {
  cd "$srcdir/zabbix-$pkgver"

  make DESTDIR="$pkgdir" install

  # Create data dirs required
  install -d -m0750 $pkgdir/var/log/zabbix

  # database schema
  _DBSCHEMADIR="$pkgdir/etc/zabbix/database/postgresql"
  mkdir -p $_DBSCHEMADIR
  for _SQLFILE in {schema,data,images}.sql; do
    install -D -m 0444 database/postgresql/$_SQLFILE $_DBSCHEMADIR/$_SQLFILE
  done

  # db upgrades

  for _DBPATCH in upgrades/dbpatches/*/postgresql/*; do
	  install -D -m 0444 $_DBPATCH $_DBSCHEMADIR/${_DBPATCH#upgrades/}
  done
  install -D -m 0444 upgrades/dbpatches/2.2/README $_DBSCHEMADIR/dbpatches/README

  # frontends
  mkdir -p $pkgdir/$_HTMLPATH/
  cp -r frontends/php/* $pkgdir/$_HTMLPATH/
  chown -R http:http $pkgdir/$_HTMLPATH/
  chmod -R u=rwX,g=rX,o= $pkgdir/$_HTMLPATH/

  # default configuration files
  install -D -m 0640 conf/zabbix_server.conf $pkgdir/etc/zabbix/zabbix_server.conf

  # change pid file location
  sed -i 's:# PidFile=.*:PidFile=/run/zabbix/zabbix_server.pid:' $pkgdir/etc/zabbix/zabbix_server.conf
  # change log file location
  sed -i 's:^LogFile=.*:LogFile=/var/log/zabbix/zabbix_server.log:' $pkgdir/etc/zabbix/zabbix_server.conf

  # service file
  install -D -m 0644 $srcdir/zabbix-server.service $pkgdir/usr/lib/systemd/system/zabbix-server.service

  # tmpfile
  install -D -m 0644 $srcdir/zabbix-server.tmpfiles $pkgdir/usr/lib/tmpfiles.d/zabbix-server.conf
}

md5sums=('7c45d37000e67d75042695344c9937e0'
         '1881e6a0a9683745f07ab86e14b3f37e'
         '7200c01662be3a1d364c280ff2a818ac'
         '9ce692356b4ac0a71595ce55fe3b44c1')
sha1sums=('91a1c65b59584b5114f5c1287b24a28e7bf56699'
          'fccab5531dd8aab043ad2c0906597a28d3cdc9a4'
          '7db689838d1f7985b75f91fb319227c3211bab7d'
          '8926befcb944732fd59a34c89b569d3fbef1ca9d')

md5sums=('a164b27ef80221429fc9a39eab0b7b9c'
         '1881e6a0a9683745f07ab86e14b3f37e'
         '7200c01662be3a1d364c280ff2a818ac'
         '9ce692356b4ac0a71595ce55fe3b44c1')
sha1sums=('6ef79266e10f561801d4bf4895557c720cb5feb6'
          'fccab5531dd8aab043ad2c0906597a28d3cdc9a4'
          '7db689838d1f7985b75f91fb319227c3211bab7d'
          '8926befcb944732fd59a34c89b569d3fbef1ca9d')
