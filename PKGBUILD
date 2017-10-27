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
pkgver=7.2.0
_mpfrver=3.1.6
_mpcver=1.0.3
_gmpver=6.1.2
pkgrel=1
pkgdesc="The GNU Compiler Collection. Bootstrap for toolchain building (${_target})"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
depends=("${_target}-binutils>=2.29-1" 'zlib')
options=('!emptydirs' '!distcc' '!strip')
source=("http://fr.mirror.babylon.network/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
        "http://www.mpfr.org/mpfr-current/mpfr-${_mpfrver}.tar.xz"
        "ftp://ftp.gnu.org/gnu/mpc/mpc-${_mpcver}.tar.gz"
        "https://gmplib.org/download/gmp/gmp-${_gmpver}.tar.xz")


        
sha256sums=('1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a'
            '7a62ac1a04408614fccdc506e4844b10cf0ad2c2b1677097f8f35d3a1344a950'
            '617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3'
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

