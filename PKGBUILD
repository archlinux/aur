# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=mysql-shell
pkgver=8.0.24
pkgrel=1
pkgdesc='An interface supporting development and administration for the MySQL Server'
arch=('x86_64' 'i686')
url="https://dev.mysql.com/downloads/shell/"
license=('GPL')
source=(
  "https://dev.mysql.com/get/Downloads/MySQL-Shell/mysql-shell-$pkgver-src.tar.gz"
  "mysql-shell-$pkgver-src.tar.gz.asc::https://dev.mysql.com/downloads/gpg/?file=mysql-shell-$pkgver-src.tar.gz&p=43"
  "https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-boost-$pkgver.tar.gz"
  "mysql-boost-$pkgver.tar.gz.asc::https://dev.mysql.com/downloads/gpg/?file=mysql-boost-$pkgver.tar.gz&p=23"
)
md5sums=('b9772d6367825048e609201606cd71de'
         'SKIP'
         'e8cb8eafe07e22d5da123ffc5ca79e56'
         'SKIP')
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
