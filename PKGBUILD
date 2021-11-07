# Maintainer: Xiaotian Wu <yetist@gmail.com>

_target=loongarch64-linux-gnu
pkgname=$_target-glibc
pkgver=2.34.r37772.g781922b2c5
_pkgver=2.34
pkgrel=1
pkgdesc='GNU C Library LoongArch target'
arch=(x86_64)
url='https://www.gnu.org/software/libc/'
license=(GPL LGPL)
depends=($_target-gcc $_target-linux-api-headers)
groups=(loongarch)
makedepends=(python)
options=(!buildflags !strip staticlibs)
source=('git+https://github.com/loongson/glibc.git#branch=loongarch_2_34_dev'
        sdt.h
        sdt-config.h
        ldd)
sha1sums=('SKIP'
          '16c61366b98681cd6a3f13c00849824bba3510f4'
          '56aaf6d347868055b752c7d8d6560545fa480389'
          'ac0c9382c59de66a56bacb7b6dcf75be2dcbaca6')

pkgver() {
	cd "$srcdir/glibc"
	printf "${_pkgver}.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p glibc-build
  cd glibc
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

  ../glibc/configure \
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
      --enable-cet \
      --disable-multi-arch \
      --enable-plt \
      --disable-profile \
      --enable-stackguard-randomization \
      --enable-lock-elision \
      --disable-werror

  echo 'build-programs=no' >> configparms
  make -j`nproc`
}

package() {
  cd glibc-build

  make install_root="$pkgdir"/usr/$_target install
  install -Dm755 $srcdir/${_target}-ldd $pkgdir/usr/bin/${_target}-ldd
  install -Dm644 "$srcdir/sdt.h" "$pkgdir/usr/$_target/usr/include/sys/sdt.h"
  install -Dm644 "$srcdir/sdt-config.h" "$pkgdir/usr/$_target/usr/include/sys/sdt-config.h"

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
