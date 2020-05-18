# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-glibc-headers
pkgver=2.31
pkgrel=3.2
pkgdesc="GNU C Library headers (${_target})"
arch=('any')
url="https://www.gnu.org/software/libc/"
license=(GPL LGPL)
depends=("${_target}-linux-api-headers>=5.6.11-1")
makedepends=("${_target}-gcc-stage1" python)
options=(!buildflags !strip staticlibs debug)
_commit=18fdba553dd9b907e9812b90d2cea593f776058f
#source=(git+https://sourceware.org/git/glibc.git#commit=$_commit
source=(https://ftp.gnu.org/gnu/glibc/glibc-$pkgver.tar.xz{,.sig}
        glibc-${_commit}.patch
        sdt.h sdt-config.h
        bz20338.patch)
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8 # Carlos O'Donell
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar
md5sums=('78a720f17412f3c3282be5a6f3363ec6'
         'SKIP'
         'f66fac93b299d3e3c60e6c8be56b039d'
         '91fec3b7e75510ae2ac42533aa2e695e'
         '680df504c683640b02ed4a805797c0b2'
         '430673eccc78e52c249aa4b0f1786450')

prepare() {
  mkdir -p glibc-build

  [[ -d glibc-$pkgver ]] && ln -s glibc-$pkgver glibc
  cd glibc

  local i; for i in ${source[@]}; do
    case ${i%::*} in
      *.patch)
        msg2 "Applying ${i}"
        patch -p1 -i "$srcdir/${i}"
        ;;
    esac
  done
}

build() {
  local _configure_flags=(
      --prefix=/
      --with-headers=/usr/${_target}/include
      --enable-add-ons
      --enable-bind-now
      --enable-lock-elision
      --disable-multi-arch
      --enable-stack-protector=strong
      --enable-stackguard-randomization
      --disable-systemtap
      --disable-profile
      --disable-werror
  )

  cd glibc-build

  echo "slibdir=/lib" >> configparms
  echo "rtlddir=/lib" >> configparms
  echo "sbindir=/bin" >> configparms
  echo "rootsbindir=/bin" >> configparms

  # remove fortify for building libraries
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

  #
  CFLAGS="${CFLAGS/-fno-plt/} -g -O2"
  CXXFLAGS="${CXXFLAGS/-fno-plt/} -g -O2"
  LDFLAGS=${LDFLAGS/,-z,now/}

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

  "$srcdir/glibc/configure" \
      --libdir=/lib \
      --libexecdir=/lib \
      ${_configure_flags[@]} \
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

  # Provide tracing probes to libstdc++ for exceptions, possibly for other
  # libraries too. Useful for gdb's catch command.
  install -Dm644 "$srcdir/sdt.h" "$pkgdir/usr/$_target/include/sys/sdt.h"
  install -Dm644 "$srcdir/sdt-config.h" "$pkgdir/usr/$_target/include/sys/sdt-config.h"
}
