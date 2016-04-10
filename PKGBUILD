# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail at cvigano dot de>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgbasename=gnutls
pkgname=${_pkgbasename}28
pkgver=3.3.22
pkgrel=1
pkgdesc="A library which provides a secure layer over a reliable transport layer (legacy version)"
arch=('i686' 'x86_64')
license=('GPL3' 'LGPL2.1')
url="http://gnutls.org/"
depends=('zlib' 'nettle' 'p11-kit' 'libtasn1' $_pkgbasename)
provides=('libgnutls28')
conflicts=('libgnutls28')
makedepends=('libidn')
source=(ftp://ftp.gnutls.org/gcrypt/gnutls/v3.3/${_pkgbasename}-${pkgver}.tar.xz{,.sig})
sha256sums=('0ffa233e022e851f3f5f7811ac9223081a0870d5a05a7cf35a9f22e173c7b009'
            'SKIP')
validpgpkeys=(1F42418905D8206AA754CCDC29EE58B996865171)

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  # build fails without --disable-hardware-acceleration because of assembler errors
  ./configure --prefix=/usr --libdir=/usr/lib \
    --includedir=/usr/include/gnutls28 \
    --program-suffix=28 \
    --with-zlib \
    --disable-static \
    --disable-guile \
    --disable-valgrind-tests --disable-hardware-acceleration \
    --disable-cxx --disable-openssl-compatibility --enable-local-libopts
  make
}

check() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make -k check
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib/pkgconfig/gnutls{,28}.pc
  rm -rf "${pkgdir}"/usr/{lib/*.so,share/{info,locale}}
}
