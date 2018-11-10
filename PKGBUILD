# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Llewelyn Trahaearn <woefulderelict@gmail.com>
# Contributor: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=lib32-libgcrypt15
pkgver=1.5.6
pkgrel=5
pkgdesc='General purpose cryptographic library based on the code from GnuPG'
arch=('x86_64')
url='http://www.gnupg.org'
license=('LGPL')
depends=('lib32-glibc' 'lib32-libgpg-error')
replaces=('lib32-libgcrypt11')
source=("https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2"{,.sig})
sha256sums=('301826b5e521c867056fd630aad6f0a60e176d18a017da6bc24b1695df3abe79'
            'SKIP')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch

prepare() {
  cd libgcrypt-${pkgver}

  sed 's/path="amd64"/path="i586 i386"/' -i mpi/config.links
}

build() {
  cd libgcrypt-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-static \
    --disable-padlock-support
  make
}

package() {
  cd libgcrypt-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/libgcrypt.so,share}
}

# vim: ts=2 sw=2 et:
