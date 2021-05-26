# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: aarch64-binutils -> aarch64-linux-api-headers -> aarch64-gcc-bootstrap -> aarch64-glibc -> aarch64-gcc -> aarch64-glibc (again)

_arch=aarch64
_target=$_arch-unknown-linux-gnu
pkgname=$_arch-binutils
pkgver=2.36.1
pkgrel=3
pkgdesc='A set of programs to assemble and manipulate binary and object files for the ARM64 target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=('libelf')
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig})
sha256sums=('e81d9edf373f193af428a0f256674aea62a9d74dfe93f65192d4eae030b0f3b0'
          'SKIP')
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93'  # Tristan Gingold <gingold@adacore.com>
              '3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  cd binutils-$pkgver
}

build() {
  cd binutils-$pkgver

  ./configure --target=$_target \
              --with-sysroot=/usr/$_target/sys-root \
              --prefix=/usr \
              --disable-multilib \
              --disable-nls \
              --enable-gold \
              --enable-plugins \
              --enable-deterministic-archives \
              --enable-relro \
              --with-pic \
              --with-system-zlib

  make
}

check() {
  cd binutils-$pkgver
  make
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Replace hard links with symlinks
  for file in $(ls "$pkgdir"/usr/$_target/bin)
  do
    rm "$pkgdir"/usr/$_target/bin/$file
	 ln -sv ../../bin/$_target-$file "$pkgdir"/usr/$_target/bin/$file
  done

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info

  #Remove .so that conflict with host version
  rm -r "$pkgdir"/usr/lib
}
