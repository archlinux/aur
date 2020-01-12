# Maintainer: Mateusz Kaczanowski <kaczanowski.mateusz@gmail.com>
# Adapted from arm-none-eabi-binutils by Anatol Pomozov <anatol.pomozov@gmail.com>

_target=epiphany-elf
pkgname=$_target-binutils
pkgver=2.33.1
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the Adapteva Epiphany target'
arch=(i686 x86_64 armv7h)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2)
sha1sums=('332c7df7e1830c1e756cf4a5542a7952200210c1')

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
  rm "$pkgdir"/usr/share/man/man1/${_target}-{dlltool,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -rf "$pkgdir"/usr/share/info
}
