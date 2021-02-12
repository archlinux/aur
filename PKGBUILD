# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: armv7l-binutils -> armv7l-linux-api-headers -> armv7l-gcc-bootstrap -> armv7l-glibc -> armv7l-gcc -> armv7l-glibc (again)

_arch=armv7l
_target=$_arch-unknown-linux-gnueabihf
pkgname=$_arch-binutils
pkgver=2.36.1
pkgrel=2
pkgdesc='Cross binutils for armv7l'
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

  #hack - Having CPPFLAGS defined makes the build barf. Workaround it like this:
  _cppflags=$CPPFLAGS
  CFLAGS="$_cppflags $CFLAGS"
  CXXFLAGS="$CFLAGS"
  unset CPPFLAGS
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
				  --with-debuginfod \
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
