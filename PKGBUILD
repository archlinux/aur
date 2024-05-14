# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=snander
pkgver=v.1.7.8
pkgrel=1
pkgdesc="SNANDer - Serial Nor/nAND/Eeprom programmeR (based on CH341A)"
url="https://github.com/McMCCRU/SNANDer"
arch=('any')
license=('GPL2')
source=("SNANDer-$pkgver.tar.gz::https://codeload.github.com/McMCCRU/SNANDer/tar.gz/refs/tags/$pkgver")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/SNANDer-$pkgver/src"

  # fix libusb build error
  sed -i -r "s|^(SNANDer:).*$|\1 \$(OBJS)|g" Makefile

  # build libusb for static linking
  cd libusb-*
  ./autogen.sh && ./configure --prefix="${srcdir}/SNANDer-$pkgver/src/lusb_build" --disable-udev
  make && make install

  cd ../ && make
}

package() {
  install -D -m755 "${srcdir}/SNANDer-$pkgver/src/SNANDer" "${pkgdir}/usr/bin/snander"
}
