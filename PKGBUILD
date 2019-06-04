# Maintainer: Asterios Dimitriou <asterios@pci.gr>

_pkgname=sqlcipher
pkgname=mingw-w64-sqlcipher
pkgver=4.2.0
pkgrel=1
pkgdesc="SQLite extension that provides transparent 256-bit AES encryption of database files (mingw-w64)"
arch=('any')
url="https://www.zetetic.net/sqlcipher/"
license=('BSD')
makedepends=('mingw-w64-configure' 'tcl')
depends=('mingw-w64-crt' 'mingw-w64-openssl')
options=(!buildflags !strip staticlibs !makeflags)
source=("${_pkgname}-${pkgver}.zip::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.zip"
        "01-fix_extensions.patch")
sha256sums=('cf96ffb46f59ba15e16a4a5fd31728444636d37a56e6878c9661afee97be9f97'
            'dfac9b545b3c6fe37eaf47c994b929db078067dbbfaa5be82ba6472f66f77ec1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare(){
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  patch -p1 -i "${srcdir}"/01-fix_extensions.patch
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
