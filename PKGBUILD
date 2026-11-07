# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=lib32-mariadb-connector-c
_name=mariadb-connector-c
# The version of Connector/C that mariadb-libs bundles (mariadb_config --cc_version)
pkgver=3.4.11
pkgrel=2
pkgdesc="MariaDB Connector/C, the client library of MariaDB (32-bit)"
arch=(x86_64)
url="https://mariadb.com/docs/connectors/mariadb-connector-c"
license=(LGPL-2.1-or-later)
# mariadb-libs: the headers; zstd: the compression plugin
# The libraries' sonames as well, which makepkg versions (libssl.so=3-32): pacman then keeps a new,
# incompatible soname from replacing a library this package was built against, until it's rebuilt
depends=(
  lib32-gcc-libs
  lib32-glibc
  lib32-openssl
  libcrypto.so
  libssl.so
  lib32-zlib
  libz.so
  lib32-zstd
  libzstd.so
  mariadb-libs
)
makedepends=(cmake git lib32-krb5)
optdepends=('lib32-krb5: for gssapi authentication')
provides=(libmariadb.so)
source=("git+https://github.com/mariadb-corporation/mariadb-connector-c.git#tag=v$pkgver")
sha512sums=('ace97fc25e3ce2486282a0ce4e9676824d7965d049d6f0b7a97788f6a4a4eb4f3d31866253c7830995cf25ceb01ee44c6e06b737f229b2389dd9f370a3358e35')
b2sums=('657cf1fb5b261d8276c14457444a9d02ccf6881777ec8a38c6e77d5fd195e1084f8b8083560b195cc6cb1f04e3be839910d7304e40d20b379870b74b81efdea9')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  # The library and its plugins as in mariadb-libs, which builds Connector/C with MariaDB: the
  # plugins as modules (in /usr/lib32/mysql/plugin, like /usr/lib/mysql/plugin), without remote_io
  # (curl), LOAD DATA LOCAL off by default
  local _cmake_options=(
    -B build
    -S "$_name"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    # Without -Werror, which upstream only adds when it isn't built as part of MariaDB (as for
    # mariadb-libs): GCC 16's LTO warns about ma_strmake
    -DCMAKE_COMPILE_WARNING_AS_ERROR=OFF
    -DINSTALL_LIBDIR=lib32
    -DINSTALL_PCDIR=lib32/pkgconfig
    -DINSTALL_PLUGINDIR=lib32/mysql/plugin
    -DINSTALL_INCLUDEDIR=include/mysql
    # The server's socket, as in mariadb-libs
    -DMARIADB_UNIX_ADDR=/run/mysqld/mysqld.sock
    -DDEFAULT_CHARSET=utf8mb4
    -DENABLED_LOCAL_INFILE=OFF
    -DWITH_EXTERNAL_ZLIB=ON
    # FindZStd's hint, ${ZSTD_ROOT_DIR}/lib, is /lib without it, before the 32-bit library
    -DZSTD_LIBRARIES=/usr/lib32/libzstd.so
    -DWITH_SSL=OPENSSL
    # Without the remote_io plugin, which reads files for LOAD DATA LOCAL INFILE from URLs with
    # curl: mariadb-libs has no remote_io either (nor a dependency on curl), and LOAD DATA LOCAL is
    # off
    -DWITH_CURL=OFF
    # Without the unit tests, which connect to a running MariaDB server, so the build couldn't run
    # them
    -DWITH_UNIT_TESTS=OFF
  )
  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # The headers, tools and man pages are mariadb-libs'
  rm -r "${pkgdir:?}"/usr/{include,bin,man}
  rm -f "$pkgdir"/usr/lib32/*.a
  install -Dm644 "$_name/COPYING.LIB" -t "$pkgdir/usr/share/licenses/$pkgname"
}
