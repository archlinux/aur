# Maintainer: leap123 <leap123 at canaglie dot org>
# Contributor: Jesus Alonso <doragasu at hotmail dot com>

_target=m68k-palmos-elf
_target_cpu=m68000
pkgname=${_target}-gcc
pkgver=12.2.0
_mpfrver=4.1.0
_mpcver=1.2.1
_gmpver=6.2.1
pkgrel=2
pkgdesc="The GNU Compiler Collection (${_target})"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
depends=("${_target}-binutils>=2.29-1" 'zlib')
makedepends=('m68k-palmos-elf-newlib')
optdepends=('m68k-palmos-elf-newlib')
options=('!emptydirs' '!distcc' '!strip')
conflicts=("${_target}-gcc-bootstrap=${pkgver}")
replaces=("${_target}-gcc-bootstrap")
PKGEXT="pkg.tar.zst"
source=("https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
        "https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.xz.sig"
        "https://ftp.gnu.org/gnu/mpfr/mpfr-${_mpfrver}.tar.xz"
        "https://ftp.gnu.org/gnu/mpfr/mpfr-${_mpfrver}.tar.xz.sig"
        "https://ftp.gnu.org/gnu/mpc/mpc-${_mpcver}.tar.gz"
        "https://ftp.gnu.org/gnu/mpc/mpc-${_mpcver}.tar.gz.sig"
        "https://ftp.gnu.org/gnu/gmp/gmp-${_gmpver}.tar.xz"
        "https://ftp.gnu.org/gnu/gmp/gmp-${_gmpver}.tar.xz.sig"
        retro68.patch
        palm.patch)

sha256sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP
            dc59a00ccc79dcfee0c37f1b17ededd27d9f8a3d527286873fa5d9c0871894d4
            61cda3842968a609570ab834d605a76067544544dbf25bcf0fe637e06f76d054)
validpgpkeys=(13975A70E63C361C73AE69EF6EEB81F8981C74C7
              07F3DBBECC1A39605078094D980C197698C3739D
              AD17A21EF8AED8F1CC02DBD9F7D5C9BF765C61E3
              343C2FF0FBEE5EC2EDBEF399F3599FF828C67298)

prepare() {
  cd ${srcdir}/gcc-${pkgver}
  patch -Np1 -i ../retro68.patch
  patch -Np1 -i ../palm.patch

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
    --enable-languages="c,c++" \
    --disable-multilib \
    --with-cpu=${_target_cpu} \
    --with-system-zlib \
    --with-newlib \
    --with-libgloss \
    --disable-shared \
    --disable-nls \
    --disable-libssp \
    --disable-gcov

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

