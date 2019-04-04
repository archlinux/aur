# Maintainer: Michael Duell <mail@akurei.me> 
# Based on the 7.3 package by Johnny Halfmoon <jhalfmoon@milksnot.com>
# Based on the 6.4 package by Witold Kowolik <sdrb@onet.eu>

pkgname=arm-none-eabi-gcc74-linaro
_relver=7.4
_relshortdate=19.02
_reldate=20${_relshortdate}
_relverdate=${_relver}-${_reldate}
pkgver=7.4_2019.02
pkgrel=1
_newlibver=3.1.0
pkgdesc="The GNU Compiler Collection - cross compiler for ARM EABI (bare-metal) target."
arch=(i686 x86_64)
url="https://releases.linaro.org/"
license=('GPL' 'LGPL')
groups=('arm-none-eabi-toolchain')
depends=('arm-none-eabi-binutils>=2.32-1' 'gmp' 'mpfr' 'libmpc')
makedepends=('flex' 'bison')
provides=('arm-none-eabi-gcc-7.4')
options=(staticlibs !libtool !emptydirs !strip zipman docs)
source=(http://releases.linaro.org/components/toolchain/gcc-linaro/${_relverdate}/gcc-linaro-${_relverdate}.tar.xz
        ftp://sourceware.org/pub/newlib/newlib-${_newlibver}.tar.gz
        0200-gcc-no-exceptions.patch
        0300-gcc-multilib2.patch
        1039-libcc1-fix-libcc1-s-install-path-and-rpath.patch
        0400-trap.patch)
_basedir=gcc-linaro-${_relverdate}

prepare() {
  cd ${srcdir}
  mv ${srcdir}/newlib-${_newlibver}/newlib   ${_basedir}
  mv ${srcdir}/newlib-${_newlibver}/libgloss ${_basedir}

  cd ${srcdir}/${_basedir}
  find ${srcdir}/*.patch | while read PATCH ; do
    patch -Np1 -i $PATCH
  done

  cd ${srcdir}/${_basedir}
  rm -rf build
  mkdir build
}

build() {
  cd ${srcdir}/${_basedir}/build

  export CFLAGS="-O3"
  export CXXFLAGS="-O3"
  unset CPPFLAGS
  ../configure --with-pkgversion="Arch User Repository" \
               --with-bugurl="https://aur.archlinux.org/packages/arm-none-eabi-gcc-linaro" \
               --target=arm-none-eabi\
               --prefix=/usr/arm-none-eabi-7.4 \
               --program-suffix="-7.4" \
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
               --enable-threads \
               --disable-libssp \
               --disable-libstdcxx-pch \
               --enable-silent-rules \
               --program-prefix="arm-none-eabi-"
  make
}

package() {
  cd ${srcdir}/${_basedir}/build
  make -j1 DESTDIR=${pkgdir} install
  ln -s /usr/arm-none-eabi/bin/as ${pkgdir}/usr/arm-none-eabi-7.4/libexec/gcc/arm-none-eabi/7.4.1/as
  # libiberty.a conflicts with host version
  rm -f  $pkgdir/usr/lib/libiberty.a
}

sha384sums=('7b5cfced29c06115f45846b8c5bd1f654589b40aff8d880a33d42a2abf5bb443b0abbf38c01661c8d998917160a1ac08'
            '147772efafc4b98d807ae59409931a21c244d24b02d8db13fa56608b59251bd20a6c9b6ac50d5bdfdf1f0c31a9050387'
            '5d23b23b92f8952d73dabe4d463fb56bd56254bacb1c2c2a1cf0abe14ae74e15337b5740fbf076dabda0918505e8a43d'
            'ce165bdfc64cfe184c56f5ddc194d6a023cbb3e44213e72854e8cb278a06f28a62e0b1125801da24928d66b01b0d7bb4'
            '758bda596dfdc621c2f5836b7046efccc50f3e0353c5678c4acafab7be844b76b3487991cae1d292af8f66dfe3ac141b'
            '4df1144ce8053b0e14e104fc700541991b402fa1d9335d189638b9a020c87bbe57331c09e28a91e6d5392d61498a9c8d')
