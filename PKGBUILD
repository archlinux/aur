# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

pkgname=ixxat-socketcan
pkgver=1.1.148.0
pkgrel=6
pkgdesc="SocketCAN driver for IXXAT USB-to-CAN v2"
arch=('i686' 'x86_64')
url="https://www.ixxat.com/products/products-industrial/pc-interfaces/pc-can-interfaces/socketcan"
license=('GPL2')
makedepends=(linux-headers)
optdepends=('can-utils: Linux-CAN / SocketCAN user space applications')
install=$pkgname.install
source=('https://cdn.hms-networks.com/docs/librariesprovider8/ixxat-english-new/pc-can-interfaces/linux-drivers/socketcan-linux.zip?sfvrsn=3eb48d7_8'
	kernel_do_gettimeofday_fix.patch
	kernel_ioremap_nocache_fix.patch)
md5sums=('4875b7dcfddfb76279ec61477765dd04'
	 '918f3a220153599c2a4c3fad7de86cc1'
	 '25ef511b0f11a7d84ce9ffc6020293c3')

_extramodules=$(uname -r)/extramodules

prepare() {
	patch -p1 -i kernel_do_gettimeofday_fix.patch
	patch -p1 -i kernel_ioremap_nocache_fix.patch
}

build() {
	# Make will fail with the original folder name.
	rm -rf "$srcdir/ixxat-socketcan"
	mv "$srcdir/SocketCAN - Linux (V1.1.148.0)" "$srcdir/ixxat-socketcan"
	cd "$srcdir/ixxat-socketcan"
	make
}

package() {
	mkdir -p $pkgdir/usr/lib/modules/$_extramodules
	install ixxat-socketcan/usb-to-can_socketcan/ixx_usb.ko $pkgdir/usr/lib/modules/$_extramodules
}
