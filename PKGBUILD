# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

_target="msp430-elf"
pkgname=${_target}-gcc
pkgver=8.3.0
_islver=0.20
pkgrel=1
pkgdesc="The GNU Compiler Collection for the ${_target} target."
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=("${_target}-newlib" "${_target}-binutils" 'libmpc' 'elfutils' 'zlib')
options=('staticlibs' '!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
conflicts=("${_target}-gcc-stage1")
replaces=("${_target}-gcc-stage1")
provides=("${_target}-gcc-stage1")
source=(http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz)
sha256sums=('b587e083eb65a8b394e833dea1744f21af3f0e413a448c17536b5549ae42a4c2'
            '64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c')


prepare() {
  cd "${srcdir}/gcc-${pkgver}"
  [[ -L isl ]] && rm -f isl
  ln -s ../isl-${_islver} isl

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
    --enable-languages=c,c++ \
    --enable-multilib \
    --with-system-zlib \
    --with-local-prefix=/usr/${_target} \
    --with-sysroot=/usr/${_target} \
    --with-as=/usr/bin/${_target}-as \
    --with-ld=/usr/bin/${_target}-ld \
    --disable-libgomp \
    --disable-libssp \
    --enable-interwork \
    --enable-addons

  make all-gcc all-target-libgcc
}

package() {
  cd "${srcdir}/gcc-${pkgver}/gcc-build"

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  export CFLAGS_FOR_TARGET="-Os -pipe"
  export CXXFLAGS_FOR_TARGET="-Os -pipe"

  make DESTDIR="${pkgdir}" install-gcc install-target-libgcc

  rm -rf "${pkgdir}/usr/share/man/man7/"
  rm -rf "${pkgdir}/usr/share/info"

  cp -r "${pkgdir}"/usr/libexec/* "${pkgdir}/usr/lib/"
  rm -rf "${pkgdir}/usr/libexec"

  # strip it manually
  strip "${pkgdir}"/usr/bin/* 2>/dev/null || true
  find "${pkgdir}"/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}

# vim:set ts=2 sw=2 et:
