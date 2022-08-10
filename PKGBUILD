# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: aarch64-binutils -> aarch64-linux-api-headers -> aarch64-gcc-bootstrap -> aarch64-glibc -> aarch64-gcc -> aarch64-glibc (again)

_arch=aarch64
_target=$_arch-unknown-linux-gnu
pkgname=$_arch-binutils
pkgver=2.39
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the ARM64 target'
arch=('x86_64')
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=('zlib' 'elfutils')
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig})
sha256sums=('645c25f563b8adc0a81dbd6a41cffbf4d37083a382e02d5d3df4f65c09516d00'
          'SKIP')

validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F)

build() {
  cd binutils-$pkgver

  ./configure \
   --target=$_target \
   --with-sysroot=/usr/$_target/sys-root \
   --prefix=/usr \
   --enable-deterministic-archives \
   --enable-gold \
   --enable-install-libiberty \
	--enable-jansson \
   --enable-ld=default \
   --enable-plugins \
   --enable-relro \
   --enable-shared \
   --enable-threads \
   --disable-gdb \
   --disable-gdbserver \
   --disable-libdecnumber \
   --disable-readline \
   --disable-sim \
   --disable-werror \
   --with-debuginfod \
   --with-pic \
   --with-system-zlib 

  make
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove files that conflict with host version
  rm -r "$pkgdir"/usr/{etc,include,lib,share}
}
