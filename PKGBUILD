pkgname=zabbix-server-mysql
pkgver=2.0.1
pkgrel=1
pkgdesc="Software for monitoring of your applications, network and servers."
arch=('i686' 'x86_64')
url="http://www.zabbix.com/"
license=('GPL')
depends=('apache' 'mysql' 'php' 'php-apache' 'php-gd' 'fping' 'traceroute' 'net-snmp' 'curl' 'iksemel' 'libssh2')
backup=('etc/zabbix/zabbix_server.conf'
        'etc/conf.d/zabbix-server'
        )
install='zabbix-server.install'
options=('emptydirs')
source=("http://downloads.sourceforge.net/sourceforge/zabbix/zabbix-$pkgver.tar.gz"
        'rc.zabbix-server'
        'conf.zabbix-server'
        'zabbix-server.install'
        )
md5sums=('3b301aa4f2b7cb5ede46884b9c7873e1'
         'c56242d58e60c167fb31ac34b25ee64d'
         '433c31251286f67650123fa18f7ff834'
         'fb39e61ef9cbc7d35ac27a90661b083c')
sha1sums=('ca7d548f6ddb1f963958357ed5ddaf2fbceed104'
          'ff7acb3012ff95a0b6b02496aab85eb0fc281581'
          '4b4423af5587d59ab68ba748242183193729ec32'
          '0c67a10fc43af6f295a5946b3df914d494cd54f6')

_HTMLPATH='srv/http/zabbix'

build() {
  cd "$srcdir/zabbix-$pkgver"

  ./configure \
    --prefix=/usr \
    --enable-ipv6 \
    --enable-server \
    --with-mysql \
    --with-net-snmp \
    --with-jabber \
    --with-libcurl \
    --with-ssh2 \
    --sysconfdir=/etc/zabbix

  make
}

package() {
  cd "$srcdir/zabbix-$pkgver"

  make DESTDIR="$pkgdir" install

  install -d -m0750 $pkgdir/var/run/zabbix
  install -d -m0750 $pkgdir/var/log/zabbix

  _DBPATCHDIR="$pkgdir/etc/zabbix/database/mysql/upgrade/2.0"
  _DBSETUPDIR="$pkgdir/etc/zabbix/database/mysql/setup/2.0"
  mkdir -p $_DBPATCHDIR
  mkdir -p $_DBSETUPDIR
  install -D -m 0444 upgrades/dbpatches/2.0/mysql/patch.sql $_DBPATCHDIR/patch.sql
  install -D -m 0444 upgrades/dbpatches/2.0/mysql/rc4_rc5.sql $_DBPATCHDIR/rc4_rc5.sql
  install -D -m 0444 upgrades/dbpatches/2.0/mysql/upgrade $_DBPATCHDIR/upgrade
  install -D -m 0444 database/mysql/data.sql $_DBSETUPDIR/data.sql
  install -D -m 0444 database/mysql/images.sql $_DBSETUPDIR/images.sql
  install -D -m 0444 database/mysql/schema.sql $_DBSETUPDIR/schema.sql

  mkdir -p $pkgdir/$_HTMLPATH/
  cp -r frontends/php/* $pkgdir/$_HTMLPATH/
  chown -R 33:33 $pkgdir/$_HTMLPATH/
  chmod -R u=rwX,g=rX,o= $pkgdir/$_HTMLPATH/

  install -D -m 0640 conf/zabbix_server.conf $pkgdir/etc/zabbix/zabbix_server.conf

  install -D -m 0755 $srcdir/rc.zabbix-server $pkgdir/etc/rc.d/$pkgname
  install -D -m 0622 $srcdir/conf.zabbix-server $pkgdir/etc/conf.d/$pkgname
}
