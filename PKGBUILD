# Maintainer: Angel Velasquez <angvp@archlinux.org>  
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=myodbc
pkgver=5.3.4
pkgrel=4
pkgdesc="ODBC driver/connector for mariadb"
arch=(i686 x86_64)
url="http://dev.mysql.com/downloads/connector/odbc/"
depends=('unixodbc' 'libmariadbclient')
makedepends=('cmake' 'gtk2')
optdepends=('gtk2')
license=('GPL')
options=('libtool')
source=("http://cdn.mysql.com/Downloads/Connector-ODBC/5.3/mysql-connector-odbc-$pkgver-src.tar.gz"
	"build-fix.patch")
md5sums=('6974c4dd9096b961267ed6c4c853a07c'
         '24c9fc679801c28015876b8f4a0d8b76')

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
