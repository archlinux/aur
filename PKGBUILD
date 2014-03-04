# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=asix-module
pkgver=4.12.0
pkgrel=1
pkgdesc="A kernel module for the ASIX USB 2.0 low power AX88772B/AX88772A/AX88760/AX88772/AX88178 ethernet controllers"
url="http://www.asix.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'linux')
makedepends=('linux-headers')
_filename=AX88772C_772B_772A_760_772_178_LINUX_DRIVER_v${pkgver}_Source
source=(http://www.asix.com.tw/FrootAttach/driver/$_filename.tar.bz2)
install=$pkgname.install

build() {
	_kernver=$(pacman -Q linux | cut -d . -f 2 | cut -f 1 -d -)
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-3.$_kernver-ARCH/version)

	cd "$srcdir/AX88772C_772B_772A_760_772_178_LINUX_Driver_v${pkgver}_Source"
	make SYSSRC=/usr/src/linux-3.$_kernver KDIR=/usr/lib/modules/$KERNEL_VERSION/build
	gzip -f9 asix.ko
}

package() {
	_kernver=$(pacman -Q linux | cut -d . -f 2 | cut -f 1 -d -)
	depends=("linux>=3.${_kernver}" "linux<3.$(expr ${_kernver} + 1)")
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-3.$_kernver-ARCH/version)
	msg "Kernel = $KERNEL_VERSION"

	cd "$srcdir/AX88772C_772B_772A_760_772_178_LINUX_Driver_v${pkgver}_Source"
	install -D -m644 asix.ko.gz "$pkgdir/usr/lib/modules/extramodules-3.$_kernver-ARCH/asix.ko.gz"
	sed -i "s|extramodules-.*-ARCH|extramodules-3.$_kernver-ARCH|" "$startdir/$pkgname.install"
}

sha256sums=('0f09bccaeffcb649d88734e3e6843de7ba8102eecd6fae0a2d601e8e48e1fb54')
