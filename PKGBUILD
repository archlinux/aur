# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kdb-git
pkgver=3.0.90.r2115.52b4f7e
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
sha256sums=('SKIP')

pkgver() {
  cd kdb
  _ver="$(cat CMakeLists.txt | grep -m1 'KDb VERSION' | grep -o "[[:digit:]]*" | paste -sd'.')"
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
    -DBUILD_TESTING=OFF \
    -DPYTHON_EXECUTABLE="/usr/bin/python2"
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
