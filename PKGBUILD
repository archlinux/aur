# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=('gcc6')
pkgver=6.3.1
_pkgver=6
_islver=0.16.1
pkgrel=2
_commit=4fc407888a30c5d953816b05c8a8e98ec2ab3101
pkgdesc="The GNU Compiler Collection (6.x.x)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.28' 'libmpc' 'doxygen' 'git')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs' '!strip' 'staticlibs')
depends=('glibc>=2.25' 'binutils>=2.28' 'libmpc')
source=(git+https://gcc.gnu.org/git/gcc.git#commit=${_commit}
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2)
md5sums=('SKIP'
         'ac1f25a0677912952718a51f5bc20f32')

_libdir="usr/lib/gcc/$CHOST/$pkgver"

prepare() {
  cd ${srcdir}/gcc

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir ${srcdir}/gcc-build
}

build() {
  cd ${srcdir}/gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  ${srcdir}/gcc/configure --prefix=/usr \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --mandir=/usr/share/man \
      --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,lto \
      --enable-shared \
      --enable-threads=posix \
      --enable-libmpx \
      --with-system-zlib \
      --with-isl \
      --enable-__cxa_atexit \
      --disable-libunwind-exceptions \
      --enable-clocale=gnu \
      --disable-libstdcxx-pch \
      --disable-libssp \
      --enable-gnu-unique-object \
      --enable-linker-build-id \
      --enable-lto \
      --enable-plugin \
      --enable-install-libiberty \
      --with-linker-hash-style=gnu \
      --enable-gnu-indirect-function \
      --disable-multilib \
      --disable-werror \
      --enable-checking=release \
      --program-suffix=-${_pkgver} \
      --enable-version-specific-runtime-libs

  make
  
  # make documentation
  make -C $CHOST/libstdc++-v3/doc doc-man-doxygen
}

check() {
  cd ${srcdir}/gcc-build

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || true
  ${srcdir}/gcc/contrib/test_summary
}


package()
{
  cd ${srcdir}/gcc-build
  
  make -j1 DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/share/{info,locale,man}

  [[ -d ${pkgdir}/usr/lib ]] && mv ${pkgdir}/usr/lib/lib* ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/
  [[ -d ${pkgdir}/usr/lib/gcc/${CHOST}/lib/ ]] && mv ${pkgdir}/usr/lib/gcc/${CHOST}/lib/lib* ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}
}
