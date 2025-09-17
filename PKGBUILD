# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: armv7l-binutils -> armv7l-linux-api-headers -> armv7l-gcc-bootstrap -> armv7l-glibc -> armv7l-gcc -> armv7l-glibc (again)

_arch=armv7l
_target=$_arch-unknown-linux-gnueabihf
pkgname=$_arch-gcc
pkgver=15.2.1+r22+gc4e96a094636
# https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git
_commit=c4e96a094636b3c15b5e3bfde8673ec3b8172993
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for armv7l'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=(libmpc zstd libisl $_arch-glibc $_arch-binutils)
makedepends=($_arch-binutils git $_arch-linux-api-headers)
provides=($_arch-gcc)
conflicts=($_arch-gcc)
options=(!emptydirs !strip staticlibs)
source=(git+https://sourceware.org/git/gcc.git#commit=${_commit})

sha256sums=('d1d0263f7595e2189110dbe5d12608e144637a6a29a247e41c6926915caab8de')

validpgpkeys=('F3691687D867B81B51CE07D9BBE43771487328A9'  # bpiotrowski@archlinux.org
              '86CFFCA918CF3AF47147588051E8B148A9999C34'  # evangelos@foutrelis.com
              '13975A70E63C361C73AE69EF6EEB81F8981C74C7'  # richard.guenther@gmail.com
              'D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62') # Jakub Jelinek <jakub@redhat.com>

prepare() {
  cd $_basedir

  rm -rf "$srcdir"/gcc-build
  mkdir "$srcdir"/gcc-build
}

build() {
  cd gcc-build
  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}
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
      --disable-nls --enable-default-pie \
      --enable-languages=c,c++ \
      --with-system-zlib --enable-__cxa_atexit \
      --enable-linker-build-id \
      --enable-plugin \
      --with-linker-hash-style=gnu --enable-gnu-indirect-function \
      --disable-multilib --disable-werror \
      --enable-checking=release --enable-host-shared --disable-libssp --disable-libstdcxx-pch \
      --with-arch=armv7-a --with-float=hard --with-fpu=neon

  make
}

package() {
  cd gcc-build

  make install-strip DESTDIR="$pkgdir"
  ln -s $_target-gcc "$pkgdir"/usr/bin/$_target-cc
  # Remove files that conflict with host gcc package
  rm -rf "$pkgdir"/usr/{include,lib/libcc*,share}

}
