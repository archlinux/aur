# Maintainer: Anatol Pomozov
# Updated for MIPS64: Valentín Kivachuk <vk18496@gmail.com>

_target=mips64-linux-gnu
pkgname=$_target-glibc
pkgver=2.26
pkgrel=1
_commit=be176490b818b65b5162c332eb6b581690b16e5c
pkgdesc="GNU C Library MIPS64 target"
arch=(any)
url='http://www.gnu.org/software/libc/'
license=('GPL' 'LGPL')
depends=($_target-gcc $_target-linux-api-headers)
options=(!buildflags !strip staticlibs)
source=(http://ftp.gnu.org/gnu/libc/glibc-$pkgver.tar.xz{,.sig})
sha1sums=('7cf7d521f5ebece5dd27cfb3ca5e5f6b84da4bfd'
          'SKIP')
validpgpkeys=(BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar <siddhesh@gotplt.org>

prepare() {
  mkdir -p glibc-build
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

  ../glibc-$pkgver/configure \
      --prefix=/usr \
      --target=$_target \
      --host=$_target \
      --build=$CHOST \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
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

  echo "build-programs=no" >> configparms
  make
}

package() {
  cd glibc-build

  make install_root=$pkgdir/usr/$_target install

  rm -rf $pkgdir/usr/$_target/{bin,sbin,etc,share,var}
}
