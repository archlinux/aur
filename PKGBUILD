#Maintainer: Armin Luntzer <armin.luntzer@univie.ac.at>

pkgname=ape1553-bsp
pkgver=14.1.2
pkgrel=1
pkgdesc="Drivers and board support package for AIM 1553 PCI devices"
arch=('x86_64')
url="www.aim-online.com"
license=('custom')

makedepends=('linux-headers' 'fakeroot')

source=("file://mil-std-1553-linux-bsp-${pkgver}.tar.gz"
	"install.patch"
	"dma_set_mask.patch")

install=ape1553-bsp.install


prepare() {

	cd ${srcdir}/mil-std-1553-linux-bsp-${pkgver}/
	patch -Np1 -i ${srcdir}/install.patch
	patch -Np1 -i ${srcdir}/dma_set_mask.patch
}


build() {
	cd ${srcdir}/mil-std-1553-linux-bsp-${pkgver}/

	PREFIX=${pkgdir}/usr ./install.sh build --verbose
}



package() {
	#firmware
	mkdir -p ${pkgdir}/usr/lib/firmware

	# kernel modules
	mkdir -p ${pkgdir}/usr/lib/modules/$(uname -r)/extra

	cd ${srcdir}/mil-std-1553-linux-bsp-${pkgver}/
	yes n | PREFIX=${pkgdir}/usr ./install.sh install --verbose

	install -m755 src/drivers/pci/*.ko ${pkgdir}/usr/lib/modules/$(uname -r)/extra

	# dude... -.-
	rm ${pkgdir}/usr/bin/sample
}
md5sums=('7ea33b93764f89a2377bdaa2991e876e'
         '41879fc0c30125300f89a75ba52592a2'
         '62e01a4ef2ffab3e0feecc533b8a0198')
