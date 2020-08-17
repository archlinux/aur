# Maintainer: Alex Bates <hi@imalex.xyz>

_target=mips-linux-gnu
pkgname=$_target-binutils
pkgver=2.35
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the MIPS target'
arch=(i686 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2)
sha1sums=('148cd8a885276b89aee37ed35927ff3949eaaba8')

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-$pkgver

  ./configure --target=$_target \
              --with-sysroot=/usr/$_target \
              --prefix=/usr \
              --disable-multilib \
              --with-gnu-as \
              --with-gnu-ld \
              --disable-nls \
              --enable-ld=default \
              --enable-plugins \
              --enable-deterministic-archives \
              --disable-werror

  make
}

check() {
  cd binutils-$pkgver
  
  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make -k LDFLAGS="" check || true
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}
