# Maintainer: Asterios Dimitriou <asterios@pci.gr>

_pkgname=sqlcipher
pkgname=mingw-w64-sqlcipher
pkgver=3.4.2
pkgrel=1
pkgdesc="SQLite extension that provides transparent 256-bit AES encryption of database files (mingw-w64)"
arch=('any')
url="https://www.zetetic.net/sqlcipher/"
license=('BSD')
makedepends=('mingw-w64-configure' 'tcl')
depends=('mingw-w64-crt' 'mingw-w64-openssl')
options=(!buildflags !strip staticlibs !makeflags)
source=("${_pkgname}-${pkgver}.zip::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.zip"
        "https://www.zetetic.net/${_pkgname}/verify/${pkgver}/${_pkgname}-${pkgver}.zip.sig")
sha256sums=('f2afbde554423fd3f8e234d21e91a51b6f6ba7fc4971e73fdf5d388a002f79f1'
            'SKIP')
validpgpkeys=('D83F5F9EB811D6E6B4A0D9C5D1FA3A2A97ED25C2')   # Zetetic LLC <support@zetetic.net>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare(){
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  sed -i 's/lemon /lemon\$(BEXE)/g' Makefile.in
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CFLAGS="-DSQLITE_HAS_CODEC" \
    LDFLAGS="-lcrypto" \
    config_TARGET_EXEEXT=.exe \
    ${_arch}-configure \
        --enable-tempstore \
        --disable-tcl \
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
