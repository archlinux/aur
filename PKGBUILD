# Maintainer: Jesus Alonso <doragasu at hotmail dot com>
# NOTE: As I want these packages for Genesis/Megadrive development, they do
# only support the m68000 CPU. If you want to support other m68k variants,
# either modify _target_cpu to suit your needs, or go wild, remove the
# --with-cpu switches and change --disable-multilib with --enable-multilib.
# Be warned that multilib packages will take a lot more time to build, and
# will also require more disk space.

_target=m68k-elf
_target_cpu=m68000
pkgname=${_target}-gcc
pkgver=7.3.0
_mpfrver=4.0.1
_mpcver=1.1.0
_gmpver=6.1.2
pkgrel=1
pkgdesc="The GNU Compiler Collection (${_target})"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
depends=("${_target}-binutils>=2.29-1" 'zlib')
options=('!emptydirs' '!distcc' '!strip')
conflicts=("${_target}-gcc-bootstrap")
replaces=("${_target}-gcc-bootstrap")
provides=("${_target}-gcc-bootstrap=${pkgver}")
source=("http://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
        "http://ftp.gnu.org/gnu/mpfr/mpfr-${_mpfrver}.tar.xz"
        "http://ftp.gnu.org/gnu/mpc/mpc-${_mpcver}.tar.gz"
        "http://ftp.gnu.org/gnu/gmp/gmp-${_gmpver}.tar.xz")

sha256sums=('832ca6ae04636adbb430e865a1451adf6979ab44ca1c8374f61fba65645ce15c'
            '67874a60826303ee2fb6affc6dc0ddd3e749e9bfcb4c8655e3953d0458a6e16e'
            '6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e'
            '87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912')

prepare() {
  cd ${srcdir}/gcc-${pkgver}

  # symlinks for in-tree build
  ln -s ../mpfr-${_mpfrver}
  ln -s ../mpc-${_mpcver}
  ln -s ../gmp-${_gmpver}

  # Do not run fixincludes
#  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc,mpfr-${_mpfrver},mpc-${_mpcver},gmp-${_gmpver}}/configure

  mkdir ${srcdir}/gcc-build
}

build() {
  cd ${srcdir}/gcc-build

  ../gcc-${pkgver}/configure --prefix=/usr \
    --target=${_target} \
    --enable-languages="c,c++" \
    --disable-multilib \
	--with-cpu=${_target_cpu} \
    --with-system-zlib \
    --with-newlib \
    --with-libgloss \
    --disable-shared \
    --disable-nls

  make
}

package() {
  cd ${srcdir}/gcc-build

  make DESTDIR=${pkgdir} install

  # Remove unwanted files
  rm -rf ${pkgdir}/usr/share
  rm ${pkgdir}/usr/lib/libcc1.so
  rm ${pkgdir}/usr/lib/libcc1.so.0
  rm ${pkgdir}/usr/lib/libcc1.so.0.0.0

  # Strip it manually
  strip ${pkgdir}/usr/bin/* 2>/dev/null || true
  find ${pkgdir}/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}

