# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: armv7l-binutils -> armv7l-linux-api-headers -> armv7l-gcc-bootstrap -> armv7l-glibc -> armv7l-gcc -> armv7l-glibc (again)

_arch=armv7l
_target=$_arch-unknown-linux-gnueabihf
pkgname=$_arch-binutils
pkgver=2.42
pkgrel=1
_commit=c7f28aad0c99d1d2fec4e52ebfa3735d90ceb8e9
pkgdesc='A set of programs to assemble and manipulate binary and object files for the ARM target'
arch=('x86_64')
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=('glibc' 'zlib' 'elfutils')
makedepends=('git')
source=(git+https://sourceware.org/git/binutils-gdb.git#commit=${_commit})
sha256sums=('2ce85b77e2d24e34edb5f5ddd11e73279de79a7aebb8cf2d33aad7f1244790c6')

validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93'  # Tristan Gingold <gingold@adacore.com>
              '3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
		  mkdir -p binutils-build
}

build() {
  cd binutils-build

  "$srcdir"/binutils-gdb/configure \
   --target=$_target \
   --with-sysroot=/usr/$_target/sys-root \
   --prefix=/usr \
	--enable-default-execstack=no \
   --enable-deterministic-archives \
   --enable-gold \
   --enable-install-libiberty \
   --enable-jansson \
   --enable-ld=default \
   --enable-new-dtags \
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
   --with-system-zlib \

  make
}

package() {
  cd binutils-build

  make DESTDIR="$pkgdir" install

  # Remove files that conflict with host version
  rm -rf "$pkgdir"/usr/{etc,include,lib,share}
}

