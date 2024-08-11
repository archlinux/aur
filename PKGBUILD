# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# All patches are managed at https://github.com/Martchus/mariadb-connector-c

pkgname=mingw-w64-mariadb-connector-c
pkgver=3.3.10
pkgrel=2
pkgdesc='MariaDB client libraries (mingw-w64)'
arch=('any')
url='https://mariadb.com/kb/en/mariadb/about-mariadb-connector-c'
license=('LGPL-2.1-or-later')
replaces=('mingw-w64-libmariadbclient')
conflicts=('mingw-w64-libmariadbclient')
provides=("mingw-w64-libmariadbclient=$pkgver")
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-curl')
makedepends=('mingw-w64-cmake' 'ninja')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/mariadb-corporation/mariadb-connector-c/archive/refs/tags/v$pkgver.tar.gz"
        '0001-Fix-mingw-w64-build.patch'
        '0002-Fix-prototype.patch'
        '0003-Fix-use-of-VA_ARGS.patch')
sha256sums=('0a79088af2fbde4dbe6655dbc51bbb272b606c0d9116745697e08879e70198a7'
            '89a8f6d778763a241050fe501147507020cc00cbb5690d47c2d66dfab18c70e0'
            '248a7539e9bda0538992cde14e3f3b81b8db9eb90af1cce9830e28e291782f3d'
            'f0d1807e6610c25ab3badd99e542e9e10e50b2152220ac86a0a5e6f0163da185')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "$srcdir/mariadb-connector-c-${pkgver}"
  for patch in "$srcdir/"*.patch; do
    patch -p1 -i "$patch"
  done
}

build() {
  cd "$srcdir/mariadb-connector-c-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch}-static -S . -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr/$_arch/static \
      -DINSTALL_LIBDIR=lib \
      -DWITH_EXTERNAL_ZLIB=ON \
      -DWITH_MYSQLCOMPAT=ON \
      -DWITH_SSL="SCHANNEL" \
      -DWITH_UNIT_TESTS=OFF \
      -DWITH_CURL=OFF \
      -DCLIENT_PLUGIN_AUTH_GSSAPI_CLIENT=STATIC \
      -DCLIENT_PLUGIN_DIALOG=STATIC \
      -DCLIENT_PLUGIN_REMOTE_IO=STATIC \
      -DCLIENT_PLUGIN_PVIO_NPIPE=STATIC \
      -DCLIENT_PLUGIN_PVIO_SHMEM=STATIC \
      -DCLIENT_PLUGIN_CLIENT_ED25519=STATIC \
      -DCLIENT_PLUGIN_CACHING_SHA2_PASSWORD=STATIC \
      -DCLIENT_PLUGIN_SHA256_PASSWORD=STATIC \
      -DCLIENT_PLUGIN_MYSQL_CLEAR_PASSWORD=STATIC \
      -DCLIENT_PLUGIN_MYSQL_OLD_PASSWORD=STATIC \
      -DCLIENT_PLUGIN_ZSTD=STATIC 
    cmake --build build-${_arch}-static
    ${_arch}-cmake -B build-${_arch} -S . -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DINSTALL_LIBDIR=lib \
      -DWITH_EXTERNAL_ZLIB=ON \
      -DWITH_MYSQLCOMPAT=ON \
      -DWITH_SSL="SCHANNEL" \
      -DWITH_UNIT_TESTS=OFF \
      -DWITH_CURL=ON \
      -DCLIENT_PLUGIN_AUTH_GSSAPI_CLIENT=STATIC \
      -DCLIENT_PLUGIN_DIALOG=STATIC \
      -DCLIENT_PLUGIN_REMOTE_IO=STATIC \
      -DCLIENT_PLUGIN_PVIO_NPIPE=STATIC \
      -DCLIENT_PLUGIN_PVIO_SHMEM=STATIC \
      -DCLIENT_PLUGIN_CLIENT_ED25519=STATIC \
      -DCLIENT_PLUGIN_CACHING_SHA2_PASSWORD=STATIC \
      -DCLIENT_PLUGIN_SHA256_PASSWORD=STATIC \
      -DCLIENT_PLUGIN_MYSQL_CLEAR_PASSWORD=STATIC \
      -DCLIENT_PLUGIN_MYSQL_OLD_PASSWORD=STATIC \
      -DCLIENT_PLUGIN_ZSTD=STATIC 
    cmake --build build-${_arch} 
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install "$srcdir/mariadb-connector-c-${pkgver}/build-${_arch}-static"
    DESTDIR="${pkgdir}" cmake --install "$srcdir/mariadb-connector-c-${pkgver}/build-${_arch}"
    mv -v "$pkgdir"/usr/${_arch}/{static/,}lib/libmariadbclient.a
    rm -vr "$pkgdir"/usr/${_arch}/static
    ln -s mariadb "$pkgdir"/usr/${_arch}/include/mysql
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    if [[ -d $pkgdir/usr/$_arch/lib/plugin ]]; then
      ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/lib/plugin/*.dll
    fi
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
