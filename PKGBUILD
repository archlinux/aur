# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libusb-compat
_pkgname="${pkgname#lib32-}"
pkgver=0.1.8
pkgrel=1
pkgdesc="C library that provides generic access to USB devices (32-bit)"
arch=('x86_64')
depends=('libusb-compat'
         'lib32-glibc')
makedepends=('lib32-libusb')
url="https://libusb.info/"
license=('LGPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/libusb/${_pkgname}-0.1/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('01fb8f88cdce751c4afae0c0e10a202f32d30a03e87084bf61ccf5e55d2208bc99a34eff1205670be3006a1501c0cf0c90cdba4240705f5cf40f7752b23d8756')

prepare() {
  cd "${_pkgname}-${pkgver}"
  autoreconf -vfi
}

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  cd "${_pkgname}-${pkgver}"
  ./configure \
      --prefix=/usr \
      --libdir=/usr/lib32 \
      --disable-static
  make
}

package() {
  make -C "${_pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include}
}
