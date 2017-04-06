# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-glibc-headers
pkgver=2.25
pkgrel=1
_commit=69e0a87cc4c570e3b7218392fc3e743b5bddcce2
pkgdesc="GNU C Library headers (${_target})"
arch=('any')
url="http://www.gnu.org/software/libc/"
license=('GPL' 'LGPL')
depends=("${_target}-linux-api-headers>=4.10.1-1")
makedepends=("${_target}-gcc-stage1>=6.3.1-2")
options=('!buildflags' '!strip' 'staticlibs')
source=(http://ftp.gnu.org/gnu/libc/glibc-${pkgver}.tar.xz{,.sig}
        glibc-${_commit}.patch)
md5sums=('1496c3bf41adf9db0ebd0af01f202eed'
         'SKIP'
         'ead76a671d598295114b07c11bee79ba')
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

  # make some libs and stubs
  make csu/subdir_lib
}

package() {
  cd glibc-build

  make install_root=${pkgdir}/usr/${_target} install-headers \
    install-bootstrap-headers=yes

  # glibc doesn't support eglibc's install-bootstrap-headers
  # Luckily a blank gnu/stubs.h is all we need
  touch ${pkgdir}/usr/${_target}/include/gnu/stubs.h

  mkdir -p ${pkgdir}/usr/${_target}/lib
  cp csu/crt1.o csu/crti.o csu/crtn.o ${pkgdir}/usr/${_target}/lib

  # create stub lib
  ${_target}-gcc -nostdlib -nostartfiles -shared -x c /dev/null \
    -o ${pkgdir}/usr/${_target}/lib/libc.so

  mkdir -p ${pkgdir}/usr/${_target}/usr
  ln -s ../{include,lib} ${pkgdir}/usr/${_target}/usr
}
