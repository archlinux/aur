# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Llewelyn Trahaearn <woefulderelict@gmail.com>
# Contributor: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=libgcrypt15
pkgver=1.5.6
pkgrel=6
pkgdesc='General purpose cryptographic library based on the code from GnuPG'
arch=(x86_64)
url=http://www.gnupg.org
license=(LGPL)
depends=(
  glibc
  libgpg-error
)
makedepends=(git)
replaces=(libgcrypt11)
_tag=6e481d6bf0a69f8c9bd2866eb491e1e4e9b0717f
source=(git+https://github.com/gpg/libgcrypt.git#tag=${_tag})
b2sums=(SKIP)

prepare() {
  cd libgcrypt
  # Remove unreproducible build timestamp
  git cherry-pick -n a785cc3db0c4e8eb8ebbf784b833a40d2c42ec3e
  # disable doc
  sed '/doc\/Makefile/d' -i configure.ac
  sed 's/src doc tests/src tests/g' -i Makefile.am
  autoreconf -fiv
}

build() {
  cd libgcrypt
  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-padlock-support
  make
}

package() {
  make DESTDIR="${pkgdir}" install -C libgcrypt
  rm -rf "${pkgdir}"/usr/{bin,include,lib/libgcrypt.so,share}
}

# vim: ts=2 sw=2 et:
