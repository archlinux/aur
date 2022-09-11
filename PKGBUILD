# Maintainer: Xiaotian Wu <yetist@gmail.com>

_target=loongarch64-linux-gnu
pkgname=$_target-glibc
pkgver=2.36
_pkgdate=20220905
pkgrel=1
pkgdesc='GNU C Library LoongArch target'
arch=(x86_64)
url='https://www.gnu.org/software/libc/'
license=(GPL LGPL)
depends=($_target-gcc $_target-linux-api-headers)
groups=(loongarch)
makedepends=(python)
options=(!buildflags !strip staticlibs)
source=("https://github.com/yetist/glibc/releases/download/v${_pkgdate}/glibc-${pkgver}-${_pkgdate}.tar.xz"
        ldd)
sha1sums=('02d7f190b7f7bf9e23b4a2aab98c14533a04708d'
          'ac0c9382c59de66a56bacb7b6dcf75be2dcbaca6')

prepare() {
  mkdir -p glibc-build
  cd glibc-$pkgver
  sed "/RTLDLIST=/s@usr/lib@usr/$_target/lib@g" $srcdir/ldd > $srcdir/$_target-ldd
  sed -i "s/ldd/${_target}-ldd/g" $srcdir/$_target-ldd
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

  ../glibc-$pkgver/configure \
      --prefix=/usr \
      --target=$_target \
      --host=$_target \
      --build=$CHOST \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --with-headers=/usr/$_target/include \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-kernel=2.6.32 \
      --enable-add-ons \
      --enable-bind-now \
      --disable-profile \
      --enable-stackguard-randomization \
      --enable-lock-elision \
      --disable-werror

  echo 'build-programs=no' >> configparms
  make
}

package() {
  cd glibc-build

  make install_root="$pkgdir"/usr/$_target install
  install -Dm755 $srcdir/${_target}-ldd $pkgdir/usr/bin/${_target}-ldd
  # make install_root=$pkgdir/usr/$_target install-headers install-bootstrap-headers=yes
  # make csu/subdir_lib
  # mkdir -p $pkgdir/usr/$_target/lib $pkgdir/usr/$_target/include/gnu
  # cp csu/crt1.o csu/crti.o csu/crtn.o $pkgdir/usr/$_target/lib
  # $_target-gcc \
  #   -nostdlib \
  #   -nostartfiles \
  #   -shared \
  #   -x c /dev/null \
  #   -o $pkgdir/usr/$_target/lib/libc.so
  # touch $pkgdir/usr/$_target/include/gnu/stubs.h

  rm -rf "$pkgdir"/usr/$_target/{bin,sbin,etc,share,var}
}

# vim: ts=2 sw=2 et:
