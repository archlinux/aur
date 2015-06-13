# Maintainer: ant32 <antreimer@gmail.com>
pkgname=mingw-w64-mariadb-connector-c
pkgver=2.1.0
pkgrel=1
pkgdesc="MariaDB Connector/C. A library for connecting to MariaDB and MySQL servers (mingw-w64)"
arch=(any)
url="https://mariadb.com/kb/en/mariadb/about-mariadb-connector-c/"
license=("LGPL")
replaces=('mingw-w64-libmariadbclient')
conflicts=('mingw-w64-libmariadbclient')
provides=("mingw-w64-libmariadbclient=$pkgver")
depends=('mingw-w64-crt' 'mingw-w64-openssl' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://downloads.mariadb.org/interstitial/connector-c-${pkgver}/source-tgz/mariadb-connector-c-${pkgver}-src.tar.gz"
        'fix-libnames-mingw.patch'
        'use_fopen_for_xp_compatibility.patch'
        'fix-size-t-defined.patch'
        'fix-qt5-uint-error.patch')
md5sums=('c026525ad2cec882b00070ba92fa0bc1'
         '0cb013e5ec2a79be46832f462504dd88'
         'f1624e949933b2a774c116d46192a4ec'
         '0a202d91993cbedcc03f10fdfe2720a0'
         'e493a22d3e0f6de2bdedb7974c631101')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/mariadb-connector-c-$pkgver-src/"
  patch -p0 -i ../fix-libnames-mingw.patch
  patch -p0 -i ../use_fopen_for_xp_compatibility.patch
  patch -p0 -i ../fix-size-t-defined.patch
  patch -p0 -i ../fix-qt5-uint-error.patch
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
    # for some reason they don't create a link for libmysql.
    # Probably a couple more symlinks that should be created.
    ln -s libmariadb.dll.a "$pkgdir"/usr/${_arch}/lib/libmysql.dll.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}