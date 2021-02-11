# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Llewelyn Trahaearn <woefulderelict@gmail.com>
# Contributor: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=lib32-libgcrypt15-minimal-git
pkgver=1.5.1
pkgrel=1
pkgdesc='General purpose cryptographic library based on the code from GnuPG'
arch=('x86_64')
url='http://www.gnupg.org'
license=('LGPL')
makedepends=(fig2dev libjpeg)
depends=('lib32-glibc' 'lib32-libgpg-error')
replaces=('lib32-libgcrypt11')
provides=(lib32-libgcrypt15)
conflicts=(lib32-libgcrypt15)
source=(git://git.gnupg.org/libgcrypt.git#branch=LIBGCRYPT-1-5-BRANCH)
sha256sums=('SKIP')
#validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch

pkgver() {
  cd libgcrypt
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libgcrypt

  sed 's/path="amd64"/path="i586 i386"/' -i mpi/config.links
}

build() {
  cd libgcrypt

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-static \
    --enable-maintainer-mode \
    --disable-O-flag-munging \
    --disable-padlock-support
  make
}

package() {
  cd libgcrypt

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/libgcrypt.so,share}
}

# vim: ts=2 sw=2 et:
