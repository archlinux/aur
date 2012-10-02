pkgname=zabbix-server-mysql
pkgver=2.0.3
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
        'zabbix-server.service'
        'conf.zabbix-server'
        'sudoers.zabbix-server'
        'zabbix-server.install'
        'frontend.diff'
       )
md5sums=('bef75dd149abc8a6da4adafc08eb61de' # zabbix-$pkgver.tar.gz
         'af69f7f720e9132da9d4703ffc97ae6a' # rc.zabbix-server
         'bd2d22a6f6e0790db350a1ffaac2c82e' # zabbix-server.service
         '433c31251286f67650123fa18f7ff834' # conf.zabbix-server
         '228d6609c0f2364f1268d7b24b4756a4' # sudoers.zabbix-server
         '557f4197402db95aa2d4f2b91b579e05' # zabbix-server.install
         '4699673e5135c3a7b85a228d610f451c' # frontend.diff
        )
sha1sums=('be8902444890db9fb2c4795e62073ce7eea32d96' # zabbix-$pkgver.tar.gz
          '9ce0898ac0c4f075e33d3540f4930500215f70e5' # rc.zabbix-server
          '527209a21b591ea3511eeb16f243a93d7fcbbcb1' # zabbix-server.service
          '4b4423af5587d59ab68ba748242183193729ec32' # conf.zabbix-server
          '5711484ecd0efc4769b975cfff77911c2044fd18' # sudoers.zabbix-server
          '91ed001fe42e03b56ee4294a54932908c8582637' # zabbix-server.install
          'bc354a6f441b82119ac570ac6893053170f36953' # frontend.diff
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

  make || return 1
  make DESTDIR="$pkgdir" install
}

package() {
  cd "$srcdir/zabbix-$pkgver"

  install -d -m 0750 $pkgdir/var/run/zabbix
  install -d -m 0750 $pkgdir/var/log/zabbix

  _DBPATCHDIR="$pkgdir/etc/zabbix/database/mysql/upgrade/2.0"
  _DBSETUPDIR="$pkgdir/etc/zabbix/database/mysql/setup/2.0"
  mkdir -p $_DBPATCHDIR
  mkdir -p $_DBSETUPDIR

  for _UPGFILE in patch.sql rc4_rc5.sql upgrade; do
    install -D -m 0444 upgrades/dbpatches/2.0/mysql/$_UPGFILE $_DBPATCHDIR/$_UPGFILE
  done
  for _SQLFILE in {data,images,schema}.sql; do
    install -D -m 0444 database/mysql/$_SQLFILE $_DBSETUPDIR/$_SQLFILE
  done

  mkdir -p $pkgdir/$_HTMLPATH/
  cp -r frontends/php/* $pkgdir/$_HTMLPATH/

  cd $pkgdir/$_HTMLPATH/locale/
  patch -p1 < $srcdir/frontend.diff
  ./update_po.sh
  ./make_mo.sh
  cd $startdir

  chown -R 33:33 $pkgdir/$_HTMLPATH/
  chmod -R u=rwX,g=rX,o= $pkgdir/$_HTMLPATH/

  install -D -m 0640 $srcdir/zabbix-$pkgver/conf/zabbix_server.conf $pkgdir/etc/zabbix/zabbix_server.conf
  install -D -m 0640 $srcdir/conf.zabbix-server $pkgdir/etc/conf.d/zabbix-server
  install -D -m 0640 $srcdir/sudoers.zabbix-server $pkgdir/etc/sudoers.d/zabbix-server
  if [ "X_$(pacman -Qsq initscripts | grep initscripts)" = "X_initscripts" ]; then
     install -D -m 0755 $srcdir/rc.zabbix-server $pkgdir/etc/rc.d/zabbix-server
  fi
  if [ "X_$(pacman -Qsq systemd | grep systemd)" = "X_systemd" ]; then
     install -D -m 0644 $srcdir/zabbix-server.service $pkgdir/usr/lib/systemd/system/zabbix-server.service
  fi
}
