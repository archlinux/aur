# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Llewelyn Trahaearn <woefulderelict@gmail.com>
# Contributor: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=libgcrypt15
pkgver=1.5.6
pkgrel=4
pkgdesc='General purpose cryptographic library based on the code from GnuPG'
arch=('x86_64')
url='http://www.gnupg.org'
license=('LGPL')
depends=('glibc' 'libgpg-error')
replaces=('libgcrypt11')
source=("https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2"{,.sig}
        'libgcrypt15-disable-build-timestamp.patch::https://github.com/gpg/libgcrypt/commit/a785cc3db0c4e8eb8ebbf784b833a40d2c42ec3e.patch')
sha256sums=('301826b5e521c867056fd630aad6f0a60e176d18a017da6bc24b1695df3abe79'
            'SKIP'
            'cbf85bb7e62f3d5b9fcf07fb63a6c7c51d1a01cff7af049f36fd06e4e0b8b3cd')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch

prepare() {
  cd libgcrypt-${pkgver}

  # Remove unreproducible build timestamp
  patch -Np1 -i ../libgcrypt15-disable-build-timestamp.patch

  autoreconf -if
}

build() {
  cd libgcrypt-${pkgver}

  ./configure \
    --prefix='/usr' \
    --disable-static \
    --disable-padlock-support
  make
}

package() {
  cd libgcrypt-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/libgcrypt.so,share}
}

# vim: ts=2 sw=2 et:
