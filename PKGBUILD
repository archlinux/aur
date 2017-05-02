# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=asix-module
pkgver=4.20.0
pkgrel=1
pkgdesc="A kernel module for the ASIX USB 2.0 low power AX88772B/AX88772A/AX88760/AX88772/AX88178 ethernet controllers"
url="http://www.asix.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'linux')
makedepends=('linux-headers')
install=$pkgname.install
_filename=AX88772C_772B_772A_760_772_178_LINUX_DRIVER_v${pkgver}_Source
source=(http://www.asix.com.tw/FrootAttach/driver/$_filename.tar.gz)
sha256sums=('e1b360e2664e6cf0daf75088f344a8033cdcc94953b44e52b76a13de4e0527d6')

build() {
	_kernver=$(pacman -Q linux | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-ARCH/version)

	cd "$srcdir"/$_filename
	make SYSSRC=/usr/src/linux-$_kernver KDIR=/usr/lib/modules/$KERNEL_VERSION/build
	gzip -f9 asix.ko
}

package() {
	_kernver=$(pacman -Q linux | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	depends=("linux>=$_kernver" "linux<${_kernver/.*}.$(expr ${_kernver/*.} + 1)")
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-ARCH/version)
	msg "Kernel = $KERNEL_VERSION"

	cd "$srcdir"/$_filename
	install -D -m644 asix.ko.gz "$pkgdir/usr/lib/modules/extramodules-$_kernver-ARCH/asix.ko.gz"
	sed -i "s|extramodules-.*-ARCH|extramodules-$_kernver-ARCH|" "$startdir/$pkgname.install"
}
