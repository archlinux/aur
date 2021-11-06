# Maintainer: Eldeberen <eldeberen@middleearth.fr>
pkgname=sh-elf-binutils-casio
pkgver=2.37
pkgrel=6
pkgdesc="GNU binary utilities for the Casio calculators SuperH processors."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/binutils/"
license=('GPL')
depends=('binutils' 'flex' 'zlib')
makedepends=('gcc')
options=('!emptydirs' '!libtool')
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz")
sha256sums=('820d9724f020a3e69cb337893a0b63c2db161dadcb0e06fc11dc29eb1e84a32c')
_target="sh-elf"

prepare() {
  cd "${srcdir}/binutils-${pkgver}"

  # ensure a clean build
  [[ -d binutils-build ]] && rm -rf binutils-build
  mkdir binutils-build
}

build() {
  export CPPFLAGS=""
  cd "${srcdir}/binutils-${pkgver}/binutils-build"
  ../configure \
    --prefix=/usr \
    --target=sh3eb-elf \
    --with-multilib-list=m3,m4-nofpu \
    --program-prefix=${_target}- \
    --disable-nls \
    --enable-libssp \
    --enable-lto

  make configure-host
  make
}

package() {
  cd "${srcdir}/binutils-${pkgver}/binutils-build"
  echo "Install on ${pkgdir}"
  make DESTDIR="${pkgdir}" install-strip

  # Remove info documents that conflicts with host version
  rm -rf "${pkgdir}/usr/share/info"

  # Remove libraries that conflict with host version
  rm -rf "${pkgdir}/usr/lib"
}
