# Maintainer: Martchus <martchus at gmx dot net>
# Contributor: jazztickets
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: napa3um <napa3um at gmail dot com>
# Contributor: Filip Brcic <brcha at gna dot org>

pkgname=mingw-w64-sqlite
_srcver=3500000
pkgver=3.50.0
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (mingw-w64)"
arch=('any')
groups=(mingw-w64)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-pdcurses' 'mingw-w64-readline')
options=('!strip' '!buildflags' 'staticlibs')
license=('custom:Public Domain')
url="https://www.sqlite.org/"
source=(https://www.sqlite.org/2025/sqlite-src-${_srcver}.zip)
sha256sums=('af673f28f69b572b49bb1558c4f191fd66e31acb949468ad2b01b2b6ed8043a2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_cflags=(
  -fexceptions
  -DSQLITE_ENABLE_COLUMN_METADATA=1
  -DSQLITE_ENABLE_UNLOCK_NOTIFY
  -DSQLITE_ENABLE_DBSTAT_VTAB=1
  -DSQLITE_ENABLE_FTS3_TOKENIZER=1
  -DSQLITE_ENABLE_FTS3_PARENTHESIS
  -DSQLITE_SECURE_DELETE
  -DSQLITE_ENABLE_STMTVTAB
  -DSQLITE_ENABLE_STAT4
  -DSQLITE_MAX_VARIABLE_NUMBER=250000
  -DSQLITE_MAX_EXPR_DEPTH=10000
  -DSQLITE_ENABLE_MATH_FUNCTIONS
  -DSQLITE_USE_MALLOC_H=1
  -DSQLITE_USE_MSIZE=1
  -DSQLITE_DISABLE_DIRSYNC=1
  -fno-strict-aliasing
)

build() {
  CFLAGS+=" ${_cflags[*]}" CXXFLAGS+=" ${_cflags[*]}"

  cd "${srcdir}/sqlite-src-${_srcver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

    # remove '--target=...' from mingw's configure
    bash <(sed 's/--target[^ ]* //' $(command -v "${_arch}-configure")) \
      --fts3 \
      --fts4 \
      --fts5 \
      --rtree \
      --session \
      --out-implib \
      --dll-basename

    make
    popd
  done
}

package() {
  cd "${srcdir}/sqlite-src-${_srcver}"
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
