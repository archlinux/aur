# Maintainer: František Fladung <ametisf@gmail.com>

_target="arm-android-gnueabihf"
pkgname=${_target}-glibc
pkgver=2.23
pkgrel=1
_commit=1915d6d1
pkgdesc="GNU C Library (${_target})"
arch=('any')
url="http://www.gnu.org/software/libc/"
license=('GPL' 'LGPL')
depends=("${_target}-linux-api-headers>=3.10.0")
makedepends=("${_target}-gcc-stage2>=6.1.1" 'gperf')
provides=("${_target}-glibc-headers=${pkgver}" "${_target}-eglibc")
conflicts=("${_target}-glibc-headers" "${_target}-eglibc")
replaces=("${_target}-glibc-headers")
options=('!buildflags' '!strip' 'staticlibs')
source=(http://ftp.gnu.org/gnu/libc/glibc-${pkgver}.tar.xz{,.sig}
        glibc-${_commit}.patch.xz)
md5sums=('456995968f3acadbed39f5eba31678df'
         'SKIP'
         '90fad90d55a4c70d91a79539ed3642e2')
validpgpkeys=('F37CDAB708E65EA183FD1AF625EF0A436C2A4AFF')  # Carlos O'Donell

prepare() {
  cd glibc-${pkgver}

  patch -p1 -i ${srcdir}/glibc-${_commit}.patch

  mkdir ${srcdir}/glibc-build
}

build() {
  cd glibc-build

  echo "slibdir=/lib" >> configparms
  echo "rtlddir=/lib" >> configparms
  echo "sbindir=/bin" >> configparms
  echo "rootsbindir=/bin" >> configparms

  # remove hardening options for building libraries
  export CFLAGS="-U_FORTIFY_SOURCE -mlittle-endian -O2"
  export CPPFLAGS="-U_FORTIFY_SOURCE -O2"
  unset LD_LIBRARY_PATH

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

  ../glibc-${pkgver}/configure --prefix=/ \
      --target=${_target} --host=${_target} --build=${CHOST} \
      --libdir=/lib --libexecdir=/lib \
      --with-headers=/usr/${_target}/include \
      --enable-add-ons \
      --enable-obsolete-rpc \
      --enable-kernel=2.6.32 \
      --enable-bind-now --disable-profile \
      --enable-stackguard-randomization \
      --enable-lock-elision \
      --disable-multi-arch \
      --disable-werror

  echo "build-programs=no" >> configparms
  make
}

package() {
  cd glibc-build

  make install_root=${pkgdir}/usr/${_target} install

  mkdir -p ${pkgdir}/usr/${_target}/usr
  ln -s ../{include,lib} ${pkgdir}/usr/${_target}/usr

  # Remove unneeded for compilation files
  rm -rf ${pkgdir}/usr/${_target}/{bin,sbin,etc,share,var}
}
