# $Id$
# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Martin Schmölzer <mschmoelzer@gmail.com>

_target=arm-none-eabi
pkgname=$_target-linaro-binutils
pkgver=2.29.1
pkgrel=1
#_commit=2bd25930
pkgdesc='A set of programs to assemble and manipulate binary and object files for the ARM EABI (bare-metal) target'
arch=(x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=('zlib')
#makedepends=('isl' 'cloog' 'gmp' 'mpc' 'mpfr') 
provides=('arm-none-eabi-binutils')
conflicts=('arm-none-eabi-binutils')
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2{,.sig})
sha1sums=('5156099a6c50bd330c3d4c8fc56a9bf725ccaf08'
          'SKIP')
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93'  # Tristan Gingold <gingold@adacore.com>
              '3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-$pkgver

  ./configure --target=$_target \
              --with-sysroot=/usr/$_target \
              --prefix=/usr \
              --enable-multilib \
              --enable-interwork \
              --with-gnu-as \
              --with-gnu-ld \
	      --enable-lto \
              --enable-vtable-verify \
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
  rm "$pkgdir"/usr/share/man/man1/arm-none-eabi-{dlltool,nlmconv,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}
