# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libusb-compat
pkgver=0.1.8
pkgrel=2
pkgdesc="C library that provides generic access to USB devices (32-bit)"
arch=('x86_64')
depends=('libusb-compat'
         'lib32-glibc'
         'lib32-libusb')
url="https://libusb.info/"
license=('LGPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/libusb/${pkgname#lib32-}-0.1/releases/download/v${pkgver}/${pkgname#lib32-}-${pkgver}.tar.gz")
sha512sums=('0f935b89d06a8ffd6c87b03d649b1136a0f84110874d1b8d071a0af922b9b2f911143670fc9297309053f29ba02e1714fa4f4bdd8b71c26dbaf32146699fcf34')

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
