# Maintainer: Xiaotian Wu <yetist@gmail.com>

_target=loongarch64-linux-gnu
pkgname=$_target-glibc
pkgver=2.43
pkgrel=1
pkgdesc="GNU C Library LoongArch target"
arch=(any)
url='https://www.gnu.org/software/libc/'
license=('GPL' 'LGPL')
depends=($_target-gcc $_target-linux-api-headers)
groups=(loongarch)
makedepends=(python)
options=(!buildflags !strip staticlibs)
source=(https://ftpmirror.gnu.org/gnu/libc/glibc-$pkgver.tar.xz
  ldd)
sha256sums=('d9c86c6b5dbddb43a3e08270c5844fc5177d19442cf5b8df4be7c07cd5fa3831'
  'f7fcaf2b65a9e52be8b619c08ccfbadf78a1152a0b81c9e6dcf8961b96493df5')

prepare() {
  mkdir -p glibc-build
  cd glibc-$pkgver
  sed "/RTLDLIST=/s@usr/lib@usr/$_target/lib@g" $srcdir/ldd >$srcdir/$_target-ldd
  sed -i "s/ldd/${_target}-ldd/g" $srcdir/$_target-ldd
}

build() {
  cd glibc-build

  echo 'slibdir=/lib' >>configparms
  echo 'rtlddir=/lib' >>configparms
  echo 'bindir=/bin' >>configparms
  echo 'sbindir=/bin' >>configparms
  echo 'rootsbindir=/bin' >>configparms

  # remove hardening options for building libraries
  export CFLAGS="-U_FORTIFY_SOURCE -O2"
  export CPPFLAGS="-U_FORTIFY_SOURCE -O2"
  unset LD_LIBRARY_PATH

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

  ../glibc-$pkgver/configure \
    --prefix=/usr \
    --target=$_target \
    --host=$_target \
    --build=$CHOST \
    --includedir=/include \
    --libdir=/lib \
    --libexecdir=/lib \
    --with-headers=/usr/$_target/include \
    --with-bugurl=https://bugs.archlinux.org/ \
    --enable-add-ons \
    --enable-obsolete-rpc \
    --enable-kernel=2.6.32 \
    --enable-bind-now \
    --disable-profile \
    --enable-stackguard-randomization \
    --enable-lock-elision \
    --enable-multi-arch \
    --disable-werror

  echo 'build-programs=no' >>configparms
  make
}

package() {
  cd glibc-build

  make install_root="$pkgdir"/usr/$_target install
  install -Dm755 $srcdir/${_target}-ldd $pkgdir/usr/bin/${_target}-ldd
  rm -r "$pkgdir"/usr/$_target/{etc,usr,var}
}

# vim: ts=2 sw=2 et:
