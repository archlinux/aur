# $Id: $
# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>

pkgname=clickhouse
pkgver=19.4.0.49
pkgrel=1
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time'
arch=('i686' 'x86_64')
url='https://clickhouse.yandex/'
license=('Apache')
depends=('arrow' 'cppkafka-git' 'zstd-static' 'jemalloc-git' 'ncurses' 'readline' 'unixodbc' 'termcap' 'double-conversion' 'capnproto' 're2' 'gtest' 'gsasl' 'libxml2' 'llvm' 'brotli' 'lld' 'clang' 'libdaemon' 'poco')
makedepends=('cmake' 'patchelf')
source=(https://github.com/yandex/ClickHouse/archive/v$pkgver-stable.tar.gz
        https://github.com/google/cctz/archive/4f9776a.tar.gz
        https://github.com/edenhill/librdkafka/archive/363dcad.tar.gz
        https://github.com/mfontanini/cppkafka/archive/860c90e.tar.gz
        https://github.com/lz4/lz4/archive/c10863b.tar.gz
        https://github.com/Dead2/zlib-ng/archive/9173b89.tar.gz
        https://github.com/ClickHouse-Extras/boost/archive/6a96e8b.tar.gz
        https://github.com/ClickHouse-Extras/ssl/archive/ba8de79.tar.gz
        https://github.com/aklomp/base64/archive/a27c565.tar.gz
        https://github.com/ClickHouse-Extras/libhdfs3/archive/bd6505c.tar.gz
        https://github.com/ClickHouse-Extras/protobuf/archive/1273537.tar.gz
        https://github.com/apache/thrift/archive/010ccf0.tar.gz
        libunwind.patch)
md5sums=('eb7be28304b18fe3c5aaf5871bea598f'
         '5323f7ba2565a84a80a93edde95eb4fe'
         '858f1e9d37c064a1e5ce99f24ed9cf95'
         '40d91626049ab15bf3bbe75fa00bf52d'
         '7b92f0554687e6a8949adc5c10aeff78'
         '8a7abcc6998e461605ecb2988ff93dfc'
         '649fe83631248b1164d324aca9d85cad'
         'bf1ee7e88660616c92592dd4c1036f61'
         'e98c6b94f39d6947c83eb554aeb618e2'
         '2fa16f04d0d533cbb5797bfd45b058fd'
         'd63e8036385a27113365a40eb6bfe75e'
         '305944814e6124a2b9c2e306fb02ac16'
         'f3f60b75abf8d6f21de74db6e88e1e7b')
backup=('etc/clickhouse-client/config.xml' 'etc/clickhouse-server/config.xml' 'etc/clickhouse-server/users.xml')
install=$pkgname.install

prepare() {
  cd ClickHouse-$pkgver-stable
  sed -e 's/mysqlxx common\(.*\) \(\${Z_LIB}\)/mysqlxx \2 common\1/' -i libs/libmysqlxx/CMakeLists.txt
  patch -p1 < ../libunwind.patch
  mkdir -p contrib/cctz contrib/librdkafka contrib/cppkafka contrib/lz4 contrib/base64 contrib/libhdfs3 contrib/protobuf contrib/thrift
  rm -rf contrib/{cctz,librdkafka,cppkafka,lz4,zlib-ng,boost,ssl,base64,libhdfs3,protobuf,thrift}/*
  mv ../librdkafka-363dcad*/* contrib/librdkafka/
  mv ../cppkafka-860c90e*/* contrib/cppkafka/
  mv ../cctz-4f9776a*/* contrib/cctz/
  mv ../lz4-c10863b*/* contrib/lz4/
  mv ../zlib-ng-9173b89*/* contrib/zlib-ng/
  mv ../boost-6a96e8b*/* contrib/boost/
  mv ../ssl-ba8de79*/* contrib/ssl/
  mv ../base64-a27c565*/* contrib/base64/
  mv ../libhdfs3-bd6505c*/* contrib/libhdfs3/
  mv ../protobuf-1273537*/* contrib/protobuf/
  mv ../thrift-010ccf0*/* contrib/thrift/
  for dir in contrib/*/; do
    rmdir $dir &> /dev/null || true
  done
}

build() {
  cd ClickHouse-$pkgver-stable
  cmake -D CMAKE_BUILD_TYPE:STRING=Release -D USE_STATIC_LIBRARIES:BOOL=False -D SPLIT_SHARED_LIBRARIES:BOOL=True -D ENABLE_TESTS:BOOL=False -D UNBUNDLED:BOOL=False -D USE_INTERNAL_DOUBLE_CONVERSION_LIBRARY:BOOL=False -D USE_INTERNAL_CAPNP_LIBRARY:BOOL=False -D USE_INTERNAL_POCO_LIBRARY:BOOL=True -D USE_INTERNAL_RE2_LIBRARY:BOOL=False -D USE_INTERNAL_LIBGSASL_LIBRARY:BOOL=False -D USE_INTERNAL_GTEST_LIBRARY:BOOL=False -D USE_INTERNAL_LIBXML2_LIBRARY:BOOL=False -D USE_INTERNAL_LLVM_LIBRARY:BOOL=False -D USE_INTERNAL_BROTLI_LIBRARY:BOOL=False -D NO_WERROR=1 -D DOUBLE_CONVERSION_ROOT_DIR=/usr -D USE_INTERNAL_PARQUET_LIBRARY:BOOL=False -D USE_INTERNAL_ZSTD_LIBRARY:BOOL=False -D USE_INTERNAL_RDKAFKA_LIBRARY:BOOL=True -D USE_RDKAFKA:BOOL=True -D USE_INTERNAL_LZ4_LIBRARY:BOOL=True -D ENABLE_JEMALLOC:BOOL=True -D USE_INTERNAL_JEMALLOC_LIBRARY:BOOL=False -D USE_BASE64:BOOL=True -D USE_INTERNAL_HDFS3_LIBRARY:BOOL=True -D ENABLE_MYSQL:BOOL=True -D USE_INTERNAL_MYSQL_LIBRARY:BOOL=False -D USE_INTERNAL_DOUBLE_CONVERSION_LIBRARY:BOOL=False -D USE_INTERNAL_PROTOBUF_LIBRARY:BOOL=True -D USE_INTERNAL_PROTOBUF_LIBRARY:BOOL=True -D PARQUET_INCLUDE_DIR:STRING=/usr/include -D USE_INTERNAL_POCO_LIBRARY:BOOL=False .
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
  for lib in libclickhouse{-{benchmark,{clien,forma,performance-tes}t,{co{mp{ile,resso},pie},obfuscato,serve}r,extract-from-config,local}-lib,{_{aggregat,tabl}e,}_functions,_{com{mon_{config,io,zookeeper},pression},dictionaries{,_embedded},parsers,storage{_kafka,s_system}}}.so; do
    libsrc=$(find dbms/ -name "$lib")
    libdst=$lib.$pkgver
    cp ${libsrc:?$lib not found} $pkgdir/usr/lib/$libdst
    patchelf --remove-rpath $pkgdir/usr/lib/$libdst
    patchelf --replace-needed $lib $lib.$pkgver $pkgdir/usr/bin/clickhouse-client
  done
  for lib in lib{b{ase64,oost_{{file,}system,program_options}_internal},c{ctz,ommon},daemon,{dbm,string_util}s,mysqlxx,pocoext}.so; do
    libsrc=$(find contrib/ libs/ dbms/ -name "$lib")
    libdst=libclickhouse-${lib#lib}.$pkgver
    cp ${libsrc:?$lib not found} $pkgdir/usr/lib/$libdst
    patchelf --remove-rpath $pkgdir/usr/lib/$libdst
    patchelf --replace-needed $lib $libdst $pkgdir/usr/bin/clickhouse-client
  done
  cp contrib/zlib-ng/libz.so.1 $pkgdir/usr/lib/libz-ng.so.1
  sed -e 's:/opt/clickhouse:/var/lib/clickhouse:g' -i $pkgdir/etc/clickhouse-server/config.xml
  sed -e '/listen_host/s%::<%::1<%' -i $pkgdir/etc/clickhouse-server/config.xml
  cp debian/clickhouse-server.service $pkgdir/usr/lib/systemd/system
}

# vim:set ts=2 sw=2 et:
