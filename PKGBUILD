# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>
pkgname=scute
pkgver=1.7.0
pkgrel=2
pkgdesc="GnuPG PKCS#11 module for using OpenPGP smartcards with X.509"
arch=(i686 x86_64)
url="https://github.com/gpg/scute"
license=(GPL2)
depends=(
    'gnupg'
    'pinentry'
)
makedepends=(
    'imagemagick'
    'libgpg-error'
    'libassuan'
    'texinfo'
)
source=(
    "https://gnupg.org/ftp/gcrypt/scute/scute-$pkgver.tar.bz2"
    "https://gnupg.org/ftp/gcrypt/scute/scute-$pkgver.tar.bz2.sig"
    "fix-build.patch::https://git.gnupg.org/cgi-bin/gitweb.cgi?p=scute.git;a=patch;h=49ad2b0e05e3fcb8c8c2e23bb1c6063b390dee02"
)
b2sums=(
    '9a459fc07c53e44d6b194f0f7786644dae7c37402f69cc511ed7e6cc387236cfe01b13400779a90a123461a28e69629abc260f0fad9c302a9b630e23cb8b4293'
    'SKIP'
    '0e49017e664aafc2095399c39a833347247b60952f1771c6359e0b06d483069ef09e39fb3d93e17f0d1df5f34ca13a8dd5e7bd18081dc2caf2a0b00c484e2a5f'
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
