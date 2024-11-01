# Maintainer: leap123 <leap123 at canaglie dot org>
# Contributor: Jesus Alonso <doragasu at hotmail dot com>

_target=m68k-palmos-elf
_target_cpu=m68000
pkgname=${_target}-binutils
pkgver=2.42
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (${_target})"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
depends=('glibc>=2.23' 'zlib')
options=('staticlibs' '!distcc' '!ccache')
PKGEXT=".pkg.tar.zst"
source=(https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz
        https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz.sig)
sha256sums=(SKIP
            SKIP)
validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F)
prepare() {
  cd binutils-${pkgver}

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  mkdir ${srcdir}/binutils-build
}

build() {
  cd binutils-build

  ../binutils-${pkgver}/configure --prefix=/usr \
      --target=${_target} \
      --disable-multilib \
      --with-cpu=${_target_cpu} \
      --disable-nls

  make
}

package() {
  cd binutils-build
  make prefix=${pkgdir}/usr install

  # Remove unwanted and conflicting files
  rm -rf ${pkgdir}/usr/share
  rm ${pkgdir}/usr/lib/bfd-plugins/libdep.so
}

