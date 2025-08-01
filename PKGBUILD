# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: armv7l-binutils -> armv7l-linux-api-headers -> armv7l-gcc-bootstrap -> armv7l-glibc -> armv7l-gcc -> armv7l-glibc (again)

_arch=armv7l
_target=$_arch-unknown-linux-gnueabihf
pkgname=$_arch-binutils
pkgver=2.45
pkgrel=1
_commit=2bc7af1ff7732451b6a7b09462a815c3284f9613
pkgdesc='A set of programs to assemble and manipulate binary and object files for armv7l'
arch=('x86_64')
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=('glibc' 'zlib' 'elfutils')
makedepends=('git')
source=(git+https://sourceware.org/git/binutils-gdb.git#commit=${_commit}
  gold-warn-unsupported.patch
)
sha256sums=('005763c1ecf23168be877788ed148467d31b1852ff15b27c0f69343c2a64652a'
            '2d430b66f84a19c154725ec535280c493be1d34f1a90f95208dce02fecd0e4e4')

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

