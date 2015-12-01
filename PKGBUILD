# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail at cvigano dot de>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgbasename=gnutls
pkgname=lib32-${_pkgbasename}28
pkgver=3.3.17.1
pkgrel=2
pkgdesc="A library which provides a secure layer over a reliable transport layer (32-bit, legacy version)"
arch=('x86_64')
license=('GPL3' 'LGPL2.1')
url="http://gnutls.org/"
depends=('lib32-zlib' 'lib32-nettle' 'lib32-p11-kit' 'lib32-libtasn1' $_pkgbasename)
provides=('lib32-libgnutls28')
conflicts=('lib32-libgnutls28')
makedepends=('gcc-multilib' 'lib32-libidn')
source=(ftp://ftp.gnutls.org/gcrypt/gnutls/v3.3/${_pkgbasename}-${pkgver}.tar.xz{,.sig})
sha256sums=('b40f158030a92f450a07b20300a3996710ca19800848d9f6fd62493170c5bbb4'
            'SKIP')
validpgpkeys=(1F42418905D8206AA754CCDC29EE58B996865171)

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  # build fails without --disable-hardware-acceleration because of assembler errors
  ./configure --prefix=/usr --libdir=/usr/lib32 \
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

  install -m 755 -d "${pkgdir}"/usr/lib32/gnutls28
  mv "${pkgdir}"/usr/{include,lib32/gnutls28}
  rm -rf "${pkgdir}"/usr/{bin,share,lib32/{*.so,pkgconfig}}
}
