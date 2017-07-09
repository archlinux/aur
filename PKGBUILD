# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-glibc
pkgver=2.25
pkgrel=5
_commit=adc7e06fb412a2a1ee52f8cb788caf436335b9f3  # release/2.25/master
pkgdesc="GNU C Library (${_target})"
arch=('any')
url="http://www.gnu.org/software/libc/"
license=('GPL' 'LGPL')
depends=("${_target}-linux-api-headers>=4.10.1-1")
makedepends=("${_target}-gcc-stage2>=7.1.1-3" 'gperf')
provides=("${_target}-glibc-headers=${pkgver}" "${_target}-eglibc")
conflicts=("${_target}-glibc-headers" "${_target}-eglibc")
replaces=("${_target}-glibc-headers")
options=('!buildflags' '!strip' 'staticlibs')
source=(http://ftp.gnu.org/gnu/libc/glibc-${pkgver}.tar.xz{,.sig}
        glibc-${_commit}.patch)
md5sums=('1496c3bf41adf9db0ebd0af01f202eed'
         'SKIP'
         '0fa9776db7ab22c15a4767d841fc2eb2')
validpgpkeys=('BC7C7372637EC10C57D7AA6579C43DFBF1CF2187')  # Siddhesh Poyarekar

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

  # remove fortify for building libraries
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

  ../glibc-${pkgver}/configure \
      --prefix=/ \
      --libdir=/lib \
      --libexecdir=/lib \
      --with-headers=/usr/${_target}/include \
      --enable-add-ons \
      --enable-obsolete-rpc \
      --enable-kernel=2.6.32 \
      --enable-bind-now \
      --disable-profile \
      --enable-stackguard-randomization \
      --enable-stack-protector=strong \
      --enable-lock-elision \
      --disable-multi-arch \
      --disable-werror \
      --target=${_target} \
      --host=${_target} \
      --build=${CHOST}

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
