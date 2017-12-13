# Maintainer: Maik Broemme <mbroemme@libmpq.org>
# Donate BTCS: 13xcw57QyS8h6GuxtbatAH9S6igwytd7Uo
pkgname="bitcoin-scrypt-git-daemon"
pkgdesc="Bitcoin Scrypt is a decentralised currency and using the Scrypt algorithm - daemon"
pkgver=20150909.815a15f
pkgrel=1
arch=("i686" "x86_64")
url="http://bitcoinscrypt.org/"
license=("MIT")
depends=("boost-libs" "qrencode" "miniupnpc" "openssl-1.0")
makedepends=("boost" "automoc4")
provides=("bitcoin-scrypt-daemon")
source=(
  "bitcoin-scrypt::git://github.com/bitcoin-scrypt/bitcoin-scrypt"
  "bitcoin-scrypt-git-boost.patch"
)
sha256sums=(
  "SKIP"
  "740ea08338d7c60338a79a4f56a5f9cb8509a0cf1f1077f7b42f9cde74009f52"
)

pkgver() {
  cd "${srcdir}/bitcoin-scrypt"
  git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

build() {
  cd "${srcdir}/bitcoin-scrypt"
  patch -Np1 -i ../bitcoin-scrypt-git-boost.patch
  qmake-qt4 USE_QRCODE=1 USE_DBUS=1 USE_UPNP=1 OPENSSL_INCLUDE_PATH=/usr/include/openssl-1.0 OPENSSL_LIB_PATH=/usr/lib/openssl-1.0 Bitcoin-sCrypt.pro
  OPENSSL_INCLUDE_PATH=/usr/include/openssl-1.0 OPENSSL_LIB_PATH=/usr/lib/openssl-1.0 make -f makefile.unix -C src CXXFLAGS="${CXXFLAGS}"
}

package() {
  provides=("bitcoin-scrypt-daemon")
  cd "${srcdir}/bitcoin-scrypt"
  install -D -m 0755 src/bitcoin-scryptd "${pkgdir}/usr/bin/bitcoin-scryptd"
  install -D -m 0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
