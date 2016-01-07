# Maintainer: Lukas K. <lu@0x83.eu>
# adapted from msp430-elf PKGBUILD

_target="rl78-elf"
pkgname=${_target}-gcc-stage1
pkgver=5.2.0
_islver=0.14.1
pkgrel=1
pkgdesc="The GNU Compiler Collection. Stage 1 for toolchain building (${_target})"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=("${_target}-binutils>=2.25" 'libmpc' 'elfutils')
options=('staticlibs' '!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2)
sha256sums=('5f835b04b5f7dd4f4d2dc96190ec1621b8d89f2dc6f638f9f8bc1b1014ba8cad'
            '1f20561843eb9f6ae2076800bc45f3680ff7696520257cd5734ccfb843464cae')

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

  [ $NOEXTRACT -eq 1 ] || ../configure \
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
