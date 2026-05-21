# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libusb-compat
pkgver=0.1.9
pkgrel=1
pkgdesc="C library that provides generic access to USB devices (32-bit)"
arch=('x86_64')
depends=('libusb-compat'
         'lib32-glibc'
         'lib32-libusb')
url="https://libusb.info/"
license=('LGPL-2.1-only')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/libusb/${pkgname#lib32-}-0.1/releases/download/v${pkgver}/${pkgname#lib32-}-${pkgver}.tar.gz")
sha512sums=('476380c71454ef2ad8ebfdc35caa88d49522d60a92098f1581944a699287020440b8a173a1e79c990a78ccd070a1598d0b884598826930c6edcc29c16dc40fa9')

prepare() {
  cd "${pkgname#lib32-}-${pkgver}"
  autoreconf -vfi
}

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  cd "${pkgname#lib32-}-${pkgver}"
  ./configure \
      --prefix=/usr \
      --libdir=/usr/lib32 \
      --disable-static
  make
}

package() {
  make -C "${pkgname#lib32-}-${pkgver}" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include}
}
