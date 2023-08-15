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
pkgver=13.2.0
_mpfrver=4.2.0
_mpcver=1.3.1
_gmpver=6.3.0
pkgrel=1
pkgdesc="The GNU Compiler Collection. Bootstrap for toolchain building (${_target})"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
depends=("${_target}-binutils>=2.29-1" 'zlib')
conflicts=('m68k-elf-gcc')
options=('!emptydirs' '!distcc' '!strip')
PKGEXT="pkg.tar.zst"
source=("https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
        "https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.xz.sig"
        "https://ftp.gnu.org/gnu/mpfr/mpfr-${_mpfrver}.tar.xz"
        "https://ftp.gnu.org/gnu/mpfr/mpfr-${_mpfrver}.tar.xz.sig"
        "https://ftp.gnu.org/gnu/mpc/mpc-${_mpcver}.tar.gz"
        "https://ftp.gnu.org/gnu/mpc/mpc-${_mpcver}.tar.gz.sig"
        "https://ftp.gnu.org/gnu/gmp/gmp-${_gmpver}.tar.xz"
        "https://ftp.gnu.org/gnu/gmp/gmp-${_gmpver}.tar.xz.sig")
        
sha256sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP)
validpgpkeys=(D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62
              A534BE3F83E241D918280AEB5831D11A0D4DB02A
              AD17A21EF8AED8F1CC02DBD9F7D5C9BF765C61E3
              343C2FF0FBEE5EC2EDBEF399F3599FF828C67298)

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
  # GCC cannot be built with -Werror=format-security
  export CFLAGS=${CFLAGS//-Werror=format-security/}
  export CXXFLAGS=${CXXFLAGS//-Werror=format-security/}

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

