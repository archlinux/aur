# Maintainer: JustKidding <jk@vin.ovh>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libstdc++5
pkgver=3.3.6
pkgrel=9
pkgdesc="GNU Standard C++ library version 3"
arch=('x86_64')
url="https://gcc.gnu.org"
license=('GPL' 'LGPL')
depends=('gcc-libs')
makedepends=('gcc' 'binutils')
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
  cd gcc-$pkgver

  patch -Np1 -i $srcdir/gcc-3.4.3-no_multilib_amd64.patch
  # fix build issue with recent gcc
  sed -i "s#O_CREAT#O_CREAT, 0666#" gcc/collect2.c

  # No fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' \
      -e '# Clean up some warnings that arent our business' \
      -e 's:-Wstrict-prototypes::g' \
      -e 's:-Wtraditional::g' \
      -e 's:-pedantic::g' \
      -e 's:-Wall::g' \
    -i 'gcc/Makefile.in'
  sed -e 's:-Wall -Wtraditional -pedantic::g' -i 'libiberty/configure'

  # Patches are the wrong way to do this
  sed -e '# gcc-3.4.6-ucontext.patch' \
      -e 's:\bstruct ucontext\b:ucontext_t:g' \
      -e '# siginfo.patch' \
      -e 's:\bstruct siginfo\b:siginfo_t:g' \
    -i $(grep --include 'linux*.h' -lrFe $'struct ucontext\nstruct siginfo' gcc/config/)

  mkdir ../gcc-build
}

build(){
  export CFLAGS="-march=${CARCH/_/-} -O2"
  export CXXFLAGS="-march=${CARCH/_/-} -O2"
  export SHELL='/usr/bin/bash' # doesn't work with fish
  unset CPPFLAGS

  cd gcc-build
  CPP=/usr/bin/cpp ../gcc-${pkgver}/configure --prefix=/usr --enable-shared \
      --enable-languages=c++ --enable-threads=posix --enable-__cxa_atexit \
      --disable-multilib --libdir=/usr/lib
  make all-target-libstdc++-v3 BOOT_CFLAGS="${CFLAGS}" STAGE1_CFLAGS="-O" -j$(nproc)
}

package() {
  cd gcc-build
  make DESTDIR="${pkgdir}" install-target-libstdc++-v3

  # Remove includefiles and libs provided by gcc
  rm -rf "${pkgdir}"/usr/{include,share/locale}
  rm -f "${pkgdir}"/usr/lib/*.a
  rm -f "${pkgdir}"/usr/lib/libstdc++.so
}
