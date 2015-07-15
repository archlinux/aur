# Maintainer: Johnny Halfmoon <jhalfmoon@milksnot.com>

pkgname=arm-none-eabi-gcc49-linaro
_relver=4.9
_relshortdate=14.09
_reldate=20${_relshortdate}
_relverdate=${_relver}-${_reldate}
# This is how I want to define the pkgver, but the AUR doesn't understand it, because multiple _ characters are not allowed
#pkgver=${_relver}_${_reldate//-/_}
pkgver=4.9_2014.09
pkgrel=1
_newlibver=linaro-2.1.0-2014.09
#_newlibver=2.0.0
pkgdesc="The GNU Compiler Collection - cross compiler for ARM EABI (bare-metal) target."
arch=(i686 x86_64)
url="https://releases.linaro.org/"
license=('GPL' 'LGPL')
groups=('arm-none-eabi-toolchain')
depends=('arm-none-eabi-binutils>=2.23.2' 'gmp' 'mpfr' 'libmpc')
makedepends=('flex' 'bison')
provides=('arm-none-eabi-gcc')
conflicts=('arm-none-eabi-gcc' 'cross-arm-none-eabi-gcc')
options=(staticlibs !libtool !emptydirs !strip zipman docs)
source=(http://releases.linaro.org/${_relshortdate}/components/toolchain/gcc-linaro/${_relver}/gcc-linaro-${_relverdate}.tar.xz
        http://releases.linaro.org/14.09/components/toolchain/newlib-linaro/newlib-${_newlibver}.tar.bz2
        gcc-${_relver}-multilib2.patch
        gcc-${_relver}-no-exceptions.patch)
_basedir=gcc-linaro-${_relverdate}

build() {
  cd ${srcdir}
  mv ${srcdir}/newlib-${_newlibver}/newlib   ${_basedir}
  mv ${srcdir}/newlib-${_newlibver}/libgloss ${_basedir}

hortdate=14.09
_reldate=20${_relshortdate}

cd ${srcdir}/${_basedir}
  patch -Np0 -i "${srcdir}/gcc-${_relver}-multilib2.patch"
  patch -Np0 -i "${srcdir}/gcc-${_relver}-no-exceptions.patch"

  mkdir build
  cd build

  export CFLAGS="-O2"
  export CXXFLAGS="-O2"
  unset CPPFLAGS
  ../configure --with-pkgversion="Arch User Repository" \
               --with-bugurl="https://aur.archlinux.org/packages/arm-none-eabi-gcc-linaro" \
               --target=arm-none-eabi\
               --prefix=/usr \
               --libexecdir=/usr/lib \
               --datarootdir=/usr/share/arm-none-eabi-gcc \
               --enable-multilib \
               --enable-languages=c,c++ \
               --enable-interwork \
               --with-newlib \
               --with-gnu-as \
               --with-gnu-ld \
               --with-system-zlib \
               --disable-nls \
               --disable-shared \
               --disable-threads \
               --disable-libssp \
               --disable-libstdcxx-pch \
               --disable-libmudflap \
               --disable-libgomp \
               --enable-silent-rules \
               --with-headers=newlib/libc/include \
               --disable-newlib-supplied-syscalls
  make
}

package() {
  cd ${srcdir}/${_basedir}/build
  make -j1 DESTDIR=${pkgdir} install

  # libiberty.a conflicts with host version
  rm -f  $pkgdir/usr/lib/libiberty.a
}

# vim: set ts=2 sw=2 ft=sh et:

sha256sums=('c708c486f62f0d283f8615d7bc05d9830d50e15c52cfe213ec3992f6c190c222'
            'ed92e8547246834725a3c5743fa41d3f573e3e5d2e5066d433ac3c29e6676fc8'
            '104b9aa652804a56338470983e6975af1d1e5440eb8bddae3a01a966d2b332cf'
            '3a1d6a17aba8a578ade3552a6d1beb66a129fb4f3268539596d39cbbef88ac6c')

