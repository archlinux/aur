# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-gcc-stage2
pkgver=7.2.0
_pkgver=${pkgver:0:1}
_islver=0.18
pkgrel=3
_commit=1bd23ca8c30f4827c4bea23deedf7ca33a86ffb5
pkgdesc="The GNU Compiler Collection. Stage 2 for toolchain building (${_target})"
arch=(i686 x86_64)
license=(GPL LGPL FDL custom)
url='http://gcc.gnu.org'
depends=("${_target}-binutils>=2.29.0-1" "${_target}-glibc-headers>=2.26-4" libmpc zlib)
options=(!emptydirs !distcc !strip)
conflicts=("${_target}-gcc-stage1")
replaces=("${_target}-gcc-stage1")
provides=("${_target}-gcc-stage1=${pkgver}")
source=(https://github.com/gcc-mirror/gcc/archive/${_commit}.tar.gz
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        Revert-eeb6872bf.patch
        PR82155.patch)
md5sums=('1b6966a45fe43445ae7ae4ffd5d43df9'
         '11436d6b205e516635b666090b94ab32'
         'e4c9c8b498b04c0f51d219d025ca8407'
         'e77419f7d25aad0980c765012dc8c417')

prepare() {
  mv gcc-${_commit}* gcc
  cd gcc

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80717
  patch -p1 -i ${srcdir}/Revert-eeb6872bf.patch

  mkdir -p "$srcdir/gcc-build"

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82155
  patch -p1 -i ../PR82155.patch
}

build() {
  cd gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  "$srcdir/gcc/configure" --prefix=/usr \
      --program-prefix=${_target}- \
      --with-local-prefix=/usr/${_target} \
      --with-sysroot=/usr/${_target} \
      --with-build-sysroot=/usr/${_target} \
      --with-as=/usr/bin/${_target}-as \
      --with-ld=/usr/bin/${_target}-ld \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --disable-nls \
      --enable-languages=c,c++ \
      --disable-shared \
      --disable-threads \
      --with-system-zlib \
      --with-isl \
      --enable-__cxa_atexit \
      --disable-libunwind-exceptions \
      --enable-clocale=gnu \
      --disable-libstdcxx-pch \
      --disable-libssp \
      --enable-gnu-unique-object \
      --enable-linker-build-id \
      --disable-lto \
      --disable-plugin \
      --enable-install-libiberty \
      --with-linker-hash-style=gnu \
      --enable-gnu-indirect-function \
      --disable-multilib \
      --disable-werror \
      --enable-checking=release \
      --enable-default-pie \
      --enable-default-ssp \
      --target=${_target} \
      --host=${CHOST} \
      --build=${CHOST} \
      --with-arch=armv6 \
      --with-float=hard \
      --with-fpu=vfp

  make all-gcc all-target-libgcc
}

package() {
  cd gcc-build

  make DESTDIR="$pkgdir" install-gcc install-target-libgcc

  rm -rf "$pkgdir/usr/share"

  # strip it manually
  strip "$pkgdir/usr/bin/"* 2>/dev/null || true
  find "$pkgdir/usr/lib" -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}
