# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Maintainer: Vyacheslav Razykov <v.razykov@gmail.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-gcc-stage2
pkgver=11.2.0
_majorver=${pkgver%%.*}
_islver=0.24
pkgrel=2
pkgdesc="The GNU Compiler Collection. Stage 2 for toolchain building (${_target})"
arch=(i686 x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
depends=("${_target}-binutils>=2.37-1" "${_target}-glibc-headers>=2.33-3" libmpc zlib)
options=(!emptydirs !distcc !strip)
conflicts=("${_target}-gcc-stage1")
replaces=("${_target}-gcc-stage1")
provides=("${_target}-gcc-stage1=${pkgver}")
source=(https://sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz{,.sig}
        https://libisl.sourceforge.io/isl-${_islver}.tar.xz
        all_default-ssp-fix.patch
        gcc-ada-repro.patch
        gcc11-Wno-format-security.patch)

validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62) # Jakub Jelinek <jakub@redhat.com>
sha256sums=('d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b'
            'SKIP'
            '043105cc544f416b48736fff8caf077fb0663a717d06b1113f16e391ac99ebad'
            '88acab8b777759a002e186a1f9d96f96b651bf20454bfdf891a0d64231097c32'
            '867e7ef398932bec08b1d381c297877dceec031c0077a02dce2d662c5fa23183'
            'f2878f006949165ba5a400a10f008249e8e27a833ebb92b3221d4e6bf5886992')

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # Turn off SSP for nostdlib|nodefaultlibs|ffreestanding
  # https://bugs.archlinux.org/task/64270
  # patch -p1 -i "$srcdir/all_default-ssp-fix.patch"

  # Reproducible gcc-ada
  patch -Np0 < "$srcdir/gcc-ada-repro.patch"

  # configure.ac: When adding -Wno-format, also add -Wno-format-security
  patch -Np0 < "$srcdir/gcc11-Wno-format-security.patch"

  mkdir -p "$srcdir/gcc-build"
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
      --with-isl \
      --with-linker-hash-style=gnu \
      --with-system-zlib \
      --enable-__cxa_atexit \
      --enable-checking=release \
      --enable-clocale=gnu \
      --enable-default-pie \
      --enable-default-ssp \
      --enable-gnu-indirect-function \
      --enable-gnu-unique-object \
      --enable-install-libiberty \
      --enable-linker-build-id \
      --disable-lto \
      --disable-plugin \
      --disable-shared \
      --disable-threads \
      --disable-libssp \
      --disable-libstdcxx-pch \
      --disable-libunwind-exceptions \
      --disable-multilib \
      --disable-werror \
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
