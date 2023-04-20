# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: aarch64-binutils -> aarch64-linux-api-headers -> aarch64-gcc-bootstrap -> aarch64-glibc -> aarch64-gcc -> aarch64-glibc (again)

_arch=aarch64
_target=$_arch-unknown-linux-gnu
pkgname=$_arch-gcc-bootstrap
pkgver=12.2.1
pkgrel=4
pkgdesc='The GNU Compiler Collection - cross compiler for ARM64 target - bootstrap compiler'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=('libmpc' 'zstd' 'libisl')
makedepends=($_arch-binutils git)
provides=($_arch-gcc)
conflicts=($_arch-gcc)
options=(!emptydirs !strip staticlibs)
_commit=015cf9f84b0b6792f982e505392ca574e04c8d23
source=(git+https://sourceware.org/git/gcc.git#commit=${_commit})

sha256sums=('SKIP')

validpgpkeys=('F3691687D867B81B51CE07D9BBE43771487328A9'  # bpiotrowski@archlinux.org
              '86CFFCA918CF3AF47147588051E8B148A9999C34'  # evangelos@foutrelis.com
              '13975A70E63C361C73AE69EF6EEB81F8981C74C7'  # richard.guenther@gmail.com
              'D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62') # Jakub Jelinek <jakub@redhat.com>

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
      --disable-multilib \
      --disable-threads --without-headers \
      --disable-shared --with-newlib --with-arch=armv8-a

  make all-gcc all-target-libgcc
}

package() {
  cd gcc-build

  make install-strip-gcc install-strip-target-libgcc DESTDIR="$pkgdir"
  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/{include,share}

}
