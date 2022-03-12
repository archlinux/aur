# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: aarch64-binutils -> aarch64-linux-api-headers -> aarch64-gcc-bootstrap -> aarch64-glibc -> aarch64-gcc -> aarch64-glibc (again)

_arch=aarch64
_target=$_arch-unknown-linux-gnu
pkgname=$_arch-binutils
pkgver=2.37
pkgrel=2
pkgdesc='A set of programs to assemble and manipulate binary and object files for the ARM64 target'
arch=('x86_64')
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=('zlib' 'elfutils')
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig})
sha256sums=('820d9724f020a3e69cb337893a0b63c2db161dadcb0e06fc11dc29eb1e84a32c'
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
   --enable-ld=default \
   --enable-lto \
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
  rm -r "$pkgdir"/usr/{include,lib,share}
}
