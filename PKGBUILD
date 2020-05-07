# Maintainer: Darks <l.gatin@protonmail.com>

_target=sh-elf
pkgname=${_target}-binutils-casio
pkgver=2.34
pkgrel=1
pkgdesc="GNU binary utilities for the Casio calculators SuperH processors."
arch=(i686 x86_64)
options=('!libtool' '!buildflags')
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=('zlib' 'flex')
source=(https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2)
sha256sums=('89f010078b6cf69c23c27897d686055ab89b198dddf819efb0a4f2c38a0b36e6')

prepare() {
  cd "${srcdir}/binutils-${pkgver}"

  # ensure a clean build
  [[ -d binutils-build ]] && rm -rf binutils-build
  mkdir binutils-build
}

build() {
  export CFLAGS="-O2 -pipe -s -fomit-frame-pointer -ffunction-sections -fdata-sections"
  export CXXFLAGS=$CFLAGS
  export LDFLAGS="-Wl,--gc-sections"

  cd "${srcdir}/binutils-${pkgver}/binutils-build"
  ../configure \
    --prefix=/usr \
    --target=sh3eb-elf \
    --with-multilib-list=m3,m4-nofpu \
    --program-prefix=${_target}- \
    --disable-nls \
    --enable-libssp \
    --enable-lto \
    --disable-werror

  make configure-host
  make
}

package() {
  cd "${srcdir}/binutils-${pkgver}/binutils-build"
  echo "Install on ${pkgdir}"
  make DESTDIR="${pkgdir}" install

  # Remove info documents that conflicts with host version
  rm -rf "${pkgdir}/usr/share/info"
}
