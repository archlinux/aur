# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=scute
pkgver=1.7.0
pkgrel=1
pkgdesc="GnuPG PKCS#11 module for using OpenPGP smartcards with X.509"
arch=(i686 x86_64)
url="https://github.com/gpg/scute"
license=(GPL2)
depends=(
    'gnupg'
    'pinentry'
)
makedepends=(
    'libgpg-error'
    'libassuan'
    'texinfo'
)
source=(
    "https://gnupg.org/ftp/gcrypt/scute/scute-$pkgver.tar.bz2"
    "https://gnupg.org/ftp/gcrypt/scute/scute-$pkgver.tar.bz2.sig"
    "fix-build.patch"
)
sha1sums=(
    '3f8a0ba9c7821049d51b982141a2330a246beb55'
    'SKIP'
    '71c853f6f12c036f3da0dc54ac2db91c2108bf00'
)
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA')

prepare() {
    patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/fix-build.patch"
}

build() {
  cd scute-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd scute-$pkgver
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir"/usr/lib/pkcs11
  ln -s ../scute.so "$pkgdir"/usr/lib/pkcs11/scute.so

  mkdir -p "$pkgdir"/usr/share/p11-kit/modules
  echo "module: scute.so" > "$pkgdir"/usr/share/p11-kit/modules/scute.module
}

# vim: ts=2:sw=2:et
