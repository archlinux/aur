# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=mysql-shell
pkgver=8.0.18
pkgrel=3
pkgdesc='An interface supporting development and administration for the MySQL Server'
arch=('x86_64' 'i686')
url="https://dev.mysql.com/downloads/shell/"
license=('GPL')
GTEST_VERSION="1.8.0"
source=(
  "https://dev.mysql.com/get/Downloads/MySQL-Shell/mysql-shell-$pkgver-src.tar.gz"
  "mysql-shell-$pkgver-src.tar.gz.asc::https://dev.mysql.com/downloads/gpg/?file=mysql-shell-$pkgver-src.tar.gz"
  "https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-boost-$pkgver.tar.gz"
  "mysql-boost-$pkgver.tar.gz.asc::https://dev.mysql.com/downloads/gpg/?file=mysql-boost-$pkgver.tar.gz"
  "googletest-release-$GTEST_VERSION.zip::https://github.com/google/googletest/archive/release-$GTEST_VERSION.zip"
)
noextract=("googletest-release-$GTEST_VERSION.zip")
md5sums=(
  "1e04f2c53ed21a220e93f1d96e06aeda"
  "SKIP"
  "b63e84d8ba2bbd6f82df12fc6dfb8d51"
  "SKIP"
  "adfafc8512ab65fd3cf7955ef0100ff5"
)
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')
depends=('python2' 'openssl')
makedepends=('v8-6.7-static' 'cmake' 'clang' 'zip' 'zlib' 'libsasl' 'rpcsvc-proto' 'python2' 'python2-colorama' 'python2-pylint' 'python2-lazy-object-proxy' 'python2-singledispatch' 'python2-wrapt' 'ninja' 'git' 'wget')

build() {
  cd "$srcdir/mysql-$pkgver"
  mkdir -p bld && cd $_
  cmake .. -DWITH_BOOST="../boost" -DWITH_SSL=system -DWITH_PROTOBUF=bundled -Dprotobuf_BUILD_SHARED_LIBS=OFF
  cmake --build . --target mysqlclient
  cmake --build . --target mysqlxclient

  cd "$srcdir/$pkgname-$pkgver-src"
  mkdir -p bld && cd $_
  build_tests=0
  if [[ "$MYSQL_SHELL_RUN_TESTS" ]]; then
    build_tests=1
  fi
  protobuf_dir="$(basename "$(find $srcdir/mysql-$pkgver/extra/protobuf -maxdepth 1 -type d -name 'protobuf-*')")"
  cmake .. \
    -DWITH_TESTS="$build_tests" \
    -DWITH_GMOCK="${srcdir}/googletest-release-$GTEST_VERSION.zip" \
    -DCMAKE_C_COMPILER=/usr/bin/clang \
    -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMYSQL_SOURCE_DIR="$srcdir/mysql-$pkgver" \
    -DMYSQL_BUILD_DIR="$srcdir/mysql-$pkgver/bld" \
    -DHAVE_PYTHON=1 \
    -DHAVE_V8=1 \
    -DV8_INCLUDE_DIR="/usr/include" \
    -DV8_LIB_DIR="/usr/lib" \
    -DWITH_SSL=system \
    -DWITH_STATIC_LINKING=1 \
    -DWITH_PROTOBUF="$srcdir/mysql-$pkgver/extra/protobuf/$protobuf_dir/src" \
    -DCMAKE_C_FLAGS="-I $srcdir/mysql-$pkgver/extra/protobuf/$protobuf_dir/src" \
    -DCMAKE_CXX_FLAGS="-I $srcdir/mysql-$pkgver/extra/protobuf/$protobuf_dir/src" \
    -DCMAKE_LIBRARY_PATH="$srcdir/mysql-$pkgver/bld/extra/protobuf/$protobuf_dir/cmake"
  make
}

check() {
  # requires MySQL server, disabled by default
  if [[ "$MYSQL_SHELL_RUN_TESTS" ]]; then
    cd "$srcdir/$pkgname-$pkgver-src/bld/shell-tests"
    sed 's/python/python2/' -i mysqlx-test-run.py
    sed 's/bld"/bld\/bin"/' -i mysqlx-test-run.py
    ./mxtr
  fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src/bld"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/$pkgname-$pkgver-src/doc/man/mysqlsh.1" "$pkgdir/usr/share/man/man1/mysqlsh.1"
  cd "$srcdir/$pkgname-$pkgver-src"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set tabstop=4 shiftwidth=2 expandtab smarttab autoindent:
