# $Id: $
# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>

pkgname=clickhouse
pkgver=1.1.54383
pkgrel=2
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time'
arch=('i686' 'x86_64')
url='https://clickhouse.yandex/'
license=('Apache')
depends=('ncurses' 'readline' 'unixodbc' 'termcap' 'double-conversion' 'capnproto' 're2' 'gtest')
makedepends=('cmake')
source=(https://github.com/yandex/ClickHouse/archive/v$pkgver-stable.tar.gz
        https://github.com/google/cctz/archive/4f9776a.tar.gz
        https://github.com/edenhill/librdkafka/archive/c3d50eb.tar.gz
        https://github.com/lz4/lz4/archive/c10863b.tar.gz
        https://github.com/ClickHouse-Extras/zookeeper/archive/438afae.tar.gz
        https://github.com/facebook/zstd/archive/f4340f4.tar.gz
        https://github.com/Dead2/zlib-ng/archive/e07a52d.tar.gz
        https://github.com/ClickHouse-Extras/poco/archive/8238852.tar.gz
        https://github.com/ClickHouse-Extras/boost/archive/2d5cb2c.tar.gz
        libunwind.patch)
md5sums=('c89a7babff34012e28357094afbfa060'
         '5323f7ba2565a84a80a93edde95eb4fe'
         'ea7f52489fead0712f7d20c450a4b7a0'
         '7b92f0554687e6a8949adc5c10aeff78'
         '822fa96f5ceb235f06d22d2e0c7175a2'
         'e3212525a38d6cc38e26979a10c174ed'
         '87676f8d7fcdea908476029f92b8103f'
         'fc643caa1710523bbd1d69f72577afbe'
         '123c1e981fe28c1240d066af493d83b9'
         'f3f60b75abf8d6f21de74db6e88e1e7b')
backup=('etc/clickhouse-client/config.xml' 'etc/clickhouse-server/config.xml' 'etc/clickhouse-server/users.xml')
install=$pkgname.install

prepare() {
  cd ClickHouse-$pkgver-stable
  sed -e 's/mysqlxx common\(.*\) \(\${Z_LIB}\)/mysqlxx \2 common\1/' -i libs/libmysqlxx/CMakeLists.txt
  patch -p1 < ../libunwind.patch
  mkdir -p contrib/cctz contrib/librdkafka contrib/lz4 contrib/zookeeper contrib/zstd
  rm -rf contrib/{cctz,librdkafka,lz4,zookeeper,zstd,zlib-ng,poco,boost}/*
  mv ../cctz-4f9776a*/* contrib/cctz/
  mv ../librdkafka-c3d50eb*/* contrib/librdkafka/
  mv ../lz4-c10863b*/* contrib/lz4/
  mv ../zookeeper-438afae*/* contrib/zookeeper/
  mv ../zstd-f4340f4*/* contrib/zstd/
  mv ../zlib-ng-e07a52d*/* contrib/zlib-ng/
  mv ../poco-8238852*/* contrib/poco/
  mv ../boost-2d5cb2c*/* contrib/boost/
  for dir in contrib/*/; do
    rmdir $dir &> /dev/null || true
  done
}

build() {
  cd ClickHouse-$pkgver-stable
  cmake -D CMAKE_BUILD_TYPE:STRING=Release -D USE_STATIC_LIBRARIES:BOOL=False -D ENABLE_TESTS:BOOL=False -D UNBUNDLED:BOOL=False -D USE_INTERNAL_DOUBLE_CONVERSION_LIBRARY:BOOL=False -D USE_INTERNAL_CAPNP_LIBRARY:BOOL=False -D USE_INTERNAL_POCO_LIBRARY:BOOL=True -D POCO_STATIC:BOOL=True -D USE_INTERNAL_RE2_LIBRARY:BOOL=False -D NO_WERROR=1 .
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
  cp dbms/src/Server/clickhouse-client.xml $pkgdir/etc/clickhouse-client/config.xml
  cp dbms/libclickhouse.so.1 $pkgdir/usr/lib/libclickhouse.so.$pkgver
  cp contrib/librdkafka/src/librdkafka.so $pkgdir/usr/lib/librdkafka.so
  sed -e 's:/opt/clickhouse:/var/lib/clickhouse:g' -i $pkgdir/etc/clickhouse-server/config.xml
  sed -e '/listen_host/s%::<%::1<%' -i $pkgdir/etc/clickhouse-server/config.xml
  cp debian/clickhouse-server.service $pkgdir/usr/lib/systemd/system
}

# vim:set ts=2 sw=2 et:
