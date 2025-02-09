# Maintainer: jazztickets <amF6enRpY2tldHNAZ21haWwuY29tCg==>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: napa3um <napa3um at gmail dot com>
# Contributor: Filip Brcic <brcha at gna dot org>

pkgname=mingw-w64-sqlite
_amalgamationver=3490000
pkgver=3.49.0
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (mingw-w64)"
arch=('any')
groups=(mingw-w64)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-pdcurses' 'mingw-w64-readline')
options=('!strip' '!buildflags' 'staticlibs')
license=('custom:Public Domain')
url="https://www.sqlite.org/"
source=("https://www.sqlite.org/2025/sqlite-autoconf-${_amalgamationver}.tar.gz")
sha256sums=('4d8bfa0b55e36951f6e5a9fb8c99f3b58990ab785c57b4f84f37d163a0672759')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/sqlite-autoconf-${_amalgamationver}"

  # hack until 3.49.1
  sed -i 's/return "\.lib"/return ".a"/' autosetup/proj.tcl

  # build import library
  sed -i 's/-shared/"-shared -Wl,--out-implib,libsqlite3.dll.a"/' autosetup/cc-shared.tcl
}

build() {
  cd "${srcdir}/sqlite-autoconf-${_amalgamationver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CFLAGS+=" -fexceptions -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_USE_MALLOC_H=1 -DSQLITE_USE_MSIZE=1 -DSQLITE_DISABLE_DIRSYNC=1 -DSQLITE_ENABLE_RTREE=1 -fno-strict-aliasing"
    config_TARGET_EXEEXT=.exe \

    # remove --target=... from mingw's configure
    bash <(sed 's/--target[^ ]* //' $(command -v "${_arch}-configure")) \
      --fts3 \
      --fts4 \
      --fts5 \
      --rtree \
      --session \
      --disable-load-extension

    # hack until 3.49.1
    ln -sf ../shell.c .
    ln -sf ../sqlite3.1 .
    ln -sf ../sqlite3.{c,h} .
    ln -sf ../sqlite3ext.h .

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

    # move dlls from lib/ to bin/
    mv "$pkgdir"/usr/${_arch}/lib/*.dll* "$pkgdir"/usr/${_arch}/bin/
    install -m644 libsqlite3.dll.a "${pkgdir}"/usr/${_arch}/lib/

    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    popd
  done
}

# vim: set ts=2 sw=2 et:
