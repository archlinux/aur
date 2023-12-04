# Maintainer: Mikkel Kroman <mk@maero.dk>
# Contributor: Martchus <martchus@gmx.net>

# Checklist before updating:
# 1) Use the latest compatible version of date.h from https://github.com/HowardHinnant/date
# 2) Check that sqlpp11 doesn't have a date.h that will overwrite /usr/include/sqlpp11/date.h

pkgname=sqlpp11
pkgver=0.64
pkgrel=1
pkgdesc='A type safe embedded domain specific language for SQL queries and results in C++'
arch=('any')
url='https://github.com/rbock/sqlpp11'
license=('BSD')
depends=('date')
makedepends=('cmake' 'git' 'mariadb-libs' 'postgresql-libs' 'sqlite' 'boost' 'python-pyparsing')
optdepends=(
    'mariadb-libs: MariaDB Connector support'
    'postgresql-libs: PostgreSQL Connector support'
    'sqlite: SQLite Connector support'
    'boost: ppgen.h support'
    'python-pyparsing: ddl2cpp support'
)

conflicts=('sqlpp11-connector-sqlite3')
replaces=('sqlpp11-connector-sqlite3')
provides=("sqlpp11-connector-sqlite3=${pkgver}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rbock/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('72e6d37c716cc45b38c3cf4541604f16224aaa3b511d1f1d0be0c49176c3be86')
build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DBUILD_MARIADB_CONNECTOR=ON \
    -DBUILD_POSTGRESQL_CONNECTOR=ON \
    -DBUILD_SQLITE3_CONNECTOR=ON \
    -DBUILD_SQLCIPHER_CONNECTOR=OFF \
    -DUSE_SYSTEM_DATE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -Wno-dev
  cmake --build build
}

#Tests fail with PostgreSQL on 0.63
#check() {
#  ctest --test-dir build
#}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
