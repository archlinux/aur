# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-mariadb-connector-c
pkgver=2.2.3
pkgrel=1
pkgdesc="MariaDB Connector/C is used to connect applications developed in C/C++ to MariaDB and MySQL databases (mingw-w64)"
arch=('any')
url="https://mariadb.com/kb/en/mariadb/about-mariadb-connector-c"
license=('LGPL')
replaces=('mingw-w64-libmariadbclient')
conflicts=('mingw-w64-libmariadbclient')
provides=("mingw-w64-libmariadbclient=$pkgver")
depends=('mingw-w64-crt' 'mingw-w64-openssl' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://downloads.mariadb.org/interstitial/connector-c-${pkgver}/mariadb-connector-c-${pkgver}-src.tar.gz"
        'fix-libnames-mingw.patch'
        'use_fopen_for_xp_compatibility.patch'
        'fix-size-t-defined.patch')
sha1sums=('89031eeb4cf56affea30a3d66ff2c6c29462da3d'
          'b0e496dc054e2a328dab17cf4de7bd169789f9d7'
          'dcf3d766ae6faf99aa93d1444e3b200c4f80c4f1'
          '4d1b01a0f800b15ad6e44e387f2f8d8c147cdea3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/mariadb-connector-c-$pkgver-src/"
  patch -p0 -i "$srcdir/fix-libnames-mingw.patch"
  patch -p0 -i "$srcdir/use_fopen_for_xp_compatibility.patch"
  patch -p0 -i "$srcdir/fix-size-t-defined.patch"
  #patch -p0 -i "$srcdir/fix-qt5-uint-error.patch"
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
