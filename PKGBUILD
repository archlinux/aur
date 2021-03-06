# Maintainer: Darks <l.gatin@protonmail.com>

_target=sh-elf
pkgname=${_target}-binutils-casio
pkgver=2.36
pkgrel=2
pkgdesc="GNU binary utilities for the Casio calculators SuperH processors."
arch=(i686 x86_64)
options=('!libtool' '!buildflags')
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=('binutils' 'flex' 'zlib')
source=(https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2)
sha256sums=('209ef690dc7ac28ca592daf7e87d6289222a61fb96104dd5d5e016133ed38e8d')

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
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so
  rmdir "$pkgdir"/usr/lib/bfd-plugins
  rmdir "$pkgdir"/usr/lib
}
