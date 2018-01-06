# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alois Belaska <lloyd@centrum.cz>

pkgname=sqlitemanager
pkgver=1.2.4
pkgrel=4
pkgdesc="Multilingual web based tool to manage SQLite database"
arch=('any')
license=('GPL')
depends=('php')
options=('!strip')
backup=('etc/webapps/sqlitemanager/config.db'
	'etc/webapps/sqlitemanager/config3.db'
	'etc/webapps/sqlitemanager/config.inc.php')
url='http://sourceforge.net/projects/sqlitemanager'
source=("http://downloads.sourceforge.net/project/sqlitemanager/sqlitemanager/$pkgver/SQliteManager-$pkgver.tar.gz")
md5sums=('4d308b1bf4dcdf2e8d951c80a68ac705')

package() {
  cd "$srcdir"/SQLiteManager-$pkgver

  mkdir -p "$pkgdir"/var/lib/sqlitemanager
  mkdir -p "$pkgdir"/etc/webapps/sqlitemanager
  mkdir -p "$pkgdir"/usr/share/webapps/sqlitemanager

  mv include/config.db "$pkgdir"/etc/webapps/sqlitemanager
  mv include/config3.db "$pkgdir"/etc/webapps/sqlitemanager
  mv include/user_defined.inc.php include/user_defined.inc.php.orig
  rm -f test.sqlite*

  cp -a * "$pkgdir"/usr/share/webapps/sqlitemanager

  cd "$pkgdir"/usr/share/webapps/sqlitemanager

  echo -e "<?\n\
define(\"SQLiteDb\", \"/etc/webapps/sqlitemanager/config.db\");\n\
define(\"DEFAULT_DB_PATH\", \"/var/lib/sqlitemanager\");\n\
?>\n" >include/user_defined.inc.php

  mv include/config.inc.php "$pkgdir"/etc/webapps/sqlitemanager/config.inc.php
  ln -s /etc/webapps/sqlitemanager/config.inc.php include/config.inc.php

  chown -R http:http "$pkgdir"/etc/webapps/sqlitemanager
}
