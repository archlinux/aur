# Maintainer: Maik Broemme <mbroemme@libmpq.org>
# Donate BTCS: 13xcw57QyS8h6GuxtbatAH9S6igwytd7Uo
pkgname="bitcoin-scrypt-git-qt"
pkgdesc="Bitcoin Scrypt is a decentralised currency and using the Scrypt algorithm - Qt"
pkgver=20150909.815a15f
pkgrel=2
arch=("i686" "x86_64")
url="http://bitcoinscrypt.co/"
license=("MIT")
depends=("boost-libs" "qt4" "miniupnpc" "qrencode" "openssl-1.0")
makedepends=("boost" "automoc4")
provides=("bitcoin-scrypt-qt")
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
  SUBLIBS="-L/usr/lib/openssl-1.0 -lssl -lcrypto" make
}

package() {
  cd "${srcdir}/bitcoin-scrypt"
  install -D -m 0755 Bitcoin-sCrypt "${pkgdir}/usr/bin/Bitcoin-sCrypt"
  install -D -m 0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
