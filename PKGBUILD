# Maintainer : Darks <l.gatin@protonmail.com>

_target="sh-elf"
pkgname=${_target}-gcc-casio
pkgver=9.2.0
pkgrel=5
pkgdesc="The GNU Compiler Collection for the Casio calculators SuperH processors."
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=("${_target}-binutils-casio" 'libmpc' 'elfutils' 'gmp' 'mpfr')
optdepends=('isl: integer set library')
options=('!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
source=("https://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz")
sha256sums=('ea6ef08f121239da5695f76c9b33637a118dcf63e24164422231917fa61fb206')

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
