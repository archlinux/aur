# Maintainer: Marc McIntosh <marc@marcmcintosh.ninja>
pkgname=jxcore
pkgver=0.3.1.1.r14.g71002d0
pkgrel=1
pkgdesc="Evented IO for SpiderMonkey and V8 JavaScript"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="http://jxcore.io/"
license=('common')
depends=('openssl' 'zlib' 'http-parser' 'nodejs' )
makedepends=('python2')
optdepends=('npm:: node package manager')
conflicts=()
options=()
install=
source=('git+https://github.com/jxcore/jxcore')
noextract=()
md5sums=('SKIP')
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
set_flags() {
  
  if [ "$CARCH" == "arm" ]; then
    CONFIGFLAG="--with-arm-float-abi=soft --dest-cpu=arm"
    CXXFLAGS="$CXXFLAGS -march=armv5t -mno-unaligned-access"
    GYPFLAGS="-Darm_thumb -Darm_float_abi=soft -Darm_version=5 -Darm_fpu= -Darm_test_noprobe=on"
  fi

  if [ "$CARCH" == "armv6h" ]; then
    CONFIGFLAG="--with-arm-float-abi=hard --dest-cpu=arm"
    GYPFLAGS="-Darm_thumb -Darm_float_abi=hard -Darm_version=6 -Darm_fpu=vfpv2"
  fi

  if [ "$CARCH" == "armv7h" ]; then
    CONFIGFLAG="--with-arm-float-abi=hard --dest-cpu=arm"
    GYPFLAGS="-Darm_thumb -Darm_float_abi=hard -Darm_version=7 -Darm_fpu=vfpv3-d16"
  fi

  if [ "$CARCH" == "i686" ]; then
    CONFIGGLAG="--dest-cpu=ia32"
  fi

  if [ "$CARCH" == "x86_64" ]; then
    CONFIGFLAG="--dest-cpu=x64"
  fi

  export CXXFLAGS
  export GYPFLAGS
}
prepare(){
  cd "$srcdir/${pkgname}"
  msg 'Fixing for python2 name'
  find -type f -exec sed \
    -e 's_^#!/usr/bin/env python$_&2_' \
    -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
    -e 's_^#!/usr/bin/python$_&2_' \
    -e "s_'python'_'python2'_" -i {} \;
  find test/ -type f -exec sed 's_python _python2 _' -i {} \;
}
build() {
  
  cd "$srcdir/${pkgname}"
  
  set_flags

  export PYTHON=python2
  $PYTHON ./configure \
    --prefix="/usr" \
    --engine-mozilla \
    --dest-os="linux" \
    --shared-http-parser \
    --shared-openssl \
    --shared-zlib \
    --without-npm \
    --without-dtrace \
    ${CONFIGFLAG} 
  make

}

check(){
  cd "$srcdir/${pkgname}"
  make test || warning "Tests failed"
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir" install

  # install docs as per user request
  install -d "$pkgdir/usr/share/doc/jxcore"
  cp -r doc/api \
    "$pkgdir/usr/share/doc/jxcore"

  install -D -m644 JXCORE_LICENSE \
    "$pkgdir/usr/share/licenses/jxcore/LICENSE"
  # conflicts 
  rm  "$pkgdir/usr/include/node/ares.h"
  rm  "$pkgdir/usr/include/node/ares_version.h"
  rm  "$pkgdir/usr/include/node/common.gypi"
  rm  "$pkgdir/usr/include/node/config.gypi"
  rm  "$pkgdir/usr/include/node/nameser.h"
  rm  "$pkgdir/usr/include/node/node.h"
  rm  "$pkgdir/usr/include/node/node_buffer.h"
  rm  "$pkgdir/usr/include/node/node_internals.h"
  rm  "$pkgdir/usr/include/node/node_object_wrap.h"
  rm  "$pkgdir/usr/include/node/node_version.h"
  rm  -rf "$pkgdir/usr/share/man"
}

# vim:set ts=2 sw=2 et:
