# Maintainer: Jesus Alonso <doragasu at hotmail dot com>
# NOTE: As I want these packages for Genesis/Megadrive development, they do
# only support the m68000 CPU. If you want to support other m68k variants,
# either modify _target_cpu to suit your needs, or go wild, remove the
# --with-cpu switches and change --disable-multilib with --enable-multilib.
# Be warned that multilib packages will take a lot more time to build, and
# will also require more disk space.

_target=m68k-elf
_target_cpu=m68000
pkgname=${_target}-gcc-bootstrap
pkgver=7.3.0
_mpfrver=4.0.1
_mpcver=1.1.0
_gmpver=6.1.2
pkgrel=1
pkgdesc="The GNU Compiler Collection. Bootstrap for toolchain building (${_target})"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
depends=("${_target}-binutils>=2.29-1" 'zlib')
options=('!emptydirs' '!distcc' '!strip')
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

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc,mpfr-${_mpfrver},mpc-${_mpcver},gmp-${_gmpver}}/configure

  mkdir ${srcdir}/gcc-build
}

build() {
  cd ${srcdir}/gcc-build

  ../gcc-${pkgver}/configure --prefix=/usr \
    --target=${_target} \
    --enable-languages="c" \
    --disable-multilib \
	--with-cpu=${_target_cpu} \
    --with-system-zlib \
    --with-libgloss \
    --without-headers \
    --disable-shared \
    --disable-nls

  make all-gcc
}

package() {
  cd ${srcdir}/gcc-build

  make DESTDIR=${pkgdir} install-gcc

  rm -rf ${pkgdir}/usr/share

  # strip it manually
  strip ${pkgdir}/usr/bin/* 2>/dev/null || true
  find ${pkgdir}/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}

