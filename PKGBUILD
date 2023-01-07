# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: armv7l-binutils -> armv7l-linux-api-headers -> armv7l-gcc-bootstrap -> armv7l-glibc -> armv7l-gcc -> armv7l-glibc (again)

_arch=armv7l
_target=$_arch-unknown-linux-gnueabihf
pkgname=$_arch-gcc
pkgver=12.2.1
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for armv7l'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=(libmpc zstd libisl $_arch-glibc)
makedepends=($_arch-binutils)
provides=($_arch-gcc)
conflicts=($_arch-gcc)
options=(!emptydirs !strip staticlibs)
_commit=6b1adeb22789e190e87b905761f8a47a2e4e830a
source=(git+https://sourceware.org/git/gcc.git#commit=${_commit})

sha256sums=('SKIP')

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
  rm -r "$pkgdir"/usr/{include,lib/libcc*,share}

}
