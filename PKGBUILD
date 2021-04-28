# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Contributor: yjun <jerrysteve1101@gmail.com>
# Contributor: Yuval Adam <yuv dot adm at gmail dot com> PGP-Key: CC2115C12D99D2F0

pkgname=micronucleus
pkgver=2.5
pkgrel=1
pkgdesc="ATTiny usb bootloader with a strong emphasis on bootloader compactness"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/micronucleus/micronucleus"
license=('GPL')
install=${pkgname}.install
depends=('libusb-compat')
conflicts=('micronucleus-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/micronucleus/micronucleus/archive/v${pkgver}.tar.gz"
	"49-micronucleus.rules")
options=('!makeflags')
sha256sums=('85ea30826be83973ccac058902fe622a110d53c3dea0f6dd317ca1025d3a8af3'
            '532d0c38faa9294c29ff280a60fd4e3d5fe4d680338d189091acf2818641c6ab')

prepare() {
  cd "${pkgname}-${pkgver}/commandline"
  echo "	Removing static compile"
  sed -i 's/USBLIBS= -static $(shell libusb-config --libs)/USBLIBS= $(shell libusb-config --libs)/' Makefile
}            

build() {
  cd "${pkgname}-${pkgver}/commandline"
  make
}

package() {
  cd ""${pkgname}-${pkgver}"/commandline"

  install -Dm755 micronucleus -t "${pkgdir}/usr/bin/"
  cd "${srcdir}"
  install -Dm644 49-micronucleus.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
}

# vim:set ts=2 sw=2 et:

