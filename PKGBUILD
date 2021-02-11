# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Llewelyn Trahaearn <woefulderelict@gmail.com>
# Contributor: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=libgcrypt15-minimal-git
pkgver=1.5.6
pkgrel=1
pkgdesc='General purpose cryptographic library based on the code from GnuPG'
arch=('x86_64')
url='http://www.gnupg.org'
license=('LGPL')
makedepends=(fig2dev libjpeg)
depends=('glibc' 'libgpg-error')
replaces=('libgcrypt11')
provides=(libgcrypt15)
conflicts=(libgcrypt15)
source=(git://git.gnupg.org/libgcrypt.git#branch=LIBGCRYPT-1-5-BRANCH
        'libgcrypt15-disable-build-timestamp.patch::https://github.com/gpg/libgcrypt/commit/a785cc3db0c4e8eb8ebbf784b833a40d2c42ec3e.patch')
sha256sums=('SKIP'
            'SKIP')
#validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch

pkgver() {
  cd libgcrypt
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libgcrypt

  # Remove unreproducible build timestamp
  patch -Np1 -i ../libgcrypt15-disable-build-timestamp.patch
}

build() {
  cd libgcrypt

  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --disable-static \
    --disable-O-flag-munging \
    --enable-maintainer-mode \
    --disable-padlock-support
  make
}

package() {
  cd libgcrypt

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/libgcrypt.so,share}
}

# vim: ts=2 sw=2 et:
