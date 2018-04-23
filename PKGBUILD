# Maintainer: Witold Kowolik <sdrb@onet.eu>

pkgname=arm-none-eabi-gcc64-linaro-alternative
_relver=6.4
_relshortdate=17.08
_reldate=20${_relshortdate}
_relverdate=${_relver}-${_reldate}
pkgver=6.4_2017.06
pkgrel=1
_newlibver=2.4.0
_newlibvershort=15.01
pkgdesc="The GNU Compiler Collection - cross compiler for ARM EABI (bare-metal) target."
arch=(i686 x86_64)
url="https://releases.linaro.org/"
license=('GPL' 'LGPL')
groups=('arm-none-eabi-toolchain')
depends=('arm-none-eabi-binutils>=2.26-1' 'gmp' 'mpfr' 'libmpc')
makedepends=('flex' 'bison')
provides=('arm-none-eabi-gcc-6.4')
options=(staticlibs !libtool !emptydirs !strip zipman docs)
source=(http://releases.linaro.org/components/toolchain/gcc-linaro/${_relverdate}/gcc-linaro-${_relverdate}.tar.xz
	ftp://sourceware.org/pub/newlib/newlib-2.4.0.tar.gz
        0200-gcc-no-exceptions.patch
        0300-gcc-multilib2.patch
        1039-libcc1-fix-libcc1-s-install-path-and-rpath.patch
        0400-trap.patch)
_basedir=gcc-linaro-${_relverdate}

sha256sums=('4188a8c799186a5759decead1cdf1139e82e5215cdb468d5ff7070010968bde0'
            '545b3d235e350d2c61491df8b9f775b1b972f191380db8f52ec0b1c829c52706'
            '76eab14830216c774291d2ac35d4b4690f3273aa8c630a2c1546f02538847d8a'
            'c9b6bc1dd53f9b4b80f5fdacdef94c9fce0e516c16fb78063107b66ba2e9fdd1'
            'fa08269d6a748631b07b55a5fe00fa518b2f6e04356a3d6634c60f3c3ece3b07'
            '157de04865a94c0cd953133ee102d286783ea171a48245760d16a2362fde253b')



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
               --prefix=/usr/arm-none-eabi-6.4 \
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
               --program-suffix="-6.4" \
               --program-prefix="arm-none-eabi-"

  make
}

package() {
  cd ${srcdir}/${_basedir}/build
  make -j1 DESTDIR=${pkgdir} install

  ln -s /usr/arm-none-eabi/bin/as ${pkgdir}/usr/arm-none-eabi-6.4/libexec/gcc/arm-none-eabi/6.4.1/as

  # libiberty.a conflicts with host version
  rm -f  $pkgdir/usr/lib/libiberty.a
}
