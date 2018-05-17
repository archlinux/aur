# Maintainer: Jannik Birk <birk.jannik@gmail.com>

_target=i586-elf
pkgname=$_target-binutils
pkgver=2.30
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the i586-elf target'
arch=(i586 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2)
sha256sums=('efeade848067e9a03f1918b1da0d37aaffa0b0127a06b5e9236229851d9d0c09')

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-$pkgver

  ./configure --target=$_target \
              --with-sysroot=/usr/$_target \
              --prefix=/usr \
              --disable-nls \
              --disable-werror

  make
}

check() {
  cd binutils-$pkgver
  
  # do not abort on errors - manually check log files
  make -k check
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,nlmconv,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -rf "$pkgdir"/usr/share/info
}
