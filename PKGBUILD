# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kdb-git
pkgver=2.96.3.r1953.d842d28
pkgrel=1
pkgdesc="A database connectivity and creation framework for various database vendors. (GIT version)"
arch=('i686' 'x86_64')
url='https://community.kde.org/KDb'
license=('GPL')
depends=('kcoreaddons')
makedepends=('extra-cmake-modules'
             'git'
             'python2'
             'sqlite'
             'mariadb'
             'libmariadbclient'
             'postgresql-libs'
             )
optdepends=('postgresql-libs: PostgreSQL plugin'
            'libmariadbclient: MySQL plugin'
            'sqlite: SQLite plugin'
            )
conflicts=('kdb')
provides=('kdb')
source=('git://anongit.kde.org/kdb.git')
md5sums=('SKIP')

pkgver() {
  cd kdb
  _ver="$(cat CMakeLists.txt | grep -m1 KDB_VERSION | cut -d '"' -f2)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdb \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
