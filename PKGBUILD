# $Id: $
# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>

pkgname=clickhouse
pkgver=1.1.54236
pkgrel=1
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time'
arch=('i686' 'x86_64')
url='https://clickhouse.yandex/'
license=('Apache')
depends=('ncurses' 'readline' 'unixodbc' 'termcap')
makedepends=('poco' 'cmake' 'gcc6')
source=(https://github.com/yandex/ClickHouse/archive/v$pkgver-stable.tar.gz
        clickhouse-server.service
        re2-length.patch)
md5sums=('78083caddfdc9b2fead32d11ea8609b8'
         'f9f5663b0a9a58e99f481efe9d193e85'
         '143f0146c3ef3a6832191fba352b70c4')
backup=('etc/clickhouse-client/config.xml' 'etc/clickhouse-server/config.xml' 'etc/clickhouse-server/users.xml')
install=$pkgname.install

build() {
  cd ClickHouse-$pkgver-stable
  sed -e 's/mysqlxx common\(.*\) \(\${Z_LIB}\)/mysqlxx \2 common\1/' -i libs/libmysqlxx/CMakeLists.txt
  patch -p1 < ../re2-length.patch
  export CC=gcc-6
  export CXX=g++-6
  cmake -D CMAKE_BUILD_TYPE:STRING=Release -D USE_STATIC_LIBRARIES:BOOL=False -D ENABLE_TESTS:BOOL=False -D UNBUNDLED:BOOL=False .
  make clickhouse
}

package() {
  cd ClickHouse-$pkgver-stable
  mkdir -p $pkgdir/etc/clickhouse-server/ $pkgdir/etc/clickhouse-client/
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/lib/systemd/system
  ln -s clickhouse-client $pkgdir/usr/bin/clickhouse-server
  cp dbms/src/Server/config.xml dbms/src/Server/users.xml $pkgdir/etc/clickhouse-server/
  cp dbms/src/Server/clickhouse $pkgdir/usr/bin/clickhouse-client
  cp dbms/src/Client/config.xml $pkgdir/etc/clickhouse-client/
  cp dbms/libclickhouse.so.1 $pkgdir/usr/lib/libclickhouse.so.$pkgver
  sed -e 's:/opt/clickhouse:/var/lib/clickhouse:g' -i $pkgdir/etc/clickhouse-server/config.xml
  sed -e '/listen_host/s%::<%::1<%' -i $pkgdir/etc/clickhouse-server/config.xml
  cp $startdir/clickhouse-server.service $pkgdir/usr/lib/systemd/system
}

# vim:set ts=2 sw=2 et:
