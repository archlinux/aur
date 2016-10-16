# Maintainer: Jannik Birk <birk.jannik@gmail.com>

_target=i686-elf
pkgname=$_target-binutils
pkgver=2.27
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the i686-elf target'
arch=(i686 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2)
sha256sums=('369737ce51587f92466041a97ab7d2358c6d9e1b6490b3940eb09fb0a9a6ac88')

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
