# $Id: $
# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>

pkgname=clickhouse
pkgver=18.16.1
pkgrel=1
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time'
arch=('i686' 'x86_64')
url='https://clickhouse.yandex/'
license=('Apache')
depends=('ncurses' 'readline' 'unixodbc' 'termcap' 'double-conversion' 'capnproto' 're2' 'gtest' 'gsasl' 'libxml2' 'llvm')
makedepends=('cmake' 'patchelf')
source=(https://github.com/yandex/ClickHouse/archive/v$pkgver-stable.tar.gz
        https://github.com/google/cctz/archive/4f9776a.tar.gz
        https://github.com/edenhill/librdkafka/archive/7478b5e.tar.gz
        https://github.com/lz4/lz4/archive/c10863b.tar.gz
        https://github.com/facebook/zstd/archive/2555975.tar.gz
        https://github.com/Dead2/zlib-ng/archive/9173b89.tar.gz
        https://github.com/ClickHouse-Extras/poco/archive/fe5505e.tar.gz
        https://github.com/ClickHouse-Extras/boost-extra/archive/6883b40.tar.gz
        https://github.com/ClickHouse-Extras/ssl/archive/dbbbcdb.tar.gz
        https://github.com/jemalloc/jemalloc/archive/cd2931a.tar.gz
        https://github.com/aklomp/base64/archive/a27c565.tar.gz
        https://github.com/ClickHouse-Extras/libhdfs3/archive/bd6505c.tar.gz
        https://github.com/MariaDB/mariadb-connector-c/archive/d85d0e9.tar.gz
        https://github.com/ClickHouse-Extras/protobuf/archive/1273537.tar.gz
        libunwind.patch)
md5sums=('d05c626a825f7b1253bf65e82df8f8b3'
         '5323f7ba2565a84a80a93edde95eb4fe'
         '7d9c187a8afedde260fadf2f1d5f46a2'
         '7b92f0554687e6a8949adc5c10aeff78'
         'aaa86ec9f379ef587cc53f7b96bcc0e7'
         '8a7abcc6998e461605ecb2988ff93dfc'
         'aa322f75107a4c8a364a38bfd5c7698f'
         '3e95c80139b4450f3e1505a71d3ea369'
         '31f887f0dcea406ca589ceb12db8bb93'
         '1aad51c731b082d40c15be2804cd0ff3'
         'e98c6b94f39d6947c83eb554aeb618e2'
         '2fa16f04d0d533cbb5797bfd45b058fd'
         '27814edb68495deacac7ef3569ac2437'
         'd63e8036385a27113365a40eb6bfe75e'
         'f3f60b75abf8d6f21de74db6e88e1e7b')
backup=('etc/clickhouse-client/config.xml' 'etc/clickhouse-server/config.xml' 'etc/clickhouse-server/users.xml')
install=$pkgname.install

prepare() {
  cd ClickHouse-$pkgver-stable
  sed -e 's/mysqlxx common\(.*\) \(\${Z_LIB}\)/mysqlxx \2 common\1/' -i libs/libmysqlxx/CMakeLists.txt
  patch -p1 < ../libunwind.patch
  mkdir -p contrib/cctz contrib/librdkafka contrib/lz4 contrib/zstd contrib/base64 contrib/libhdfs3 contrib/mariadb-connector-c contrib/protobuf
  rm -rf contrib/{cctz,librdkafka,lz4,zstd,zlib-ng,poco,boost,ssl,base64,libhdfs3,mariadb-connector-c,jemalloc,protobuf}/*
  mv ../cctz-4f9776a*/* contrib/cctz/
  mv ../librdkafka-7478b5e*/* contrib/librdkafka/
  mv ../lz4-c10863b*/* contrib/lz4/
  mv ../zstd-2555975*/* contrib/zstd/
  mv ../zlib-ng-9173b89*/* contrib/zlib-ng/
  mv ../poco-fe5505e*/* contrib/poco/
  mv ../boost-extra-6883b40*/* contrib/boost/
  mv ../ssl-dbbbcdb*/* contrib/ssl/
  mv ../jemalloc-cd2931a*/* contrib/jemalloc/
  mv ../base64-a27c565*/* contrib/base64/
  mv ../libhdfs3-bd6505c*/* contrib/libhdfs3/
  mv ../mariadb-connector-c-d85d0e9*/ contrib/mariadb-connector-c/
  mv ../protobuf-1273537*/ contrib/protobuf/
  for dir in contrib/*/; do
    rmdir $dir &> /dev/null || true
  done
}

build() {
  cd ClickHouse-$pkgver-stable
  cmake -D CMAKE_BUILD_TYPE:STRING=Release -D USE_STATIC_LIBRARIES:BOOL=False -D ENABLE_TESTS:BOOL=False -D UNBUNDLED:BOOL=False -D USE_INTERNAL_DOUBLE_CONVERSION_LIBRARY:BOOL=False -D USE_INTERNAL_CAPNP_LIBRARY:BOOL=False -D USE_INTERNAL_POCO_LIBRARY:BOOL=True -D POCO_STATIC:BOOL=True -D USE_INTERNAL_RE2_LIBRARY:BOOL=False -D USE_INTERNAL_LIBGSASL_LIBRARY:BOOL=False -D USE_INTERNAL_GTEST_LIBRARY:BOOL=False -D USE_INTERNAL_LIBXML2_LIBRARY:BOOL=False -D USE_INTERNAL_LLVM_LIBRARY:BOOL=False -D NO_WERROR=1 .
  cmake --build . --target clickhouse
}

package() {
  cd ClickHouse-$pkgver-stable
  mkdir -p $pkgdir/etc/clickhouse-server/ $pkgdir/etc/clickhouse-client/
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/lib/systemd/system
  ln -s clickhouse-client $pkgdir/usr/bin/clickhouse-server
  cp dbms/programs/server/config.xml dbms/programs/server/users.xml $pkgdir/etc/clickhouse-server/
  cp dbms/programs/clickhouse $pkgdir/usr/bin/clickhouse-client
  patchelf --remove-rpath $pkgdir/usr/bin/clickhouse-client
  patchelf --replace-needed libz.so.1 libz-ng.so.1 $pkgdir/usr/bin/clickhouse-client
  cp dbms/programs/client/clickhouse-client.xml $pkgdir/etc/clickhouse-client/config.xml
  cp dbms/libclickhouse.so.$pkgver $pkgdir/usr/lib/libclickhouse.so.$pkgver
  cp contrib/zlib-ng/libz.so.1 $pkgdir/usr/lib/libz-ng.so.1
  sed -e 's:/opt/clickhouse:/var/lib/clickhouse:g' -i $pkgdir/etc/clickhouse-server/config.xml
  sed -e '/listen_host/s%::<%::1<%' -i $pkgdir/etc/clickhouse-server/config.xml
  cp debian/clickhouse-server.service $pkgdir/usr/lib/systemd/system
}

# vim:set ts=2 sw=2 et:
