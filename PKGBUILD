# Maintainer: aksr <aksr at t-com dot me>
pkgname=meowsql-git
pkgver=0.4.1.alpha.r8.gcfab28d
pkgrel=2
pkgdesc="An attempt to port a very useful GUI database client HeidiSQL to C++/Qt"
arch=('i686' 'x86_64')
url="https://github.com/ragnar-lodbrok/meow-sql"
license=('GPL')
depends=(qt5-base mariadb-libs postgresql-libs)
makedepends=('git')
optdepends=('mariadb' 'postgresql')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's!<postgresql/\(libpq-fe.h\)>!<\1>!' db/pg/pg_connection.h \
		db/pg/pg_query_result.h \
		db/data_type/pg_data_type.h \
		db/data_type/pg_connection_data_types.h
}

build() {
	cd "$srcdir/$pkgname"
	qmake-qt5 meow-sql.pro
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 meow-sql $pkgdir/usr/bin/meow-sql
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
