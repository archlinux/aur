# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# All patches are managed at https://github.com/Martchus/mariadb-connector-c

pkgname=mingw-w64-mariadb-connector-c
pkgver=2.3.3
pkgrel=1
pkgdesc='MariaDB Connector/C is used to connect applications developed in C/C++ to MariaDB and MySQL databases (mingw-w64)'
arch=('any')
url='https://mariadb.com/kb/en/mariadb/about-mariadb-connector-c'
license=('LGPL')
replaces=('mingw-w64-libmariadbclient')
conflicts=('mingw-w64-libmariadbclient')
provides=("mingw-w64-libmariadbclient=$pkgver")
depends=('mingw-w64-crt' 'mingw-w64-openssl' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://archive.mariadb.org/connector-c-$pkgver/mariadb-connector-c-$pkgver-src.tar.gz"
        '0001-Fix-libnames-for-mingw-w64.patch'
        '0002-Fix-_SIZE_T_DEFINED-under-mingw-w64.patch'
        '0003-Use-fopen-rather-than-fopen_s-for-XP-compatibility.patch')
sha1sums=('6fbf541a4465cd729c7f790a3d9cd337e8dd2666'
          '12a2d0b8d521dc097cecc3ea32efcaee0e7f9781'
          'f07a59cdd02ad89e60edcb18a1cdc3ccda93fc2b'
          '3aa503bb7ad9b84c21cdef94f3a55d96a7fa8811')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "$srcdir/mariadb-connector-c-$pkgver-src/"
  for patch in "$srcdir/"*.patch; do
    patch -p1 -i "$patch"
  done
}

build() {
  unset LDFLAGS
  cd "$srcdir/mariadb-connector-c-$pkgver-src/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DWITH_EXTERNAL_ZLIB=ON \
      -DWITH_SQLITE=OFF \
      -DWITH_OPENSSL=ON \
      -DLIB_EAY=/usr/${_arch}/lib/libcrypto.dll.a \
      -DSSL_EAY=/usr/${_arch}/lib/libssl.dll.a \
      -DWITH_MYSQLCOMPAT=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/mariadb-connector-c-$pkgver-src/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ln -s mariadb "$pkgdir"/usr/${_arch}/include/mysql
    # Creation of symlinks in CMake project file doesn't work for some reason.
    # Probably a couple more symlinks that should be created.
    ln -s libmariadb.dll.a "$pkgdir"/usr/${_arch}/lib/libmysql.dll.a
    ln -s libmariadbclient.a "$pkgdir"/usr/${_arch}/lib/libmysqlclient.a
    ln -s libmariadb.dll "$pkgdir"/usr/${_arch}/bin/libmysql.dll
    ln -s libmariadb.dll "$pkgdir"/usr/${_arch}/bin/libmysqlclient.dll
    ln -s libmariadb.dll "$pkgdir"/usr/${_arch}/bin/libmysqlclient_r.dll
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/lib/plugin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/plugin/*.a
  done
}
