# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgbase=luasql
pkgname=(lua-sql-mysql lua-sql-postgres lua-sql-sqlite)
pkgver=2.8.0
pkgrel=1
arch=(x86_64)
url='https://keplerproject.github.io/luasql'
license=(MIT)
makedepends=(libmariadbclient
             lua
             postgresql-libs
             sqlite)
_archive="$pkgbase-$pkgver"
source=("https://github.com/keplerproject/luasql/archive/$pkgver/$_archive.tar.gz")
sha256sums=('d568ef516f53ef28e21bf3008169c54ed301e476baadb47d61bfbe6f10de1129')

build() {
	cd "$_archive"
	make sqlite3 PREFIX=/usr DRIVER_LIBS='-lsqlite3' DRIVER_INCS='-std=c99'
	make postgres PREFIX=/usr DRIVER_LIBS='-lpq' DRIVER_INCS='-std=c99'
	make mysql PREFIX=/usr DRIVER_LIBS="$(mysql_config --libs)" \
		DRIVER_INCS="$(mysql_config --include) -std=c99"
}

package_lua-sql-mysql() {
	pkgdesc='MySQL module for Lua'
	depends=(lua libmariadbclient)
	conflicts=(luasql-mysql)
	replaces=(luasql-mysql)
	cd "$_archive"
	install -Dm644 -t "$pkgdir/usr/lib/lua/5.3/luasql/" src/mysql.so
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/us/license.html
}

package_lua-sql-postgres() {
	pkgdesc='PostgreSQL module for Lua'
	depends=(lua postgresql-libs)
	cd "$_archive"
	install -Dm644 -t "$pkgdir/usr/lib/lua/5.3/luasql/" src/postgres.so
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/us/license.html
}

package_lua-sql-sqlite() {
	pkgdesc='SQLite module for Lua'
	depends=(lua sqlite)
	cd "$_archive"
	install -Dm644 -t "$pkgdir/usr/lib/lua/5.3/luasql/" src/sqlite3.so
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/us/license.html
}
