# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Vyacheslav Razykov <v.razykov@gmail.com>
# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target=arm-linux-gnueabihf
pkgname=${_target}-gcc-stage2
pkgver=13.2.0
_majorver=${pkgver%%.*}
pkgrel=1
pkgdesc="The GNU Compiler Collection. Stage 2 for toolchain building"
arch=(i686 x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
depends=("${_target}-binutils>=2.40" "${_target}-glibc-headers>=2.38")
makedepends=(binutils gcc glibc zlib)
options=(!emptydirs !distcc !strip)
conflicts=("${_target}-gcc-stage1")
replaces=("${_target}-gcc-stage1")
provides=("${_target}-gcc-stage1=${pkgver}")
source=(https://sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz{,.sig})

validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9)  # bpiotrowski@archlinux.org
sha256sums=('e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da'
            'SKIP')

prepare() {
  cd gcc-${pkgver/+/-}

  # do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir -p "${srcdir}"/gcc-build
}

build() {
  cd gcc-build

  # using -Werror=format-security causes libcpp buildig failures
  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100207 
  CFLAGS="${CFLAGS/ -Werror=format-security/}"
  CXXFLAGS="${CXXFLAGS/ -Werror=format-security/}"

  ../gcc-${pkgver/+/-}/configure \
    --target=${_target} \
    --host=${CHOST} \
    --build=${CHOST} \
    --prefix=/usr \
    --program-prefix=${_target}- \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --with-local-prefix=/usr/${_target} \
    --with-sysroot=/usr/${_target} \
    --with-build-sysroot=/usr/${_target} \
    --with-as=/usr/bin/${_target}-as \
    --with-ld=/usr/bin/${_target}-ld \
    --with-linker-hash-style=gnu \
    --with-system-zlib \
    --with-newlib \
    --with-arch=armv6 \
    --with-float=hard \
    --with-fpu=vfp \
    --enable-languages=c,c++,lto \
    --enable-__cxa_atexit \
    --enable-checking=release \
    --enable-clocale=gnu \
    --enable-default-pie \
    --enable-default-ssp \
    --enable-gnu-indirect-function \
    --enable-gnu-unique-object \
    --enable-install-libiberty \
    --enable-linker-build-id \
    --enable-lto \
    --enable-threads \
    --disable-nls \
    --disable-plugin \
    --disable-shared \
    --disable-libssp \
    --disable-libstdcxx-pch \
    --disable-libunwind-exceptions \
    --disable-multilib \
    --disable-werror

  make all-gcc all-target-libgcc
}

package() {
  cd gcc-build

  make DESTDIR="${pkgdir}" install-gcc install-target-libgcc

  rm -rf "${pkgdir}"/usr/share

  # strip it manually
  strip "${pkgdir}"/usr/bin/* 2>/dev/null || true
  find "${pkgdir}"/usr/lib -type f -exec /usr/bin/"${_target}"-strip --strip-unneeded {} \; 2>/dev/null || true
}
