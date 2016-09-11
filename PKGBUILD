# Maintainer: Johnny Halfmoon <jhalfmoon@milksnot.com>

pkgname=arm-none-eabi-gcc49-linaro-alternative
_relver=4.9
_relshortdate=16.02
_reldate=20${_relshortdate}
_relverdate=${_relver}-${_reldate}
# This is how I want to define the pkgver, but the AUR doesn't understand it, because multiple _ characters are not allowed
#pkgver=${_relver}_${_reldate//-/_}
pkgver=4.9_2016.02
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
        http://releases.linaro.org/${_newlibvershort}/components/toolchain/newlib-linaro/newlib-${_newlibver}.tar.xz
        gcc-4.9-fix-build-with-gcc-6.patch
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
  patch -Np0 -i "${srcdir}/gcc-4.9-fix-build-with-gcc-6.patch"

  mkdir build
  cd build

#               --build=${CHOST} \
  export CFLAGS="-O2"
  export CXXFLAGS="-O2"
  unset CPPFLAGS
  ../configure --with-pkgversion="Arch User Repository" \
               --with-bugurl="https://aur.archlinux.org/packages/arm-none-eabi-gcc-linaro" \
               --target=arm-none-eabi\
               --prefix=/usr/arm-none-eabi-4.9 \
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
  mkdir -p ${pkgdir}/usr/arm-none-eabi-4.9/arm-none-eabi/bin/
  ln -s /usr/arm-none-eabi/bin/as ${pkgdir}/usr/arm-none-eabi-4.9/arm-none-eabi/bin/as

  # libiberty.a conflicts with host version
  rm -f  $pkgdir/usr/lib/libiberty.a
}

# vim: set ts=2 sw=2 ft=sh et:

sha256sums=('63bd38c028fec87a85eff1f3728b9e8f9a7070346ab337a57963c413da4859a2'
            'd29fe53d70f545c2fb080b9686e05d0f8af5088fec9b7dc78bc788a98765ef99'
            'b328e9cdca4e2869490d932191b78ef1a61c60382cea3a23d1ef86e7c1fb86a7'
            '104b9aa652804a56338470983e6975af1d1e5440eb8bddae3a01a966d2b332cf'
            '3a1d6a17aba8a578ade3552a6d1beb66a129fb4f3268539596d39cbbef88ac6c')
