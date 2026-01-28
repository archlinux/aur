# Maintainer: solarfire <xatra169@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.org>
_pkgver='1.1.1w'
pkgname='openssl-1.1'
pkgver='1.1.1.w'
pkgrel='5'
pkgdesc='OpenSSL 1.1 legacy branch (deprecated)'

arch=('x86_64')
url='https://openssl-library.org/source/old/1.1.1'
license=('OpenSSL')
provides=('libcrypto.so=1.1-64' 'libssl.so=1.1-64')

depends=('glibc')
makedepends=('perl')

source=(
  "https://github.com/openssl/openssl/releases/download/OpenSSL_1_1_1w/openssl-${_pkgver}.tar.gz"
)

sha512sums=(
  'b4c625fe56a4e690b57b6a011a225ad0cb3af54bd8fb67af77b5eceac55cc7191291d96a660c5b568a08a2fbf62b4612818e7cca1bb95b2b6b4fc649b0552b6d'
)

build() {
  cd "${srcdir}/openssl-${_pkgver}"

  ./config --prefix=/usr \
    --libdir=lib/openssl-1.1
  make
}

check() {
  cd "${srcdir}/openssl-${_pkgver}"
  make test
}

package() {
  cd "${srcdir}/openssl-${_pkgver}"
  make DESTDIR="${pkgdir}" install_sw
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -r ${pkgdir}/usr/bin

  mkdir ${pkgdir}/usr/include/openssl-1.1/
  mv ${pkgdir}/usr/include/openssl/ ${pkgdir}/usr/include/openssl-1.1/

  mv ${pkgdir}/usr/lib/openssl-1.1/{libssl.so.1.1,libcrypto.so.1.1} ${pkgdir}/usr/lib
}
