# Maintainer: Andrei Gherzan <andrei@gherzan.com>
# Contributor: Dan Ziemba <zman0900@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail at cvigano dot de>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgbasename=gnutls
pkgname=${_pkgbasename}28
pkgver=3.3.26
pkgrel=1
pkgdesc="A library which provides a secure layer over a reliable transport layer (legacy version)"
arch=('i686' 'x86_64')
license=('GPL3' 'LGPL2.1')
url="http://gnutls.org/"
depends=('zlib' 'nettle' 'p11-kit' 'libtasn1' 'libidn')
makedepends=('net-tools')
provides=('libgnutls28')
conflicts=('libgnutls28')
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
sha256sums=(
    '6a7d882b6b581d684883fde195abf930dab37dfbe6aaea88ab164252bec720d9'
    'SKIP'
)
validpgpkeys=(1F42418905D8206AA754CCDC29EE58B996865171)

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  # Guile disabled for conflict with 3.4.x package
  # CXX disabled because 3.4.x builds same version libgnutlsxx.so.28.1.0
  # openssl, dane, tpm disabled to match 3.4.x package even when building
  #   outside chroot where those deps are installed
  # local libopts enabled to prevent build issue when autogen is installed
  ./configure --prefix=/usr --libdir=/usr/lib \
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

  mv "${pkgdir}"/usr/lib/pkgconfig/gnutls{,28}.pc
  rm -rf "${pkgdir}"/usr/{lib/*.so,share/{info,locale}}
}
