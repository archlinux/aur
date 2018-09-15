# Maintainer: Johnny Halfmoon <jhalfmoon@milksnot.com>
# Based on the 6.4 package by Witold Kowolik <sdrb@onet.eu>

pkgname=arm-none-eabi-gcc73-linaro
_relver=7.3
_relshortdate=18.05
_reldate=20${_relshortdate}
_relverdate=${_relver}-${_reldate}
pkgver=7.3_2018.05
pkgrel=1
_newlibver=2.5.0
pkgdesc="The GNU Compiler Collection - cross compiler for ARM EABI (bare-metal) target."
arch=(i686 x86_64)
url="https://releases.linaro.org/"
license=('GPL' 'LGPL')
groups=('arm-none-eabi-toolchain')
depends=('arm-none-eabi-binutils>=2.26-1' 'gmp' 'mpfr' 'libmpc')
makedepends=('flex' 'bison')
provides=('arm-none-eabi-gcc-7.3')
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
               --prefix=/usr/arm-none-eabi-7.3 \
               --program-suffix="-7.3" \
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
  ln -s /usr/arm-none-eabi/bin/as ${pkgdir}/usr/arm-none-eabi-7.3/libexec/gcc/arm-none-eabi/7.3.1/as
  # libiberty.a conflicts with host version
  rm -f  $pkgdir/usr/lib/libiberty.a
}

sha256sums=('5864b46120e120949413ab698a5104cfd43b82246254cc4928a2d9e8cc1884e7'
            '5b76a9b97c9464209772ed25ce55181a7bb144a66e5669aaec945aa64da3189b'
            '4ab6e3b886bdb33b9e368c135337859003296e0efa29f6967cb5f22ffd00668a'
            'c9b6bc1dd53f9b4b80f5fdacdef94c9fce0e516c16fb78063107b66ba2e9fdd1'
            'd713a261f9988c5e202d8feb586d7f75b14fc7d288fee0fe3e0b332da1a780aa'
            '157de04865a94c0cd953133ee102d286783ea171a48245760d16a2362fde253b')
