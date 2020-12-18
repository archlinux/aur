# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=mysql-shell
pkgver=8.0.22
pkgrel=2
pkgdesc='An interface supporting development and administration for the MySQL Server'
arch=('x86_64' 'i686')
url="https://dev.mysql.com/downloads/shell/"
license=('GPL')
source=(
  "https://dev.mysql.com/get/Downloads/MySQL-Shell/mysql-shell-$pkgver-src.tar.gz"
  "mysql-shell-$pkgver-src.tar.gz.asc::https://dev.mysql.com/downloads/gpg/?file=mysql-shell-$pkgver-src.tar.gz&p=43"
  "https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-boost-$pkgver.tar.gz"
  "mysql-boost-$pkgver.tar.gz.asc::https://dev.mysql.com/downloads/gpg/?file=mysql-boost-$pkgver.tar.gz&p=23"
  "file://python3.9.patch"
)
md5sums=('6408ffea4947ca052b89f94656fd6395'
         'SKIP'
         '2b2d93e8a3c1a29d875daf534ea87c81'
         'SKIP'
         '2a67473ad966fb3598eb6c6167aacba7')
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')
depends=('python' 'openssl' 'curl')
optdepends=('mysql-clients: login-path secret store support')
makedepends=('v8-6.7-static' 'cmake' 'zip' 'zlib' 'libsasl' 'rpcsvc-proto')

build() {
  export CC="gcc"
  export CXX="g++"

  cd "$srcdir/mysql-$pkgver"
  mkdir -p bld && cd $_
  cmake .. -DWITH_BOOST="../boost" -DWITH_SSL=system -DWITH_PROTOBUF=bundled -Dprotobuf_BUILD_SHARED_LIBS=OFF
  cmake --build . --target mysqlclient
  cmake --build . --target mysqlxclient

  cd "$srcdir/$pkgname-$pkgver-src"
  patch -p1 <"$srcdir/python3.9.patch"
  mkdir -p bld && cd $_
  protobuf_dir="$(basename "$(find $srcdir/mysql-$pkgver/extra/protobuf -maxdepth 1 -type d -name 'protobuf-*')")"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMYSQL_SOURCE_DIR="$srcdir/mysql-$pkgver" \
    -DMYSQL_BUILD_DIR="$srcdir/mysql-$pkgver/bld" \
    -DHAVE_PYTHON=1 \
    -DHAVE_V8=1 \
    -DV8_INCLUDE_DIR="/usr/include" \
    -DV8_LIB_DIR="/usr/lib" \
    -DWITH_SSL=system \
    -DWITH_STATIC_LINKING=1 \
    -DPACKAGE_YEAR="$(date +%Y)" \
    -DWITH_PROTOBUF="$srcdir/mysql-$pkgver/extra/protobuf/$protobuf_dir/src" \
    -DPROTOBUF_INCLUDE_DIR="$srcdir/mysql-$pkgver/extra/protobuf/$protobuf_dir/src" \
    -DPROTOBUF_LIBRARY="$srcdir/mysql-$pkgver/bld/extra/protobuf/$protobuf_dir/cmake/libprotobuf.a"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src/bld"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/$pkgname-$pkgver-src/doc/man/mysqlsh.1" "$pkgdir/usr/share/man/man1/mysqlsh.1"
  install -Dm644 "$srcdir/$pkgname-$pkgver-src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set tabstop=4 shiftwidth=2 expandtab smarttab autoindent:
