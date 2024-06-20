# Maintainer: Nicolas Farmer <nicolas dot farmer at proton dot me>

_target=ia64-linux-gnu
pkgname=$_target-glibc
pkgver=2.39
pkgrel=1
pkgdesc='GNU C Library and headers (ia64) (from linux-ia64 project)'
arch=('any')
url='https://github.com/linux-ia64/glibc-ia64'
license=(GPL LGPL)
depends=("${_target}-linux-api-headers")
makedepends=("${_target}-gcc-bootstrap" 'python')
options=('!emptydirs' '!strip' 'staticlibs' '!lto')
source=("git+https://github.com/linux-ia64/glibc-ia64.git")
sha256sums=('SKIP')

prepare() {
  mkdir -p glibc-build
}

build() {
  cd glibc-build

  echo 'slibdir=/lib' >> configparms
  echo 'rtlddir=/lib' >> configparms
  echo 'sbindir=/bin' >> configparms
  echo 'rootsbindir=/bin' >> configparms

  # remove hardening options for building libraries
  export CFLAGS="-U_FORTIFY_SOURCE -O2"
  export CPPFLAGS="-U_FORTIFY_SOURCE -O2"
  unset LD_LIBRARY_PATH

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

  ../glibc-ia64/configure \
      --prefix=/usr \
      --target=$_target \
      --host=$_target \
      --build=$CHOST \
      --libdir=/lib \
      --libexecdir=/lib \
      --includedir=/include \
      --with-headers=/usr/$_target/include \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-kernel=4.4 \
      --enable-add-ons \
      --enable-bind-now \
      --disable-profile \
      --enable-stackguard-randomization \
      --enable-lock-elision \
      --disable-werror

  echo 'build-programs=no' >> configparms
  make -j`nproc`
}

package() {
  cd glibc-build

  make install_root="${pkgdir}"/usr/"${_target}" install
  make install_root="${pkgdir}"/usr/"${_target}" install-headers install-bootstrap-headers=yes
  make csu/subdir_lib
  mkdir -p $pkgdir/usr/$_target/lib $pkgdir/usr/$_target/include/gnu
  cp csu/crt1.o csu/crti.o csu/crtn.o $pkgdir/usr/$_target/lib
  # $_target-gcc \
  #   -nostdlib \
  #   -nostartfiles \
  #   -shared \
  #   -x c /dev/null \
  #   -o $pkgdir/usr/$_target/lib/libc.so
  # touch $pkgdir/usr/$_target/include/gnu/stubs.h

  rm -rf "$pkgdir"/usr/$_target/{bin,sbin,etc,share,var,usr/share,usr/bin}
}
