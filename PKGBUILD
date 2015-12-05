# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail at cvigano dot de>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgbasename=gnutls
pkgname=${_pkgbasename}28
pkgver=3.3.19
pkgrel=1
pkgdesc="A library which provides a secure layer over a reliable transport layer (legacy version)"
arch=('i686' 'x86_64')
license=('GPL3' 'LGPL2.1')
url="http://gnutls.org/"
depends=('zlib' 'nettle' 'p11-kit' 'libtasn1' $_pkgbasename)
provides=('libgnutls28')
conflicts=('libgnutls28')
makedepends=('gcc' 'libidn')
source=(ftp://ftp.gnutls.org/gcrypt/gnutls/v3.3/${_pkgbasename}-${pkgver}.tar.xz{,.sig})
sha256sums=('888d8779b48f21959b33d4d9ad0b546e5ec3dea20abf0d9bb03869d56b1f44cf'
            'SKIP')
validpgpkeys=(1F42418905D8206AA754CCDC29EE58B996865171)

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  # build fails without --disable-hardware-acceleration because of assembler errors
  ./configure --prefix=/usr --libdir=/usr/lib \
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

  install -m 755 -d "${pkgdir}"/usr/lib/gnutls28
  mv "${pkgdir}"/usr/{include,lib/gnutls28}
  rm -rf "${pkgdir}"/usr/{bin,share,lib/{*.so,pkgconfig}}
}
