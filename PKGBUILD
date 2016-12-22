# Maintainer: Frantisek Fladung <ametisf@gmail.com>

_target="arm-android-eabi"
pkgname=${_target}-gcc-stage1
pkgver=6.1.1
_pkgver=6
_islver=0.16.1
pkgrel=1
_commit=1bbd3999
pkgdesc="The GNU Compiler Collection. Stage 1 for toolchain building (${_target})"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
depends=("${_target}-binutils>=2.26.1-1" 'libmpc' 'zlib')
options=('!emptydirs' '!distcc' '!strip')
source=(https://github.com/gcc-mirror/gcc/archive/${_commit}.tar.gz
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2)
md5sums=('d4c4546f927b2984d66574b1b5cb817e'
         'ac1f25a0677912952718a51f5bc20f32')

prepare() {
  mv gcc-${_commit}* gcc
  cd ${srcdir}/gcc

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

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
      --program-prefix=${_target}- \
      --with-local-prefix=/usr/${_target} \
      --with-sysroot=/usr/${_target} \
      --with-build-sysroot=/usr/${_target} \
      --with-as=/usr/bin/${_target}-as \
      --with-ld=/usr/bin/${_target}-ld \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --with-arch=armv6 --with-float=hard --with-fpu=vfp \
      --target=${_target} --host=${CHOST} --build=${CHOST} \
      --disable-nls --with-newlib \
      --enable-languages=c,c++ \
      --disable-shared --disable-threads \
      --with-system-zlib --with-isl --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --disable-lto --disable-plugin --enable-install-libiberty \
      --with-linker-hash-style=gnu --enable-gnu-indirect-function \
      --disable-multilib --disable-werror \
      --enable-checking=release

  make all-gcc all-target-libgcc
}

package() {
  cd ${srcdir}/gcc-build

  make DESTDIR=${pkgdir} install-gcc install-target-libgcc

  rm -rf ${pkgdir}/usr/share

  # strip it manually
  strip ${pkgdir}/usr/bin/* 2>/dev/null || true
  find ${pkgdir}/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}
