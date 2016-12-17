# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=asix-module
pkgver=4.19.0
pkgrel=1
pkgdesc="A kernel module for the ASIX USB 2.0 low power AX88772B/AX88772A/AX88760/AX88772/AX88178 ethernet controllers"
url="http://www.asix.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'linux')
makedepends=('linux-headers')
install=$pkgname.install
_filename=AX88772C_772B_772A_760_772_178_LINUX_DRIVER_v${pkgver}_Source
source=(http://www.asix.com.tw/FrootAttach/driver/$_filename.tar.bz2
        linux-4.7.patch)
sha256sums=('14b5db0fec05fbc75d6bbe323f822973aa7d6f738bcc74ef3b211d04e21a0c50'
            'c61fd6d00d78280df68be911f459662cd8b58b764b82d2ef4534b99dffa6e05e')

prepare() {
	cd "$srcdir"/$_filename
	patch -p1 -i ../linux-4.7.patch
}

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
