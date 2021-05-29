# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>
# Patches taken from https://gitlab.com/bms-contrib/ixxat-socketcan

pkgname=ixxat-socketcan
pkgver=1.1.148.0
pkgrel=7
pkgdesc="SocketCAN driver for IXXAT USB-to-CAN v2"
arch=('i686' 'x86_64')
url="https://www.ixxat.com/products/products-industrial/pc-interfaces/pc-can-interfaces/socketcan"
license=('GPL2')
makedepends=(linux-headers)
optdepends=('can-utils: Linux-CAN / SocketCAN user space applications')
install=$pkgname.install
source=('https://cdn.hms-networks.com/docs/librariesprovider8/ixxat-english-new/pc-can-interfaces/linux-drivers/socketcan-linux.zip?sfvrsn=3eb48d7_8'
	0.patch
	1.patch
	2.patch
	3.patch
	4.patch
	5.patch)
sha256sums=('801558b4ef182548dfaa10a1cc65696f5c84caf6c8df98be8fa812c392b491a2'
            '30993ecc5f97187f92ffaa1606a9cd588e1d0b7ab636bca8ba5ced3eb70b41d5'
            '3389d2301e159e2c99452cd4a68a0050d30c74831edf51afedee7e46b3d005b6'
            'a8828fa152b80120ec529f4a862936747697a94ad6a2009aabb2951b0784a579'
            '8eb368650f1b0e4340da7bd25dbd5b03843841cfb39bb7ec677eb11634fdabf1'
            '61ed6b5afdbb057318bd415c2d9b9ea4719d1ced8b1d3f0dfb9a80930f4c741d'
            'e1cb2108dde3ed8c6498a1b501b46a93f1189fb715be2f0ac71a6b5080fdf64b')

_extramodules=$(uname -r)/extramodules

prepare() {
	for patch in *.patch
	do
		patch -p1 -i $patch
	done
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
