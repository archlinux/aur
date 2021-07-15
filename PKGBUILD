# Maintainer: Eldeberen <eldeberen.aur@middleearth.fr>
_target="sh-elf"
pkgname=${_target}-binutils-casio
pkgver=2.36.1
pkgrel=5
pkgdesc="GNU binary utilities for the Casio calculators SuperH processors."
arch=('i686' 'x86_64')
url='https://www.gnu.org/software/binutils/'
license=('GPL')
depends=('binutils' 'flex' 'zlib')
makedepends=('gcc')
options=('!emptydirs' '!libtool')
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2")
sha256sums=('5b4bd2e79e30ce8db0abd76dd2c2eae14a94ce212cfc59d3c37d23e24bc6d7a3')

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
