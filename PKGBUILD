pkgname=zabbix-server-mysql
pkgver=2.0.2
pkgrel=1
pkgdesc="Software for monitoring of your applications, network and servers."
arch=('i686' 'x86_64')
url="http://www.zabbix.com/"
license=('GPL')
depends=('apache' 'mysql' 'php' 'php-apache' 'php-gd' 'fping' 'traceroute'
         'net-snmp' 'nmap' 'sudo' 'curl' 'iksemel' 'libssh2'
        )
conflicts=('zabbix-server')
backup=('etc/zabbix/zabbix_server.conf'
        'etc/conf.d/zabbix-server'
       )
install='zabbix-server.install'
options=('emptydirs')
source=("http://downloads.sourceforge.net/sourceforge/zabbix/zabbix-$pkgver.tar.gz"
        'rc.zabbix-server'
        'conf.zabbix-server'
        'sudoers.zabbix-server'
        'zabbix-server.install'
        'frontend.diff'
       )
md5sums=('81d99680bafe14a6c9945b71c97988ca'
         '3bb7c9b323487bda46d123304a963315'
         '433c31251286f67650123fa18f7ff834'
         '228d6609c0f2364f1268d7b24b4756a4'
         'fb39e61ef9cbc7d35ac27a90661b083c'
         'c9621c29f6db72dbdf6db7b5fb847642'
        )
sha1sums=('aaa678bc6abc6cb2b174e599108ad19f187047c9'
          'a328714dcfd7514b334dcf0df2c87f424ee1a691'
          '4b4423af5587d59ab68ba748242183193729ec32'
          '5711484ecd0efc4769b975cfff77911c2044fd18'
          '0c67a10fc43af6f295a5946b3df914d494cd54f6'
          '2c48e4272cf0043030e6fc369468829e09996571'
         )

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
  cd $pkgdir/$_HTMLPATH/locale/ru/LC_MESSAGES/
  cat $srcdir/frontend.diff | patch -p1
  cd $pkgdir/$_HTMLPATH/locale/
  ./update_po.sh
  ./make_mo.sh
  cd $startdir
  chown -R 33:33 $pkgdir/$_HTMLPATH/
  chmod -R u=rwX,g=rX,o= $pkgdir/$_HTMLPATH/

  install -D -m 0640 $srcdir/zabbix-$pkgver/conf/zabbix_server.conf $pkgdir/etc/zabbix/zabbix_server.conf
  install -D -m 0755 $srcdir/rc.zabbix-server $pkgdir/etc/rc.d/zabbix-server
  install -D -m 0622 $srcdir/conf.zabbix-server $pkgdir/etc/conf.d/zabbix-server
  install -D -m 0440 $srcdir/sudoers.zabbix-server $pkgdir/etc/sudoers.d/zabbix-server
}
