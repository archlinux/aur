# Contributor: napa3um <napa3um@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-sqlite
_amalgamationver=3081002
pkgver=3.8.10.2
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (mingw-w64)"
arch=(any)
groups=(mingw-w64)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure mingw-w64-pdcurses mingw-w64-readline)
options=(!buildflags !strip staticlibs)
license=('custom:Public Domain')
url="http://www.sqlite.org/"
source=("http://www.sqlite.org/2015/sqlite-autoconf-$_amalgamationver.tar.gz")
sha1sums=('c2f2c17d3dc4c4e179d35cc04e4420636d48a152')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/sqlite-autoconf-${_amalgamationver}"
  sed -i "s|sqlite3.\$(OBJEXT)|\$(top_builddir)/libsqlite3.la|g" Makefile.am
  autoreconf -vfi
}

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

