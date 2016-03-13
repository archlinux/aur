# Maintainer: Forest Crossman <cyrozap at gmail dot com>
# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

# Based on msp430-elf-gcc

_target="lm32-elf"
pkgname=${_target}-gcc
pkgver=5.3.0
pkgrel=1
pkgdesc="The GNU Compiler Collection for the ${_target} target."
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=("${_target}-binutils" 'libmpc' 'elfutils')
options=('staticlibs' '!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
source=("https://ftp.gnu.org/pub/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
        "https://ftp.gnu.org/pub/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.bz2.sig")
sha256sums=('b84f5592e9218b73dbae612b5253035a7b34a9a1f7688d2e1bfaaf7267d5c4db'
            '60db902304e72f4c69579e70184aa65ad260aaa3610ca391d818c14989f883bb')
validpgpkeys=('13975A70E63C361C73AE69EF6EEB81F8981C74C7') # Richard Guenther

prepare() {
  cd "${srcdir}/gcc-${pkgver}"

  [[ -d libstdc++-v3 ]] && rm -rf libstdc++-v3

  [[ -d gcc-build ]] && rm -rf gcc-build
  mkdir gcc-build
}

build() {
  cd "${srcdir}/gcc-${pkgver}"

  echo ${pkgver} > gcc/BASE-VER

  cd gcc-build

  [ $NOEXTRACT -eq 1 ] || ../configure \
    --prefix=/usr \
    --program-prefix=${_target}- \
    --target=${_target} \
    --host=$CHOST \
    --build=$CHOST \
    --disable-nls \
    --enable-languages=c,c++ \
    --with-local-prefix=/usr/${_target} \
    --disable-libgcc \
    --disable-libssp

  make
}

package() {
  cd "${srcdir}/gcc-${pkgver}/gcc-build"

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
