# Maintainer: Fritz Engelbrecht <fritz.engl+arch@gmail.com>
_kver=$(uname -r)
_pkgbase=rcraid
pkgname=rcraid-dkms-9
pkgver=9.3.0.00276
pkgrel=1
pkgdesc="NVMe/SATA RAID driver (DKMS) for AMD AM4, TR4 and sTRX4 socket motherboard chipsets"
arch=('i686' 'x86_64')
url="https://www.amd.com/en/support/chipsets/amd-socket-strx4/trx40"
license=('GPL2')
depends=('linux>=5.8'
		 'dkms')
makedepends=('linux-headers>=5.8')
source=('manual://raid_linux_driver_930_00276.zip'
		'dkms.conf')
md5sums=('70f899661c9d8036b67efde9b7495c08'
		 '3a14dcc84daf257a62727bcde1882edf')

prepare() {
	if [ ! -d $_pkgbase-$pkgver ]; then
		mkdir $_pkgbase-$pkgver
	fi

	cp Ubuntu\ 20.04.02/driver_sdk/src/* $_pkgbase-$pkgver
}

build() {
	cd $_pkgbase-$pkgver

	make KVERS=$_kver all
}

package() {
	# Set name and version
	sed -e "s/@_PKGBASE@/$_pkgbase/" \
			-e "s/@PKGVER@/$pkgver/" \
			-i dkms.conf

	# Copy dkms.conf
	install -Dm644 dkms.conf $pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf


	cd $_pkgbase-$pkgver

	install -Dm644 rcraid.ko $pkgdir/usr/lib/modules/$_kver/kernel/drivers/scsi/rcraid.ko

	make clean
	cp -r * "$pkgdir"/usr/src/$_pkgbase-$pkgver/
}
