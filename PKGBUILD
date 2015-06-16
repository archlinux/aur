# Maintainer: Jonathan Scott Tinkham <sctincman@gmail.com>
# Adapted from arm-none-eabi-binutils by Anatol Pomozov <anatol.pomozov@gmail.com>

_target=epiphany-elf
pkgname=$_target-binutils
pkgver=2.25
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the Adapteva Epiphany target'
arch=(i686 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2)
sha1sums=('b46cc90ebaba7ffcf6c6d996d60738881b14e50d')

build() {
  cd binutils-$pkgver

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  ./configure --target=$_target \
              --prefix=/usr \
              --enable-multilib \
              --enable-interwork \
              --with-gnu-as \
              --with-gnu-ld \
              --disable-nls \
	      --disable-werror

  make configure-host
  make
}

check() {
  cd binutils-$pkgver
  
  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/${_target}-{dlltool,nlmconv,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -rf "$pkgdir"/usr/share/info
}
