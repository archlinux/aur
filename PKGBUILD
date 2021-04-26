# Maintainer: Alex Kashirin <kashirin.alex@gmail.com>

_group_name="swcdb"
_sub_name="lib-fs-hadoop-jvm"

pkgname=${_group_name}-${_sub_name}
pkgver=0.5.0
pkgrel=1
pkgdesc="The SWC-DB FileSystem Hadoop-JVM library"
arch=("x86_64")

groups=($_group_name)
provides=(
  libswcdb_fs_hadoop_jvm.so
)

url="https://www.swcdb.org"
license=('GPLv3')


depends=(
  'swcdb-lib-fs'
  'jre-openjdk'
)
makedepends=(
  'git'
  'cmake'
  'make'
  'gcc'
  'swcdb-lib-fs'
  'jdk-openjdk'
  'which'
  'hadoop=3.3.0-1'
)

optdepends=(
  'hadoop=3.3.0-1'
)

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

  _java_path=`readlink $(which java)`;
  _java_path=`dirname  ${_java_path}`;
  _java_path=`realpath ${_java_path}/../`;

  _hadoop_path=`JAVA_HOME=${_java_path} hadoop envvars | grep HADOOP_COMMON_HOME`;

  cmake ../$pkgname-$pkgver-source \
    -DO_LEVEL=3 -DSWC_BUILD_PKG=${_sub_name} \
    -D${_hadoop_path} \
    -DJAVA_INSTALL_PATH=${_java_path} \
    -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
    -DCMAKE_BUILD_TYPE=Release;

  make -j$((`grep -c processor < /proc/cpuinfo || echo 1`));
}


package() {
  cd $pkgname-$pkgver-build;
  make install;
}
