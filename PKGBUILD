# $Id$
# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Martin Schmölzer <mschmoelzer@gmail.com>

_target=or1k-elf
pkgname=$_target-binutils
pkgver=2.27
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the OpenRISC (bare-metal) target'
arch=(i686 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2{,.sig})
sha1sums=('6e472ddae565a2b1447e6f2393809bb8799982cf'
          'SKIP')
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93')  # Tristan Gingold <gingold@adacore.com>

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-$pkgver

  ./configure --target=$_target \
              --with-sysroot=/usr/$_target \
              --prefix=/usr \
              --disable-itcl \
              --disable-tk \
              --disable-tcl \
              --disable-winsup \
              --disable-gdbtk \
              --disable-libgui \
              --disable-rda \
              --disable-sid \
              --disable-sim \
              --disable-gdb \
              --disable-newlib \
              --disable-libgloss \
              --with-system-zlib \
              --with-gnu-as \
              --with-gnu-ld \
              --disable-nls \
              --enable-ld=default \
              --enable-gold \
              --enable-plugins \
              --enable-deterministic-archives

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
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,nlmconv,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}
