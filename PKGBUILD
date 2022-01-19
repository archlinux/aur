# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Llewelyn Trahaearn <woefulderelict@gmail.com>
# Contributor: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=lib32-libgcrypt15
pkgver=1.5.6
pkgrel=6
pkgdesc='General purpose cryptographic library based on the code from GnuPG'
arch=(x86_64)
url=https://gnupg.org/
license=(LGPL)
depends=(
  lib32-glibc
  lib32-libgpg-error
)
makedepends=(git)
replaces=(lib32-libgcrypt11)
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
  # fix arch
  sed 's/path="amd64"/path="i586 i386"/' -i mpi/config.links
  autoreconf -fiv
}

build() {
  cd libgcrypt
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static \
    --disable-padlock-support
  make
}

package() {
  make DESTDIR="${pkgdir}" install -C libgcrypt
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/libgcrypt.so,share}
}

# vim: ts=2 sw=2 et:
