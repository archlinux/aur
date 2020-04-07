# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libusb-compat
_pkgbasever=0.1
pkgname=lib32-${_pkgbase}
pkgver=0.1.7
pkgrel=1
pkgdesc="Library to enable user space application programs to communicate with USB devices (32 bit)"
arch=('x86_64')
depends=('lib32-libusb')
url="https://github.com/libusb/libusb-compat-0.1"
license=('LGPL')
options=('!libtool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/libusb/${_pkgbase}-${_pkgbasever}/archive/v${pkgver}.tar.gz")
sha256sums=('d9ca58ec05ba5a29646a7549b9c2c02475a7ed86637337a4ee35b5d559de6e0d')

prepare() {
  cd ${_pkgbase}-${_pkgbasever}-${pkgver}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  cd ${_pkgbase}-${_pkgbasever}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  cd ${_pkgbase}-${_pkgbasever}-${pkgver}
  make check
}

package() {
  make -C ${_pkgbase}-${_pkgbasever}-${pkgver} DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include}
}
