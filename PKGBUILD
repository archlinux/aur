# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: armv7l-binutils -> armv7l-linux-api-headers -> armv7l-gcc-bootstrap -> armv7l-glibc -> armv7l-gcc -> armv7l-glibc (again)

_arch=armv7l
_target=$_arch-unknown-linux-gnueabihf
pkgname=$_arch-binutils
pkgver=2.37
pkgrel=0
pkgdesc='A set of programs to assemble and manipulate binary and object files for 32bit ARM'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=('libelf')
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig})
sha256sums=('820d9724f020a3e69cb337893a0b63c2db161dadcb0e06fc11dc29eb1e84a32c'
            'SKIP')

validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93'  # Tristan Gingold <gingold@adacore.com>
              '3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

build() {
  mkdir binutils-build
  cd binutils-build

   "$srcdir"/binutils-$pkgver/configure --target=$_target \
              --with-sysroot=/usr/$_target/sys-root \
              --prefix=/usr \
              --disable-nls \
              --enable-gold \
              --enable-plugins \
              --enable-deterministic-archives \
              --enable-relro \
              --with-debuginfod \
              --with-pic \
              --with-system-zlib

  make
}

package() {
  cd binutils-build

  make DESTDIR="$pkgdir" install

  #Remove files that conflicts with native binutils
  rm -r "$pkgdir"/usr/{share/info,lib}

}
