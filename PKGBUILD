# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-gcc-stage2
pkgver=9.1.0
_majorver=${pkgver:0:1}
_islver=0.21
pkgrel=2
pkgdesc="The GNU Compiler Collection. Stage 2 for toolchain building (${_target})"
arch=(i686 x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
depends=("${_target}-binutils>=2.32-2" "${_target}-glibc-headers>=2.29-3" libmpc zlib)
options=(!emptydirs !distcc !strip)
conflicts=("${_target}-gcc-stage1")
replaces=("${_target}-gcc-stage1")
provides=("${_target}-gcc-stage1=${pkgver}")
#source=(https://sources.archlinux.org/other/gcc/gcc-${pkgver/+/-}.tar.xz{,.sig}
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig}
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        bz90397.patch
        bz90949.patch)
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              33C235A34C46AA3FFB293709A328C3A2C3C45C06) # Jakub Jelinek <jakub@redhat.com>
sha256sums=('79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0'
            'SKIP'
            'd18ca11f8ad1a39ab6d03d3dcb3365ab416720fcb65b42d69f34f51bf0a0e859'
            'cc20d05bcc6cb35bf0944b391f0b0380af375f2a8a03ce1cd67835884bc41fac'
            'c860819e730faf1621e1286ebe3a0179df6e25182b81a9ca0a3db02633982a14')

_svnrev=264010
_svnurl=svn://gcc.gnu.org/svn/gcc/branches/gcc-${_majorver}-branch
_libdir=usr/lib/gcc/$CHOST/${pkgver%%+*}

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90397
  patch -p0 -i "$srcdir/bz90397.patch"

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90949
  patch -p0 -i "$srcdir/bz90949.patch"

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

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
