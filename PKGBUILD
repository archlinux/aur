# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: TheWaffleGuy <gvxq at hotmail dot com>
# Contributor: Andreas Radke <andyrtr at archlinux dot org>

pkgname=lib32-libgcrypt15
pkgver=1.5.6
pkgrel=1
pkgdesc='General purpose cryptographic library based on the code from GnuPG (32-bit)'
arch=('x86_64')
url='http://www.gnupg.org'
license=('LGPL')
depends=('lib32-libgpg-error')
makedepends=('gcc-multilib' 'libtool-multilib')
source=("ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2")
sha512sums=('2c16912de66bc83adfbf8f43a2a9f57e1afcc866b1774ec11a670e2a793a7c5f2029d134c0bda681c9cb95f7dcc166133782c124e520b7fbe246ec10a9e1c06a')

prepare() {
  cd libgcrypt-${pkgver}
  sed 's:path="amd64":path="i586 i386":' -i mpi/config.links
}

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS+=' -m32'
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd libgcrypt-${pkgver}
  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --enable-shared \
    --disable-padlock-support \
    --disable-static
  make
}

check() {
  cd libgcrypt-${pkgver}
  make check
}

package() {
  cd libgcrypt-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/libgcrypt.so,share}
}
