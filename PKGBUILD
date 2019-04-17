# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: napa3um <napa3um@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

pkgname=mingw-w64-sqlite
_amalgamationver=3280000
pkgver=3.28.0
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (mingw-w64)"
arch=('any')
groups=(mingw-w64)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-pdcurses' 'mingw-w64-readline')
options=('!buildflags' '!strip' 'staticlibs')
license=('custom:Public Domain')
url="http://www.sqlite.org/"
source=("http://www.sqlite.org/2019/sqlite-autoconf-${_amalgamationver}.tar.gz")
sha256sums=('d61b5286f062adfce5125eaf544d495300656908e61fca143517afcc0a89b7c3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/sqlite-autoconf-${_amalgamationver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CFLAGS+=" -fexceptions -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_USE_MALLOC_H=1 -DSQLITE_USE_MSIZE=1 -DSQLITE_DISABLE_DIRSYNC=1 -DSQLITE_ENABLE_RTREE=1 -fno-strict-aliasing"
    config_TARGET_EXEEXT=.exe \
    ${_arch}-configure \
      --enable-threadsafe \
      --disable-editline \
      --enable-readline \
      --enable-fts3 \
      --enable-fts4 \
      --enable-fts5 \
      --enable-rtree \
      --enable-json1 \
      --enable-session
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
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    popd
  done
}
