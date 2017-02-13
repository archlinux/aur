# Maintainer: Geronimo Bareiro <gero dot bare at gmail dot com>

_target="mips-harvard-os161"
pkgname=${_target}-gcc48
_pkgver=4.8.3+os161-2.1
pkgver=${_pkgver/os161-/os161_}
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ${_target} arquitecture. This is part of toolset for the course os161 from Harvard."
arch=(i686 x86_64)
url="http://os161.eecs.harvard.edu/"
license=('GPL' 'LGPL')
groups=('mips-harvard-os161-toolchain')
depends=('mips-harvard-os161-binutils>=2.24' 'gmp' 'mpfr' 'libmpc')
makedepends=('flex' 'bison')
provides=('mips-harvard-os161-gcc')
conflicts=('mips-harvard-os161-gcc')
options=(staticlibs !libtool !emptydirs !strip zipman docs)
source=(http://os161.eecs.harvard.edu/download/gcc-${_pkgver}.tar.gz
gcc.patch)
md5sums=('a81f7f6fdfa319723efaf444088fd6d7'
'SKIP')

prepare() {
  cd gcc-${_pkgver}

  patch -p1 -i ${srcdir}/gcc.patch
  mkdir ${srcdir}/gcc-build
}

build() {
  cd gcc-build

  export CFLAGS="-O2"
  export CXXFLAGS="-O2"
  unset CPPFLAGS

  ../gcc-${_pkgver}/configure --prefix=/usr \
      --program-prefix=${_target}- \
      --with-local-prefix=/usr/lib/${_target} \
      --target=${_target} --host=${CHOST} --build=${CHOST} \
      --with-build-sysroot=/usr/${_target} \
      --with-as=/usr/bin/${_target}-as \
      --with-ld=/usr/bin/${_target}-ld \
      --enable-languages=c,lto \
      --disable-nls --nfp \
      --disable-shared --disable-threads \
      --disable-libmudflap --disable-libssp \
      --disable-libstdcxx \
      --disable-werror

  make
}

package() {
  cd ${srcdir}/gcc-build
  make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install

  # Delete the things we don't need
  rm -rf ${pkgdir}/usr/share
  # libiberty.a conflicts with host version
  rm -f  $pkgdir/usr/lib/libiberty.a
}

# vim: set ts=2 sw=2 ft=sh et:
