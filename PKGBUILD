# Maintainer: imi415 <imi415 at imi dot moe>
# Author: Yilin Sun

_pkgbasename=hailort-drivers
_pkgname=$_pkgbasename-8
pkgname=$_pkgname-dkms
pkgver=4.23.0
pkgrel=1
pkgdesc="Kernel drivers for HAILO-8 series accelerator cards"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/hailo-ai/hailort-drivers"
license=('GPL2')
depends=('dkms' 'hailort-firmware-8')
provides=('hailort-drivers-8' 'hailort-drivers-8-dkms')
conflicts=('hailort-drivers-8' 'hailort-drivers-8-dkms')
source=("$_pkgbasename-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	'dkms.conf.in')
sha256sums=('245c7157746c2fd48b2fab4a990c8fb3b786921dd72c9e5348f5b5619ee05ec3'
	'SKIP')

prepare() {
	sed -e "s/@PCIE_DRIVER_VERSION@/$pkgver/" \
	    -e "s/@DKMS_PACKAGE_NAME@/$_pkgname/" \
		"$srcdir/dkms.conf.in" > \
		"$srcdir/$_pkgbasename-$pkgver/dkms.conf"
}

package() {
	install -Dm755 -d "$pkgdir/usr/src/$_pkgname-$pkgver/common" "$pkgdir/usr/src/$_pkgname-$pkgver/linux"
	cp -dr --no-preserve='ownership' "$srcdir/$_pkgbasename-$pkgver/linux" "$pkgdir/usr/src/$_pkgname-$pkgver"
	cp -dr --no-preserve='ownership' "$srcdir/$_pkgbasename-$pkgver/common" "$pkgdir/usr/src/$_pkgname-$pkgver"
	install -Dm644 "$srcdir/$_pkgbasename-$pkgver/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
}

