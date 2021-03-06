# Maintainer : Darks <l.gatin@protonmail.com>

_target="sh-elf"
pkgname=${_target}-gcc-casio
pkgver=10.2.0
pkgrel=3
pkgdesc="The GNU Compiler Collection for the Casio calculators SuperH processors."
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=("${_target}-binutils-casio" 'libmpc' 'elfutils' 'gmp' 'mpfr')
optdepends=('isl: integer set library')
options=('!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
source=("https://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz")
sha512sums=('42ae38928bd2e8183af445da34220964eb690b675b1892bbeb7cd5bb62be499011ec9a93397dba5e2fb681afadfc6f2767d03b9035b44ba9be807187ae6dc65e')

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

  make DESTDIR="${pkgdir}" install-strip-gcc install-strip-target-libgcc

  # Remove unwanted files
  rm -rf "${pkgdir}/usr/share/"
}
