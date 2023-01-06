# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: aarch64-binutils -> aarch64-linux-api-headers -> aarch64-gcc-bootstrap -> aarch64-glibc -> aarch64-gcc -> aarch64-glibc (again)

_arch=aarch64
_target=$_arch-unknown-linux-gnu
pkgname=$_arch-gcc
pkgver=12.2.0
pkgrel=3
pkgdesc='The GNU Compiler Collection - cross compiler for ARM64 target'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=(libmpc zstd libisl)
makedepends=($_arch-binutils $_arch-glibc)
replaces=($_arch-gcc-bootstrap)
options=(!emptydirs !strip staticlibs)
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig}
)

sha256sums=('e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff'
	'SKIP')

validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62) # Jakub Jelinek <jakub@redhat.com>

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux ARM installs aarch64 libraries /lib
  sed -i '/lp64=/s/lib64/lib/' gcc/config/aarch64/t-aarch64-linux

  rm -rf "$srcdir"/gcc-build
  mkdir "$srcdir"/gcc-build
}

build() {
  cd gcc-build

  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  _CFLAGS_FOR_TARGET="-march=armv8-a -O2 -pipe -fstack-protector-strong -fno-plt -fexceptions \
  -Wp,-D_FORTIFY_SOURCE=2 -Wformat \
  -fstack-clash-protection"
  _CXXFLAGS_FOR_TARGET="$_CFLAGS_FOR_TARGET -Wp,-D_GLIBCXX_ASSERTIONS"

  "$srcdir"/gcc/configure \
      --prefix=/usr \
      --with-sysroot=/usr/$_target/sys-root \
      --libexecdir=/usr/lib \
      --with-bugurl=https://aur.archlinux.org/packages/aarch64-gcc \
      --target=$_target \
      --with-linker-hash-style=gnu \
      --with-system-zlib \
      --enable-__cxa_atexit \
      --enable-checking=release \
      --enable-clocale=gnu \
      --enable-default-pie \
      --enable-default-ssp \
      --enable-gnu-indirect-function \
      --enable-gnu-unique-object \
		--enable-libstdcxx-backtrace \
      --enable-linker-build-id \
      --enable-lto \
      --enable-plugin \
      --enable-shared \
      --enable-threads=posix \
      --disable-libssp \
      --disable-libstdcxx-pch \
      --disable-multilib \
      --disable-werror \
      --enable-languages=c,c++,fortran \
      --with-arch=armv8-a \
      --enable-fix-cortex-a53-835769 --enable-fix-cortex-a53-843419 CFLAGS_FOR_TARGET="${_CFLAGS_FOR_TARGET}" CXXFLAGS_FOR_TARGET="${_CXXFLAGS_FOR_TARGET}"

  make
}

package() {
  cd gcc-build

  make install-strip DESTDIR="$pkgdir"
  ln -s $_target-gcc "$pkgdir"/usr/bin/$_target-cc
  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/{include,lib/libcc*,share}
}
