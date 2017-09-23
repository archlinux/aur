# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-glibc-headers
pkgver=2.26
pkgrel=4
pkgdesc="GNU C Library headers (${_target})"
arch=('any')
url="http://www.gnu.org/software/libc/"
license=(GPL LGPL)
depends=("${_target}-linux-api-headers>=4.12.7-1")
makedepends=("${_target}-gcc-stage1>=7.2.0-3")
options=(!buildflags !strip staticlibs)
_commit=58270c0049404ef2f878fdd45df55f17f0b8c1f7
source=(http://ftp.gnu.org/gnu/libc/glibc-${pkgver}.tar.xz{,.sig}
        glibc-${_commit}.patch
        0001-Don-t-use-IFUNC-resolver-for-longjmp-or-system-in-li.patch
        0002-x86-Add-x86_64-to-x86-64-HWCAP-BZ-22093.patch)
md5sums=('102f637c3812f81111f48f2427611be1'
         'SKIP'
         '7ce099a4060f59b7b7dd5ca66605f4e8'
         'cbc073315c00b03898b7fc614274d6b3'
         'bd9b13f3294b6357baa809e4416b9f44')
validpgpkeys=('BC7C7372637EC10C57D7AA6579C43DFBF1CF2187')  # Siddhesh Poyarekar

prepare() {
  mkdir glibc-build
  cd glibc-$pkgver

  patch -p1 -i "$srcdir/glibc-$_commit.patch"

  patch -p1 -i "$srcdir/0001-Don-t-use-IFUNC-resolver-for-longjmp-or-system-in-li.patch"
  patch -p1 -i "$srcdir/0002-x86-Add-x86_64-to-x86-64-HWCAP-BZ-22093.patch"

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

  "$srcdir/glibc-$pkgver/configure" \
      --prefix=/ \
      --libdir=/lib \
      --libexecdir=/lib \
      --with-headers=/usr/${_target}/include \
      --enable-add-ons \
      --enable-bind-now \
      --enable-lock-elision \
      --disable-multi-arch \
      --enable-obsolete-nsl \
      --enable-obsolete-rpc \
      --enable-stack-protector=strong \
      --enable-stackguard-randomization \
      --disable-profile \
      --disable-werror \
      --target=${_target} \
      --host=${_target} \
      --build=${CHOST}

  # make some libs and stubs
  make csu/subdir_lib
}

package() {
  cd glibc-build

  make install_root="$pkgdir/usr/$_target" install-headers \
    install-bootstrap-headers=yes

  # glibc doesn't support eglibc's install-bootstrap-headers
  # Luckily a blank gnu/stubs.h is all we need
  touch "$pkgdir/usr/$_target/include/gnu/stubs.h"

  mkdir -p "$pkgdir/usr/$_target/lib"
  cp csu/crt1.o csu/crti.o csu/crtn.o "$pkgdir/usr/$_target/lib"

  # create stub lib
  ${_target}-gcc -nostdlib -nostartfiles -shared -x c /dev/null \
    -o "$pkgdir/usr/$_target/lib/libc.so"

  mkdir -p "$pkgdir/usr/$_target/usr"
  ln -s ../{include,lib} "$pkgdir/usr/$_target/usr"
}
