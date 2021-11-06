# Maintainer: Eldeberen <eldeberen@middleearth.fr>
pkgname=sh-elf-gcc-casio
pkgver=11.2.0
pkgrel=1
pkgdesc="The GNU Compiler Collection for the Casio calculators SuperH processors."
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url='http://gcc.gnu.org'
depends=("sh-elf-binutils-casio" 'libmpc' 'elfutils' 'gmp' 'mpfr')
optdepends=('isl: integer set library')
options=('!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
source=("https://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz")
sha256sums=('d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b')
_target="sh-elf"

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
    --disable-werror

  make all-gcc all-target-libgcc
}

package() {
  cd "${srcdir}/gcc-${pkgver}/gcc-build"

  make DESTDIR="${pkgdir}" install-strip-gcc install-strip-target-libgcc

  # Remove unwanted files
  rm -rf "${pkgdir}/usr/share/"
}