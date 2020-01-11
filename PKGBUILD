# Maintainer: Angel Velasquez <angvp@archlinux.org>  
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=myodbc
pkgver=8.0.18
pkgrel=1
pkgdesc="ODBC driver/connector for mariadb"
arch=(i686 x86_64)
url="http://dev.mysql.com/downloads/connector/odbc/"
depends=('unixodbc' 'libmysqlclient')
makedepends=('cmake' 'gtk2')
optdepends=('gtk2: graphical interface')
license=('GPL')
options=('libtool')
source=("http://cdn.mysql.com/Downloads/Connector-ODBC/8.0/mysql-connector-odbc-$pkgver-src.tar.gz")
md5sums=('07f9d97434542ad94dd709cbfef587df')

prepare() {
  cd $srcdir/mysql-connector-odbc-${pkgver}-src
  patch -p1 <$srcdir/build-fix.patch
}

build() {
  cd $srcdir/mysql-connector-odbc-${pkgver}-src
  export LDFLAGS="-lmysqld"
  cmake -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMYSQLCLIENT_LIB_NAME=libmysqlclient_r.so \
    -DWITH_UNIXODBC=1 .
  make
}

package() {
  cd $srcdir/mysql-connector-odbc-${pkgver}-src
  make DESTDIR=$pkgdir install
  pushd $pkgdir/usr
  rm -rf test
  install -dm0755 share/mysql-connector-odbc
  mv ChangeLog COPYING INSTALL Licenses_for_Third-Party_Components.txt README README.debug \
	share/mysql-connector-odbc/
  popd
}
