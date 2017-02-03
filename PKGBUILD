# Maintainer: Javier Torres <jtorres@carto.com>
pkgname=carto-sql-api
pkgver=1.43.1.r6.c4e6f3c
pkgrel=1
pkgdesc="Provides a node.js based API for running SQL queries against CARTO"
arch=('x86_64')
url="https://github.com/CartoDB/CartoDB-SQL-API"
license=('BSD')
groups=()
depends=('zip' 'gdal' 'nodejs' 'postgis' 'redis')
makedepends=('git' 'npm')
provides=()
conflicts=()
replaces=()
backup=('etc/carto/sql-api.conf')
options=()
install=
source=('git+https://github.com/CartoDB/CartoDB-SQL-API.git'
        'configuration.patch'
        'carto-sql-api.service')
noextract=()
sha256sums=('SKIP'
            '438218458f657b10ce4127b8dbb9fef20cec4d1b5e40e338e6eeebf283b7c5d3'
            '4f3bf2b93ebd355951d64865fe6919b0ad85584073a334b092d7e78b56c6795d')

pkgver() {
	cd "$srcdir/CartoDB-SQL-API"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/CartoDB-SQL-API"
  patch -p1 < "$srcdir/configuration.patch"
}

build() {
	cd "$srcdir/CartoDB-SQL-API"
  npm install
}

package() {
	cd "$srcdir/CartoDB-SQL-API"
  mkdir -p "$pkgdir/opt/carto/sql-api"
  cp -ar app app.js batch node_modules package.json "$pkgdir/opt/carto/sql-api"

  install -Dm0644 "$srcdir/carto-sql-api.service" "$pkgdir/usr/lib/systemd/system/carto-sql-api.service"
  install -Dm0644 config/environments/development.js.example "$pkgdir/etc/carto/sql-api.conf"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/var/log/carto/sql-api"
}
