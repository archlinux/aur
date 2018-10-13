# Maintainer: Ruben Van Boxem <vanboxem.ruben@gmail.com>
# Contributor: Dan Ziemba <zman0900@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail at cvigano dot de>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgbasename=gnutls
pkgname=lib32-${_pkgbasename}28
pkgver=3.3.30
pkgrel=1
pkgdesc="A library which provides a secure layer over a reliable transport layer (32-bit, legacy version)"
arch=('x86_64')
license=('GPL3' 'LGPL2.1')
url="http://gnutls.org/"
depends=("${_pkgbasename}28" 'lib32-zlib' 'lib32-nettle' 'lib32-p11-kit'
         'lib32-libtasn1')
provides=('lib32-libgnutls28')
conflicts=('lib32-libgnutls28')
makedepends=('gcc-multilib' 'lib32-libidn' 'net-tools')
# Upstream
_mirror="ftp://ftp.gnutls.org/gcrypt/gnutls/v3.3"
# Mirror: Sweden
#_mirror="https://mirror.se.partyvan.eu/pub/ftp.gnupg.org/gcrypt/gnutls/v3.3"
# Mirror: Denmark
#_mirror="http://mirrors.dotsrc.org/gcrypt/gnutls/v3.3"
# Mirror: Hungary
#_mirror="ftp://ftp.crysys.hu/pub/gnupg/gnutls/v3.3"
_downloadUrl="${_mirror}/${_pkgbasename}-${pkgver}.tar.xz"
source=(
    "${_downloadUrl}"
    "${_downloadUrl}.sig"
)
sha256sums=('41d70107ead3de2f12390909a05eefc9a88def6cd1f0d90ea82a7dac8b8effee'
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
  #make -k check
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib32/pkgconfig/gnutls{,28}.pc
  rm -rf "${pkgdir}"/usr/{bin,include,share,lib32/*.so}
}
