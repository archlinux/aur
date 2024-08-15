# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: armv7l-binutils -> armv7l-linux-api-headers -> armv7l-gcc-bootstrap -> armv7l-glibc -> armv7l-gcc -> armv7l-glibc (again)

_arch=armv7l
_target=$_arch-unknown-linux-gnueabihf
pkgname=$_arch-gcc-bootstrap
pkgver=14.2.1
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for armv7l - bootstrap compiler'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=(libmpc zstd libisl)
makedepends=($_arch-binutils git)
provides=($_arch-gcc)
conflicts=($_arch-gcc)
options=(!emptydirs !strip staticlibs)
# https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git
_commit=04696df09633baf97cdbbdd6e9929b9d472161d3
source=(git+https://sourceware.org/git/gcc.git#commit=${_commit})

sha256sums=('a0c5c9a2e09198436b0bcccba6deef7cb439a5364d56ffbb9ac17a9d24240034')

validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62) # Jakub Jelinek <jakub@redhat.com>

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

  rm -rf "$srcdir"/gcc-build
  mkdir "$srcdir"/gcc-build
}

build() {
  cd gcc-build

  # Credits @allanmcrae
  # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
  # TODO: properly deal with the build issues resulting from this
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  "$srcdir"/gcc/configure \
      --prefix=/usr \
      --with-sysroot=/usr/$_target/sys-root \
      --libexecdir=/usr/lib \
      --target=$_target \
      --disable-nls \
      --enable-languages=c \
      --with-system-zlib \
      --disable-multilib --disable-werror \
      --disable-threads --without-headers  \
      --disable-shared --with-newlib

  make all-gcc all-target-libgcc
}

package() {
  cd gcc-build

  make install-strip-gcc install-strip-target-libgcc DESTDIR="$pkgdir"
  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/{include,share}

}
