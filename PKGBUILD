# Maintainer: Alex Kashirin <kashirin.alex@gmail.com>

_group_name="hdfs"
_sub_name="lib-cpp"

pkgname=${_group_name}-${_sub_name}
pkgver=3.3.0
pkgrel=1
pkgdesc="Libhdfs++ for Hadoop’s Distributed File System (HDFS)"
arch=("x86_64")

groups=($_group_name)
provides=(
  libhdfspp.so
)

url="https://github.com/apache/hadoop/tree/rel/release-3.3.0/hadoop-hdfs-project/hadoop-hdfs-native-client/src/main/native/libhdfspp"
license=('APACHE')


depends=(
  'gsasl'
  'openssl'
  'protobuf'
)
makedepends=(
  'pkg-config'
  'cmake'
  'make'
  'gcc'
  'gsasl'
  'openssl'
  'protobuf'
  'jdk-openjdk'
)

optdepends=()
conflicts=()
replaces=()
backup=()
options=()
install=README.md
changelog=


source=(
  $pkgname-$pkgver-source::git+https://github.com/apache/hadoop.git#tag=rel/release-$pkgver
)
sha256sums=('SKIP')

build() {
  export JAVA_HOME=/usr/lib/jvm/default;
  _src_path=`pwd`/$pkgname-$pkgver-source/;
  _build_path=`pwd`/$pkgname-$pkgver-build/;

  sed -i 's/set(LIBHDFSPP_VERSION "0.1.0")/set(LIBHDFSPP_VERSION "'${pkgver}'")/g' \
    ${_src_path}/hadoop-hdfs-project/hadoop-hdfs-native-client/src/main/native/libhdfspp/CMakeLists.txt;

  mkdir -p ${_build_path};
  cd ${_build_path};

  cmake ${_src_path}/hadoop-hdfs-project/hadoop-hdfs-native-client/src/ \
    -DJVM_ARCH_DATA_MODEL=64 -DHADOOP_BUILD=ON -DHDFSPP_LIBRARY_ONLY=ON \
    -DBUILD_SHARED_HDFSPP=ON -DLIBHDFSPP_VERSION=$pkgver \
    -DCMAKE_CXX_FLAGS="-ffile-prefix-map=${_src_path}= -ffile-prefix-map=${_build_path}=" \
    -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
    -DCMAKE_BUILD_TYPE=Release;

  cd main/native/libhdfspp;
  make hdfspp -j$((`grep -c processor < /proc/cpuinfo || echo 1`)) VERBOSE=1;
}


package() {
  mkdir -p $pkgdir/usr/share/$pkgname;
  cp $pkgname-$pkgver-source/LICENSE.txt $pkgdir/usr/share/$pkgname/;

  cd $pkgname-$pkgver-build/main/native/libhdfspp;
  make hdfspp install;
}
