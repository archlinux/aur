# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>

_pkgname=libarchive
pkgname=lib32-${_pkgname}
pkgver=3.1.2
pkgrel=2
pkgdesc="library that can create and read several streaming archive formats (32 bit)"
arch=('x86_64')
url="http://libarchive.org"
license=('BSD')
depends=('lib32-acl' 'lib32-bzip2' 'lib32-expat' 'lib32-lzo' 'lib32-openssl' 'lib32-xz' "${_pkgname}")
makedepends=('gcc-multilib' 'lib32-zlib')
source=("http://libarchive.org/downloads/${_pkgname}-${pkgver}.tar.gz"
        '0001-mtree-fix-line-filename-length-calculation.patch')
md5sums=('efad5a503f66329bb9d2f4308b5de98a'
         '9727baf88b928417d5d1269891b1209a')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # https://code.google.com/p/libarchive/issues/detail?id=301
  # upstream commit e65bf287f0133426b26611fe3e80b51267987106
  patch -Np1 -i "${srcdir}/0001-mtree-fix-line-filename-length-calculation.patch"
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --without-xml2 --libdir=/usr/lib32 \
              --without-nettle --libexecdir="/usr/lib32/${_pkgname}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}

  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s ${_pkgname} "${pkgdir}"/usr/share/licenses/${pkgname}
}
