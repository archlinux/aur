# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

_target="msp430-elf"
pkgname=${_target}-gcc-stage1
pkgver=9.3.0
_islver=0.22.1
pkgrel=1
pkgdesc="The GNU Compiler Collection bootstrap for the ${_target} target."
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=("${_target}-binutils>=2.25" 'libmpc' 'elfutils' 'zlib')
options=('staticlibs' '!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
source=(http://isl.gforge.inria.fr/isl-${_islver}.tar.xz
        ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz)
sha256sums=('28658ce0f0bdb95b51fd2eb15df24211c53284f6ca2ac5e897acc3169e55b60f'
            '71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1')

prepare() {
  # add isl into tree
  cd "${srcdir}/gcc-${pkgver}"
  [[ -L isl ]] && rm -f isl
  ln -s ../isl-${_islver} isl

  # clean build directory
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
    --enable-languages=c \
    --enable-multilib \
    --without-headers \
    --with-newlib \
    --with-system-zlib \
    --with-local-prefix=/usr/${_target} \
    --with-sysroot=/usr/${_target} \
    --with-as=/usr/bin/${_target}-as \
    --with-ld=/usr/bin/${_target}-ld \
    --disable-libgomp

  make all-gcc
}

package() {
  cd "${srcdir}/gcc-${pkgver}"/gcc-build

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  export CFLAGS_FOR_TARGET="-O2 -pipe"
  export CXXFLAGS_FOR_TARGET="-O2 -pipe"

  make DESTDIR="$pkgdir" install-gcc

  rm -rf "$pkgdir"/usr/share/man/man7/
  rm -rf "$pkgdir/usr/share/info"

  cp -r "$pkgdir"/usr/libexec/* "$pkgdir/usr/lib/"
  rm -rf "$pkgdir/usr/libexec"

  # strip it manually
  strip "$pkgdir"/usr/bin/* 2>/dev/null || true
  find "$pkgdir"/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}

# vim:set ts=2 sw=2 et:
