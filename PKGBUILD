# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libusb-compat
_pkgname="${pkgname#lib32-}"
pkgver=0.1.7
pkgrel=4
pkgdesc="Library to enable user space application programs to communicate with USB devices (32 bit)"
arch=('x86_64')
depends=('libusb-compat'
	 'lib32-glibc')
makedepends=('lib32-libusb')
url="https://libusb.info/"
license=('LGPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/libusb/${_pkgname}-0.1/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0679ce38aa02498c1eea9c13398a0d2356883d574632a59c1e25274ed4925cf8')

prepare() {
  cd "${_pkgname}-${pkgver}"
  autoreconf -vfi
}

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr \
	      --libdir=/usr/lib32 \
	      --disable-static
  make
}

package() {
  make -C "${_pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include}
}
