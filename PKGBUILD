# Maintainer: Alex Kashirin <kashirin.alex@gmail.com>

_group_name="swcdb"
_sub_name="lib-fs-hadoop"

pkgname=${_group_name}-${_sub_name}
pkgver=0.5.0
pkgrel=1
pkgdesc="The SWC-DB FileSystem Hadoop library (dev-stage)"
arch=("x86_64")

groups=($_group_name)
provides=(
  libswcdb_fs_hadoop.so
)

url="https://www.swcdb.org"
license=('GPLv3')


depends=(
  'swcdb-lib-fs'
  'hdfs-lib-cpp'
)
makedepends=(
  'git'
  'cmake'
  'make'
  'gcc'
  'swcdb-lib-fs'
  'hdfs-lib-cpp'
)

optdepends=()
conflicts=()
replaces=()
backup=()
options=()
install=README.md
changelog=


source=(
  $pkgname-$pkgver-source::git+https://github.com/kashirin-alex/swc-db.git#tag=v$pkgver
)
sha256sums=('SKIP')


build() {

  mkdir -p $pkgname-$pkgver-build;
  cd $pkgname-$pkgver-build;

  HADOOP_VERSION=`readlink /usr/lib/libhdfspp.so | sed  's/libhdfspp.so.//g'`;

  cmake ../$pkgname-$pkgver-source \
    -DO_LEVEL=3 -DSWC_BUILD_PKG=${_sub_name} \
    -DHADOOP_VERSION=${HADOOP_VERSION} \
    -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
    -DCMAKE_BUILD_TYPE=Release;
  make -j$((`grep -c processor < /proc/cpuinfo || echo 1`));
}


package() {
  cd $pkgname-$pkgver-build;
  make install;

  HADOOP_VERSION=`readlink /usr/lib/libhdfspp.so | sed  's/libhdfspp.so.//g'`;
  cd $pkgdir/usr/lib/;
  rm -f libswcdb_fs_hadoop.so;
  ln -s libswcdb_fs_hadoop.so.${HADOOP_VERSION}\
        libswcdb_fs_hadoop.so;
}
