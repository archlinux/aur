# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: napa3um <napa3um at gmail dot com>
# Contributor: Filip Brcic <brcha at gna dot org>

pkgname=mingw-w64-sqlite
_amalgamationver=3320300
pkgver=3.32.3
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (mingw-w64)"
arch=('any')
groups=(mingw-w64)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-pdcurses' 'mingw-w64-readline')
options=('!buildflags' '!strip' 'staticlibs')
license=('custom:Public Domain')
url="https://www.sqlite.org/"
source=("https://www.sqlite.org/2020/sqlite-autoconf-${_amalgamationver}.tar.gz")
sha256sums=('a31507123c1c2e3a210afec19525fd7b5bb1e19a6a34ae5b998fbd7302568b66')

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
