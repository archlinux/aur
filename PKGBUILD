# $Id$
# Maintainer: Timo Sarawinski <t.sarawinski@gmail.com>

_target=arm-none-eabi
pkgname=$_target-linaro-binutils
pkgver=2.40
pkgrel=1
#_commit=2bd25930
pkgdesc='A set of pograms to assemble and manipulate binary and object files for the ARM EABI target with extra flags'
arch=(x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=('libisl' 'cloog' 'gmp' 'mpc' 'mpfr' 'zlib')
makedepends=('perl')
provides=('arm-none-eabi-binutils')
conflicts=('arm-none-eabi-binutils')
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2{,.sig})
sha1sums=('887d24c3799e9fe02646e04e73b5ac2cc3e7188f'
          'SKIP')
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93'  # Tristan Gingold <gingold@adacore.com>
              '3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F'
	      '13FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-$pkgver

  if [ "${CARCH}" != "i686" ]; then
    # enabling gold linker at i686 makes the install fail
    enable_gold='--enable-gold'
  fi

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
              $enable_gold \
              --enable-plugins \
              --enable-deterministic-archives

  make
}

check() {
  cd binutils-$pkgver
  
  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check || true
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/arm-none-eabi-{dlltool,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}
