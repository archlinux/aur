# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=snander
pkgver=v.1.7.8
pkgrel=1
pkgdesc="SNANDer - Serial Nor/nAND/Eeprom programmeR (based on CH341A)"
url="https://github.com/McMCCRU/SNANDer"
arch=('any')
license=('GPL2')
source=("SNANDer-$pkgver.tar.gz::https://codeload.github.com/McMCCRU/SNANDer/tar.gz/refs/tags/$pkgver")
sha512sums=('4d28b66a850cc0788d53e13cf2f530e0db3d9e44c2792c84a64ef51564958f3e1f2d28d5118cb0670e88921d91be81a4094a9e13ac7165548ce0ebe11878f0ac')

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
