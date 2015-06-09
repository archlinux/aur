# Contributor: napa3um <napa3um@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-sqlite
_amalgamationver=3080900
pkgver=3.8.9
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (mingw-w64)"
arch=(any)
groups=(mingw-w64)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure mingw-w64-pdcurses mingw-w64-readline)
options=(!buildflags !strip staticlibs !emptydirs)
conflicts=(mingw-w64-sqlite3)
provides=("mingw-w64-sqlite3=$pkgver")
replaces=(mingw-w64-sqlite3)
license=('custom:Public Domain')
url="http://www.sqlite.org/"
source=("http://www.sqlite.org/2015/sqlite-autoconf-$_amalgamationver.tar.gz")
sha1sums=('db70dee268700b312cbaa5b3e5cf8454e1c8b7b9')

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
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec rm {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.a" -o -name "*.dll" | xargs -rtl1 ${_arch}-strip -g
    rm -rf "${pkgdir}/usr/${_arch}/share"
    popd
  done
}
