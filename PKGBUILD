# Maintainer: TJM <tommy.mairo@gmail.com>
pkgname=rtl8192eu
pkgver=4.4.1
pkgrel=3
pkgdesc="Driver for the Realtek8192eu chipset."
arch=("x86_64" "armv6h")
url="https://github.com/Mange/rtl8192eu-linux-driver"
license=('GPL')
depends=("dkms")
makedepends=('linux-headers' 'git' 'bc')
source=("git+https://github.com/Mange/rtl8192eu-linux-driver.git" "fix.patch")
sha256sums=("SKIP" "582f8e8f8bd513b598ada3a1ac625f188fbf313cddf018a440ca4cd8aaf9964c")
install=${pkgname}.install

build() {
	cd "rtl8192eu-linux-driver"
	make -j`cat /proc/cpuinfo |grep "processor"|wc -l`
}
prepare(){
	cd "rtl8192eu-linux-driver" 
	patch Makefile<../fix.patch
	if grep -q 'model name.*ARM' /proc/cpuinfo; then 
		sed -i -e 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/' -e 's/CONFIG_PLATFORM_ARM_RPI = n/CONFIG_PLATFORM_ARM_RPI = y/' Makefile
	fi
}
package() {
	mkdir -p $pkgdir/usr/lib/modules/`uname -r`/kernel/drivers/net/wireless
	cd "rtl8192eu-linux-driver"
	make DESTDIR=$pkgdir/usr install
}
