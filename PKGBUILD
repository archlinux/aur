# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-gcc-stage1
pkgver=7.1.1
_pkgver=${pkgver:0:1}
_islver=0.18
pkgrel=3
_commit=81fc9125b24bba5f2761b7986ff4e3de14740291
pkgdesc="The GNU Compiler Collection. Stage 1 for toolchain building (${_target})"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
depends=("${_target}-binutils>=2.28.0-3" 'libmpc' 'zlib')
options=('!emptydirs' '!distcc' '!strip')
source=(https://github.com/gcc-mirror/gcc/archive/${_commit}.tar.gz
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        Revert-eeb6872bf.patch)
md5sums=('491bb12933ea303bb7313541348032ce'
         '11436d6b205e516635b666090b94ab32'
         'e4c9c8b498b04c0f51d219d025ca8407')

prepare() {
  mv gcc-${_commit}* gcc
  cd ${srcdir}/gcc

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80717
  patch -p1 -i ${srcdir}/Revert-eeb6872bf.patch

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
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --disable-nls \
      --with-newlib \
      --enable-languages=c,c++ \
      --disable-shared \
      --disable-threads \
      --with-system-zlib \
      --with-isl \
      --enable-__cxa_atexit \
      --disable-libunwind-exceptions \
      --enable-clocale=gnu \
      --disable-libstdcxx-pch \
      --disable-libssp \
      --enable-gnu-unique-object \
      --enable-linker-build-id \
      --disable-lto \
      --disable-plugin \
      --enable-install-libiberty \
      --with-linker-hash-style=gnu \
      --enable-gnu-indirect-function \
      --disable-multilib \
      --disable-werror \
      --enable-checking=release \
      --target=${_target} \
      --host=${CHOST} \
      --build=${CHOST} \
      --with-arch=armv6 \
      --with-float=hard \
      --with-fpu=vfp

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
