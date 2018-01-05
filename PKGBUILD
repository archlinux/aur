# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=dspam
pkgver=3.10.2
pkgrel=15
pkgdesc="A scalable, open-source statistical anti-spam filter"
arch=('x86_64')
url="http://nuclearelephant.com/"
backup=('etc/dspam/dspam.conf'
	'srv/http/dspam/cgi-bin/admins'
	'srv/http/dspam/cgi-bin/subadmins')
license=("GPL")
depends=(readline libcap ncurses zlib openssl)
makedepends=('libmariadbclient' 'postgresql-libs' 'db' 'sqlite' 'libldap')
optdepends=('libmariadbclient: MariaDB support'
	    'postgresql-libs: PostgreSQL support'
	    'db: BerkeleyDB support'
	    'sqlite: SQLite support'
	    'clamav: ClamAV support'
	    'libldap: external lookup support')
options=('zipman' 'docs')
install=$pkgname.install
validpgpkeys=('C26F374F5E13157B5B427A1B93DF319D7D54EFF5')
source=(http://downloads.sourceforge.net/project/dspam/dspam/dspam-$pkgver/dspam-$pkgver.tar.gz{,.asc}
	dspam.logrotated
	dspam.service
	dspam.tmpfiles
	dspam_maintenance.cron)
sha256sums=('ae76569604021f35b741fb95198a1e611a8c64c3838661973a6cf360bba593a9'
            'SKIP'
            '4177ff6d65011ff72d22389d7af4a13feaad034d3d68d9fafb7f5dc2518952de'
            'd1088a4ba9e7c4ee17915b9955a20af826a3d6ccd75d92873510e51a00394bc8'
            '7b7e44e081e6accb909b9af3663f416b7dbe030c1326355737f3150021a82bf4'
            '054297d274acb3622653bb1ddf0af92721d8cdd7521ba31ecca7491004879ebb')

build() {
  OPTS="--with-dspam-owner=dspam --with-dspam-group=dspam --with-dspam-home-group=dspam --with-dspam-mode=2510 \
	--enable-daemon --enable-virtual-users --enable-large-scale --enable-long-usernames --enable-external-lookup \
	--enable-split-configuration --enable-syslog --enable-clamav \
	--with-dspam-home=/var/lib/dspam --with-logdir=/var/log/dspam --with-logfile=/var/log/dspam/dspam.log \
	--with-mysql-includes=/usr/include/mysql --with-mysql-libraries=/usr/lib \
	--with-storage-driver="hash_drv,mysql_drv,libdb4_drv,pgsql_drv,sqlite3_drv" --enable-preferences-extension"

  export CFLAGS="-O2"
  unset LDFLAGS

  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/dspam --localstatedir=/var ${OPTS}
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir"/srv/http/dspam
  cp -a webui/* "$pkgdir"/srv/http/dspam/
  find "$pkgdir"/srv/http/dspam/ -type f -name 'Makefile*' -exec rm -f {} \;
  find "$pkgdir"/srv/http/dspam/ -type f -name '*.in' -exec rm -f {} \;

  install -d "$pkgdir"/etc/logrotate.d \
	     "$pkgdir"/usr/share/dspam/{mysql,pgsql}
  install -m644 ../dspam.logrotated "$pkgdir"/etc/logrotate.d/dspam

  sed -i 's|#ServerPID|ServerPID|' "$pkgdir"/etc/dspam/dspam.conf

  sed -e 's:^#*\(ServerDomainSocketPath[\t ]\{1,\}\).*:\1\"/run/dspam/dspam.sock\":gI' \
				-e 's:^#*\(ServerPID[\t ]\{1,\}\).*:\1/run/dspam/dspam.pid:gI' \
				-i "$pkgdir"/etc/dspam/dspam.conf

  sed -i 's|/var/lib/mysql/mysql.sock|/run/mysqld/mysqld.sock|' "$pkgdir"/etc/dspam/dspam.conf

  cp -r src/tools.mysql_drv/*.sql "$pkgdir"/usr/share/dspam/mysql
  cp -r src/tools.pgsql_drv/*.sql "$pkgdir"/usr/share/dspam/pgsql

  # install dspam_maintenance from contrib/
  install -Dm0755 contrib/dspam_maintenance/dspam_maintenance.sh "$pkgdir"/usr/bin/dspam_maintenance
  install -Dm0644 contrib/dspam_maintenance/dspam_maintenance.1 "$pkgdir"/usr/share/man/man1/dspam_maintenance.1
  install -Dm0755 "$srcdir"/dspam_maintenance.cron "$pkgdir"/etc/cron.daily/dspam_maintenance

  cd "$pkgdir"/usr/share/man/man3
  find -type l -exec ln -sf libdspam.3 {} \;

  # make logrotate happy
  chmod 750 "$pkgdir"/var/log/dspam

  install -Dm0644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -Dm0644 "$srcdir"/$pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
}
