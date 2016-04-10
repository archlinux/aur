# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail at cvigano dot de>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgbasename=gnutls
pkgname=lib32-${_pkgbasename}28
pkgver=3.3.22
pkgrel=2
pkgdesc="A library which provides a secure layer over a reliable transport layer (32-bit, legacy version)"
arch=('x86_64')
license=('GPL3' 'LGPL2.1')
url="http://gnutls.org/"
depends=("${_pkgbasename}28" 'lib32-zlib' 'lib32-nettle' 'lib32-p11-kit'
         'lib32-libtasn1')
provides=('lib32-libgnutls28')
conflicts=('lib32-libgnutls28')
makedepends=('gcc-multilib' 'lib32-libidn')
source=(ftp://ftp.gnutls.org/gcrypt/gnutls/v3.3/${_pkgbasename}-${pkgver}.tar.xz{,.sig})
sha256sums=('0ffa233e022e851f3f5f7811ac9223081a0870d5a05a7cf35a9f22e173c7b009'
            'SKIP')
validpgpkeys=(1F42418905D8206AA754CCDC29EE58B996865171)

build() {
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  # Guile disabled for conflict with 3.4.x package
  # CXX disabled because 3.4.x builds same version libgnutlsxx.so.28.1.0
  # openssl, dane, tpm disabled to match 3.4.x package even when building
  #   outside chroot where those deps are installed
  # local libopts enabled to prevent build issue when autogen is installed
  ./configure --build=i686-pc-linux-gnu \
    --prefix=/usr --libdir=/usr/lib32 \
    --includedir=/usr/include/gnutls28 \
    --program-suffix=28 \
    --with-zlib \
    --disable-static \
    --disable-guile \
    --with-default-trust-store-pkcs11="pkcs11:model=p11-kit-trust;manufacturer=PKCS%2311%20Kit" \
    --disable-cxx \
    --disable-openssl-compatibility \
    --enable-local-libopts \
    --disable-libdane \
    --without-tpm \
    --disable-valgrind-tests
  make
}

check() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make -k check
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib32/pkgconfig/gnutls{,28}.pc
  rm -rf "${pkgdir}"/usr/{bin,include,share,lib32/*.so}
}
