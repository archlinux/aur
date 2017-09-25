# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

_target="msp430-elf"
pkgname=${_target}-gcc
pkgver=7.2.0
_islver=0.18
pkgrel=1
pkgdesc="The GNU Compiler Collection for the ${_target} target."
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=("${_target}-newlib" "${_target}-binutils" 'libmpc' 'elfutils')
options=('staticlibs' '!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
conflicts=("${_target}-gcc-stage1")
replaces=("${_target}-gcc-stage1")
provides=("${_target}-gcc-stage1")
source=(http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz
        revert-pr71289.patch
        0001-Use-GET_MODE_BITSIZE-when-setting-TYPE_SIZE.patch)
sha256sums=('6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b'
            '1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a'
            '836ecb799c88b1c4db7e6ef2df72437a8fe162d1a2d3fb395198fba702f7d9d6'
            '28f39dd3ef931d87de1eccf7700406c5b76fa7a6ecf47cfb3f199b33cd1fdf02')


prepare() {
  cd "${srcdir}/gcc-${pkgver}"
  [[ -L isl ]] && rm -f isl
  ln -s ../isl-${_islver} isl

  [[ -d gcc-build ]] && rm -rf gcc-build
  mkdir gcc-build

  # Until pr79242 is resolved, revert pr71289. Yes, the underlying bug is still
  # there, but I do not have the time to investigate it and fix it at the
  # moment. Patches/comments are welcome.
  patch -p1 < ../revert-pr71289.patch
  # while we are at it, fix pr78849
  patch -p1 < ../0001-Use-GET_MODE_BITSIZE-when-setting-TYPE_SIZE.patch
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
