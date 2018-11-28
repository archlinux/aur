# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=lib32-libstdc++5
pkgver=3.3.6
pkgrel=7
pkgdesc="Legacy GNU Standard C++ library version 3 (32 bit)"
arch=(x86_64)
url="http://gcc.gnu.org"
license=('GPL' 'LGPL')
depends=('lib32-gcc-libs')
makedepends=('gcc-multilib' 'binutils')
options=('!makeflags')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-{core,g++}-${pkgver}.tar.bz2
        gcc-3.4.3-no_multilib_amd64.patch
        gcc-3.4.6-ucontext.patch
        siginfo.patch)
md5sums=('18c52e6fb8966b7700665dca289d077f'
         '6b3d00b8d079805be1b895f7f6ce47a0'
         '8504bb22dae9d49e8b6d70d7e6910f1b'
         '982ec78eed2887657189aefbe0c642d0'
         'bf36b281a9fc81f624f31f2623a3ad0e')

prepare() {
  cd ${srcdir}/gcc-${pkgver}

  patch -Np1 -i $srcdir/gcc-3.4.3-no_multilib_amd64.patch
  patch -Np1 -i $srcdir/gcc-3.4.6-ucontext.patch
  patch -Np0 -i $srcdir/siginfo.patch

  # fix build issue with recent gcc
  sed -i "s#O_CREAT#O_CREAT, 0666#" gcc/collect2.c
  # No fixincludes
  sed -i -e 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
}

build(){
  export CC="gcc -m32"
  export CPP="cpp -m32"
  export CXX="g++ -m32"
  export CFLAGS="-march=${CARCH/_/-} -O2 -pipe"
  export CPPFLAGS="-march=${CARCH/_/-} -O2 -pipe"
  export CXXFLAGS="-march=${CARCH/_/-} -O2 -pipe"
  cd ${srcdir}/gcc-${pkgver}

  mkdir ../gcc-build
  cd ../gcc-build
  # We build the full multilib libstdc++5 here, no idea how to restrict
  # the build process to the 32 bit version only.
  ../gcc-${pkgver}/configure --prefix=/usr --enable-shared \
      --enable-languages=c++ --enable-threads=posix --enable-__cxa_atexit \
      --enable-multilib --libdir=/usr/lib32
  make all-target-libstdc++-v3 BOOT_CFLAGS="${CFLAGS}" STAGE1_CFLAGS="-O"
}

package() {
  cd ${srcdir}/gcc-build
  make DESTDIR=${pkgdir} install-target-libstdc++-v3

  # Only install the lib32 files
  rm -rf ${pkgdir}/usr/{include,share,lib}
  rm -f ${pkgdir}/usr/lib32/*.a
  rm -f ${pkgdir}/usr/lib32/libstdc++.so
}
