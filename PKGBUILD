# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgbase=luasql
pkgname=('lua-sql-mysql' 'lua-sql-postgres' 'lua-sql-sqlite')
pkgver=2.3.0
pkgrel=9
arch=('x86_64')
url='http://www.keplerproject.org/luasql/'
license=('MIT')
makedepends=('lua' 'libmariadbclient' 'postgresql-libs' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keplerproject/luasql/archive/v$pkgver.tar.gz")
md5sums=('af9f0f3a2313a1fcf88c40700092048d')

prepare() {
  cd $pkgbase-$pkgver
  # Lua 5.3 compat
  sed 's/luaL_optint/(int)luaL_optinteger/' -i src/ls_mysql.c
}

build() {
  cd $pkgbase-$pkgver
  msg2 'Building sqlite support'
  make T=sqlite3 PREFIX=/usr DRIVER_LIBS='-lsqlite3' DRIVER_INCS='-std=c99'
  msg2 'Building PostgreSQL support'
  make T=postgres PREFIX=/usr DRIVER_LIBS='-lpq' DRIVER_INCS='-std=c99'
  msg2 'Building MySQL support'
  make T=mysql PREFIX=/usr DRIVER_LIBS="$(mysql_config --libs)" \
    DRIVER_INCS="$(mysql_config --include) -std=c99"
}

package_lua-sql-mysql() {
  pkgdesc='MySQL module for Lua'
  depends=('lua' 'libmariadbclient')
  conflicts=('luasql-mysql')
  replaces=('luasql-mysql')

  cd $pkgbase-$pkgver
  install -Dm644 src/mysql.so "$pkgdir/usr/lib/lua/5.3/luasql/mysql.so"
  install -Dm644 doc/us/license.html "$pkgdir/usr/share/licenses/$pkgname/license.html"
}

package_lua-sql-postgres() {
  pkgdesc='PostgreSQL module for Lua'
  depends=('lua' 'postgresql-libs')

  cd $pkgbase-$pkgver
  install -Dm644 src/postgres.so "$pkgdir/usr/lib/lua/5.3/luasql/postgres.so"
  install -Dm644 doc/us/license.html "$pkgdir/usr/share/licenses/$pkgname/license.html"
}

package_lua-sql-sqlite() {
  pkgdesc='SQLite module for Lua'
  depends=('lua' 'sqlite')

  cd $pkgbase-$pkgver
  install -Dm644 src/sqlite3.so "$pkgdir/usr/lib/lua/5.3/luasql/sqlite3.so"
  install -Dm644 doc/us/license.html "$pkgdir/usr/share/licenses/$pkgname/license.html"
}

# vim:set ts=2 sw=2 et:
