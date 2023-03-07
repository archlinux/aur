# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>
pkgname=dektec-drivers-dkms
pkgver=2022.12.0
pkgrel=1
pkgdesc="Linux DKMS for Dektec device drivers"
arch=('any')
url="https://github.com/tsduck/dektec-dkms"
license=('BSD')
depends=('dkms')
makedepends=()
provides=('dektec-drivers-dkms')
conflicts=('dektec-drivers-dkms' 'dektec-dkms')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsduck/dektec-dkms/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('65d4db05b5b0af39a4580e4bbe5957120c8d3bc93781762b1e40bd75978b4fbb')

prepare() {
	cd "${srcdir}/dektec-dkms-${pkgver}"
	# prepare dektec-dkms driver in tmp/
	./build-dektec-dkms --prepare
}

package() {
	# check version of DekTec's Linux SDK
	cd "${srcdir}/dektec-dkms-${pkgver}"
	sdkver=$(./get-dektec-linux-sdk-url.sh | sed 's/.*_v//;s/.tar.gz//')

	# start package
	install -dm 755 "${pkgdir}/usr/src"
	cd "${srcdir}/dektec-dkms-${pkgver}/tmp/dektec-dkms-${sdkver}"
	# remove deprecated feature REMAKE_INITRD=no from dkms.conf
	sed -i '/REMAKE_INITRD=no/d' "dektec-${sdkver}/dkms.conf"	
	# install license
	install -Dm644 "License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	# install sources
	cp -dr --no-preserve='ownership' "dektec-${sdkver}" "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	# install udev-rules
	install -Dm644 51-*.rules -t "${pkgdir}/etc/udev/rules.d/"
}
