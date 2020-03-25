# Maintainer: Viktor Schneider <info at vjs <dot> io>
# Based on PKGBUILD from msp430-elf-gcc

_target="msp430-elf"
pkgname=${_target}-libstdc++
pkgver=9.3.0
pkgrel=1
pkgdesc="The GNU C++ Standard Library for the ${_target} target."
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=("${_target}-newlib" "${_target}-binutils" "${_target}-gcc>=9.0.0" "${_target}-gcc<10.0.0" "libmpc" "elfutils" "zlib")
options=('staticlibs' '!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
source=(https://ftpmirror.gnu.org/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.xz)
sha256sums=('71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1')


prepare() {
  cd "${srcdir}/gcc-${pkgver}"
  
  [[ -d gcc-build ]] && rm -rf gcc-build
  mkdir gcc-build
}

build() {
  cd "${srcdir}/gcc-${pkgver}"

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  export CFLAGS_FOR_TARGET="-Os -pipe"
  export CXXFLAGS_FOR_TARGET="-Os -pipe"

  echo ${pkgver} > gcc/BASE-VER

  cd gcc-build

  ../configure \
    --prefix=/usr \
    --program-prefix=${_target}- \
    --target=${_target} \
    --host=$CHOST \
    --build=$CHOST \
    --disable-shared \
    --disable-nls \
    --disable-threads \
    --enable-languages=c++ \
    --enable-multilib \
    --with-newlib \
    --with-local-prefix=/usr/${_target} \
    --with-sysroot=/usr/${_target} \
    --with-as=/usr/bin/${_target}-as \
    --with-ld=/usr/bin/${_target}-ld \
    --enable-interwork \
    --disable-namespaces \
    --disable-libgcc-rebuild

  make all-target-libstdc++-v3
}

package() {
  cd "${srcdir}/gcc-${pkgver}/gcc-build"

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  export CFLAGS_FOR_TARGET="-Os -pipe"
  export CXXFLAGS_FOR_TARGET="-Os -pipe"

  make DESTDIR="${pkgdir}" install-target-libstdc++-v3

  rm -rf "${pkgdir}/usr/share"
  rm -rf "${pkgdir}/usr/lib"

  # strip it manually
  strip "${pkgdir}"/usr/bin/* 2>/dev/null || true
  find "${pkgdir}"/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}
