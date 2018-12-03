# Maintainer: Asterios Dimitriou <asterios@pci.gr>

_pkgname=sqlcipher
pkgname=mingw-w64-sqlcipher
pkgver=4.0.0
pkgrel=1
pkgdesc="SQLite extension that provides transparent 256-bit AES encryption of database files (mingw-w64)"
arch=('any')
url="https://www.zetetic.net/sqlcipher/"
license=('BSD')
makedepends=('mingw-w64-configure' 'tcl')
depends=('mingw-w64-crt' 'mingw-w64-openssl')
options=(!buildflags !strip staticlibs !makeflags)
source=("${_pkgname}-${pkgver}.zip::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.zip")
sha256sums=('b02e18287d9bf43064fcbd0be07eb2a88af5c17342c3f95cf824688cb3e3fe39')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare(){
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  sed -i 's/lemon /lemon\$(BEXE)/g' Makefile.in
  sed -i 's/mksourceid\$(BEXE)/mksourceid /g' Makefile.in
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CFLAGS="-DSQLITE_HAS_CODEC -DSQLITE_ENABLE_COLUMN_METADATA" \
    LDFLAGS="-lcrypto" \
    config_TARGET_EXEEXT=.exe \
    ${_arch}-configure \
        --enable-tempstore \
        --disable-tcl \
        --enable-session \
        --enable-fts3 \
        --enable-fts5 \
        --enable-json1 \
        --enable-rtree \
        ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
