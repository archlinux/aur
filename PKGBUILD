# Contributor: napa3um <napa3um@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-sqlite
_amalgamationver=3120100
pkgver=3.12.1
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (mingw-w64)"
arch=(any)
groups=(mingw-w64)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure mingw-w64-pdcurses mingw-w64-readline)
options=(!buildflags !strip staticlibs !makeflags)
license=('custom:Public Domain')
url="http://www.sqlite.org/"
source=("http://www.sqlite.org/2016/sqlite-autoconf-$_amalgamationver.tar.gz")
sha1sums=('fa1f3dbf6e2e8c6d14125b2eceda5b2e16a19f1f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/sqlite-autoconf-${_amalgamationver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CFLAGS="-DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_DISABLE_DIRSYNC=1 -DSQLITE_ENABLE_FTS3=3 -DSQLITE_ENABLE_RTREE=1" \
    config_TARGET_EXEEXT=.exe \
    ${_arch}-configure \
      --target=${_arch} \
      --enable-threadsafe
    make
    popd
  done
}

package() {
  cd "${srcdir}/sqlite-autoconf-${_amalgamationver}"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/usr/${_arch}/share"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    popd
  done
}

