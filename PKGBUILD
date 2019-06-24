# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Maintainer: Stefan Schmidt <thrimbor.github@gmail.com>

_target="powerpc-linux-gnu"
pkgname="${_target}-gcc"
pkgver=9.1.0
_majorver=${pkgver}
_islver=0.21
pkgrel=1
pkgdesc="The GNU Compiler Collection (${_target})"
arch=(i686 x86_64)
license=(GPL LGPL FDL custom)
url='http://gcc.gnu.org'
depends=("${_target}-binutils>=2.30-1" "${_target}-glibc>=2.27-1" libmpc elfutils zlib)
makedepends=(gmp mpfr)
checkdepends=(dejagnu inetutils)
options=(!emptydirs !distcc !strip)
conflicts=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
replaces=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
provides=("${_target}-gcc-stage1=${pkgver}" "${_target}-gcc-stage2=${pkgver}")
source=(https://gcc.gnu.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig}
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2)
sha256sums=('79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0'
            SKIP
            'd18ca11f8ad1a39ab6d03d3dcb3365ab416720fcb65b42d69f34f51bf0a0e859')
validpgpkeys=(33C235A34C46AA3FFB293709A328C3A2C3C45C06) # Jakub Jelinek <jakub@redhat.com>

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

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
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --disable-nls \
      --enable-languages=c,c++ \
      --enable-shared \
      --enable-threads=posix \
      --with-system-zlib \
      --with-isl \
      --enable-__cxa_atexit \
      --disable-libunwind-exceptions \
      --enable-clocale=gnu \
      --disable-libstdcxx-pch \
      --disable-libssp \
      --enable-gnu-unique-object \
      --enable-linker-build-id \
      --enable-lto \
      --enable-plugin \
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
      --build=${CHOST}

  make
}

package() {
  cd gcc-build

  make DESTDIR="$pkgdir" install-gcc install-target-libgcc \
    install-target-libstdc++-v3

  rm -rf "$pkgdir/usr/share"

  # strip it manually
  strip "$pkgdir/usr/bin/"* 2>/dev/null || true
  find "$pkgdir/usr/lib" -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}
