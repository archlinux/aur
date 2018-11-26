# Maintainer: Johnny Halfmoon <jhalfmoon@milksnot.com>
# Latest sources are at http://releases.linaro.org/components/toolchain/gcc-linaro/
# NOTE: I get my patches from the following location. There might be a better source. If so, let me know.
# https://github.com/01org/luv-yocto/tree/master/meta/recipes-devtools/gcc/gcc-5.3

pkgname=arm-none-eabi-gcc53-linaro-alternative
_relver=5.3
_relshortdate=16.02
_reldate=20${_relshortdate}
_relverdate=${_relver}-${_reldate}
# This is how I want to define the pkgver, but the AUR doesn't understand it, because multiple _ characters are not allowed
#pkgver=${_relver}_${_reldate//-/_}
pkgver=5.3_2018.11
pkgrel=1
_newlibver=linaro-2.2.0-2015.01
_newlibvershort=15.01
#_newlibver=2.0.0
pkgdesc="The GNU Compiler Collection - cross compiler for ARM EABI (bare-metal) target."
arch=(i686 x86_64)
url="https://releases.linaro.org/"
license=('GPL' 'LGPL')
groups=('arm-none-eabi-toolchain')
depends=('arm-none-eabi-binutils>=2.26-1' 'gmp' 'mpfr' 'libmpc')
makedepends=('flex' 'bison')
#provides=('arm-none-eabi-gcc')
#conflicts=('arm-none-eabi-gcc' 'cross-arm-none-eabi-gcc')
options=(staticlibs !libtool !emptydirs !strip zipman docs)
source=(http://releases.linaro.org/components/toolchain/gcc-linaro/${_relverdate}/gcc-linaro-${_relverdate}.tar.xz
        http://releases.linaro.org/archive/${_newlibvershort}/components/toolchain/newlib-linaro/newlib-${_newlibver}.tar.xz
        0100-gcc-fix-build-with-gcc-6.patch
        0200-gcc-no-exceptions.patch
        0300-gcc-multilib2.patch
        1039-libcc1-fix-libcc1-s-install-path-and-rpath.patch)
_basedir=gcc-linaro-${_relverdate}

prepare() {
  cd ${srcdir}
  mv ${srcdir}/newlib-${_newlibver}/newlib   ${_basedir}
  mv ${srcdir}/newlib-${_newlibver}/libgloss ${_basedir}

hortdate=14.09
_reldate=20${_relshortdate}

cd ${srcdir}/${_basedir}
  find ${srcdir}/*.patch | while read PATCH ; do
    patch -Np1 -i $PATCH
  done

  cd ${srcdir}/${_basedir}
  mkdir build
  cd build

}

build() {

  cd ${srcdir}/${_basedir}/build

  export CFLAGS="-O2"
  export CXXFLAGS="-O2"
  unset CPPFLAGS
  ../configure --with-pkgversion="Arch User Repository" \
               --with-bugurl="https://aur.archlinux.org/packages/arm-none-eabi-gcc-linaro" \
               --target=arm-none-eabi \
               --prefix=/usr/arm-none-eabi-5.3 \
               --bindir=/usr/bin \
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
               --disable-newlib-supplied-syscalls \
               --program-suffix="-${_relver}" \
               --program-prefix="arm-none-eabi-"

  make
}




package() {
  cd ${srcdir}/${_basedir}/build
  make -j1 DESTDIR=${pkgdir} install

  # workaround for as
  mkdir -p ${pkgdir}/usr/arm-none-eabi-5.3/arm-none-eabi/bin/
  ln -s /usr/arm-none-eabi/bin/as ${pkgdir}/usr/arm-none-eabi-5.3/arm-none-eabi/bin/as

  # libiberty.a conflicts with host version
  rm -f  $pkgdir/usr/lib/libiberty.a
}

# vim: set ts=2 sw=2 ft=sh et:

sha256sums=('549c1416c0e2025c8e4c07c7c970863437ac707429b268b36a9a426c45298090'
            'd29fe53d70f545c2fb080b9686e05d0f8af5088fec9b7dc78bc788a98765ef99'
            '318919dd575819622ddaec1cf593506411fa4435bc9af662155572c30a7baa88'
            '76eab14830216c774291d2ac35d4b4690f3273aa8c630a2c1546f02538847d8a'
            'c9b6bc1dd53f9b4b80f5fdacdef94c9fce0e516c16fb78063107b66ba2e9fdd1'
            'fa08269d6a748631b07b55a5fe00fa518b2f6e04356a3d6634c60f3c3ece3b07')
