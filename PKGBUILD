# Maintainer: Forest Crossman <cyrozap at gmail dot com>
# Contributor: Orlando Arias <orlandoarias at gmail <dot> com>

# Based on msp430-elf-gcc

_target="lm32-elf"
pkgname=${_target}-gcc
pkgver=9.2.0
pkgrel=1
pkgdesc="The GNU Compiler Collection for the ${_target} target."
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="https://gcc.gnu.org"
depends=("${_target}-binutils" 'libmpc' 'elfutils')
options=('staticlibs' '!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
source=("https://ftp.gnu.org/pub/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.xz"{,.sig})
sha256sums=('ea6ef08f121239da5695f76c9b33637a118dcf63e24164422231917fa61fb206'
            'SKIP')
validpgpkeys=('33C235A34C46AA3FFB293709A328C3A2C3C45C06') # Jakub Jelinek

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
