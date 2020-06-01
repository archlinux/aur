# Maintainer : Darks <l.gatin@protonmail.com>

_target="sh-elf"
pkgname=${_target}-gcc-casio
pkgver=10.1.0
pkgrel=1
pkgdesc="The GNU Compiler Collection for the Casio calculators SuperH processors."
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=("${_target}-binutils-casio" 'libmpc' 'elfutils' 'gmp' 'mpfr')
optdepends=('isl: integer set library')
options=('!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
source=("https://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz")
sha512sums=('0cb2a74c793face751f42bc580960b00e2bfea785872a0a2155f1f1dbfaa248f9591b67f4322db0f096f8844aca9243bc02732bda106c3b6e43b02bb67eb3096')

prepare() {
  cd "${srcdir}/gcc-${pkgver}"

  # Ensure a clean build
  [[ -d gcc-build ]] && rm -rf gcc-build
  mkdir gcc-build
}

build() {
  cd "${srcdir}/gcc-${pkgver}/gcc-build"

  ../configure \
    --prefix=/usr \
    --target=sh3eb-elf \
    --with-multilib-list=m3,m4-nofpu \
    --program-prefix=${_target}- \
    --enable-languages=c,c++ \
    --without-headers \
    --with-newlib \
    --disable-nls \
    --enable-libssp \
    --enable-lto \
    --disable-werror \

  make all-gcc all-target-libgcc
}

package() {
  cd "${srcdir}/gcc-${pkgver}/gcc-build"

  make DESTDIR="${pkgdir}" install-gcc install-target-libgcc

  # Remove unwanted files
  rm -rf "${pkgdir}/usr/share/"

  # Strip it manually
  strip ${pkgdir}/usr/bin/* 2>/dev/null || true
  find ${pkgdir}/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}
