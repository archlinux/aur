# Maintainer: Timo Sarawinski <t.sarawinski@gmail.com>
# Latest sources are at http://snapshots.linaro.org/components/toolchain/gcc-linaro/

pkgname=arm-none-eabi-gcc60-linaro
_relver=snapshot-6.4
_relshortdate=17.11
_reldate=20${_relshortdate}
_relverdate=${_relver}-${_reldate}
# This is how I want to define the pkgver, but the AUR doesn't understand it, because multiple _ characters are not allowed
#pkgver=${_relver}_${_reldate//-/_}
pkgver=6.4_2017.11
_pkgver=6.4-2017.11
pkgrel=3
pkgdesc="The GNU Compiler Collection - cross compiler for ARM EABI (bare-metal) target."
arch=(i686 x86_64)
url="https://releases.linaro.org/"
license=('GPL' 'LGPL')
groups=('arm-none-eabi-toolchain')
depends=('arm-none-eabi-linaro-binutils' 'isl' 'mpc' 'gmp' 'cloog' 'arm-none-eabi-newlib-linaro-git' 'mpfr' 'libmpc')
makedepends=('gcc-ada' 'expect' 'flex' 'bison')
#provides=('arm-none-eabi-gcc')
#conflicts=('arm-none-eabi-gcc' 'cross-arm-none-eabi-gcc')
options=(staticlibs !libtool !emptydirs !strip zipman docs)
source=(http://snapshots.linaro.org/components/toolchain/gcc-linaro/${_pkgver}/gcc-linaro-${_relverdate}.tar.xz
        0200-gcc-no-exceptions.patch
        0300-gcc-multilib2.patch
	0400-enable-with-multilib-list-for-arm.patch
        1039-libcc1-fix-libcc1-s-install-path-and-rpath.patch)
_basedir=gcc-linaro-${_relverdate}

sha256sums=('bf2e8ad02196c2117d59aeebf3ba1b5b42beb4381c8bd0c27882e8c93d4a5edf'
            '76eab14830216c774291d2ac35d4b4690f3273aa8c630a2c1546f02538847d8a'
            'c9b6bc1dd53f9b4b80f5fdacdef94c9fce0e516c16fb78063107b66ba2e9fdd1'
            '9447a8fd40d7c1e238b8e9790b739492de5feaa489d61f4ecdab863e5ea1975a'
            'fa08269d6a748631b07b55a5fe00fa518b2f6e04356a3d6634c60f3c3ece3b07')

build() {
  cd ${srcdir}

cd ${srcdir}/${_basedir}
  find ${srcdir}/*.patch | while read PATCH ; do
    patch -Np1 -i $PATCH
  done
  mkdir build
  cd build

  export CFLAGS="-O3"
  export CXXFLAGS="-O3"
  unset CPPFLAGS
  ../configure --with-pkgversion="Arch User Repository" \
               --with-bugurl="https://aur.archlinux.org/packages/arm-none-eabi-gcc-linaro" \
               --target=arm-none-eabi\
               --prefix=/usr \
               --libexecdir=/usr/lib \
               --datarootdir=/usr/share/arm-none-eabi-gcc-6 \
               --enable-multilib \
               --enable-languages=c,c++ \
               --enable-interwork \
	       --program-prefix=arm-none-eabi- \
               --program-suffix=-6 \
               --enable-vtable-verify \
               --with-newlib \
               --with-gnu-as \
               --with-gnu-ld \
               --with-system-zlib \
               --disable-nls \
               --disable-shared \
               --enable-threads \
	       --enable-lto \
               --disable-libssp \
               --disable-libstdcxx-pch \
	       --disable-libstdc__-v3 \
               --disable-libmudflap \
               --disable-libgomp \
	       --enable-gold \
               --enable-silent-rules \
               --with-headers=/usr/arm-none-eabi/include \
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
