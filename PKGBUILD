# Maintainer: Fabian Maurer <dark.shadow4@web.de>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>

_pkgname=libarchive
pkgname=lib32-${_pkgname}
pkgver=3.7.1
pkgrel=1
pkgdesc="library that can create and read several streaming archive formats (32 bit)"
arch=('x86_64')
url="http://libarchive.org"
license=('BSD')
depends=('lib32-acl' 'lib32-bzip2' 'lib32-expat' 'lib32-lz4' 'lib32-openssl' 'lib32-xz' 'lib32-zlib' 'lib32-zstd' "${_pkgname}")
source=("http://libarchive.org/downloads/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('ccd36fc5e24e5feaad15b08496c4f6373f1bbb6ba657af5dc633b9d1454c98aba9a59ccffc48b41afc1219119d46c15d4db09c5855950422946e4dc058f17b88')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${_pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --without-xml2 \
    --without-nettle \
    --disable-static \
    --libexecdir="/usr/lib32/${_pkgname}"

  make
}

check() {
  cd "${_pkgname}-${pkgver}"
  make check
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
