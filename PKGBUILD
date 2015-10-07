# Maintainer: Alexey Galakhov <agalakhov@gmail.com>

pkgbase=mcp2210-git
pkgname=(mcp2210-git mcp2210-dkms-git mcp2210-utils-git)
pkgver=v0.1.r28.gea416ae
pkgver() {
	cd "mcp2210-linux"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=2
pkgdesc="A kernel module for Microchip MCP2210 USB-to-SPI bridge"
url="https://github.com/agalakhov/mcp2210-linux"
license=("GPL")
arch=('i686' 'x86_64' 'armv7h')
depends=('linux')
makedepends=('linux-headers' 'dkms')
source=( git://github.com/agalakhov/mcp2210-linux.git
         dkms.conf
       )
sha256sums=('SKIP'
            '8f56d80fceeac1ed7fe786e16718c054212fd939dcac54b7976984127305ae53')

build() {
	_kernver=$(pacman -Q linux | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-ARCH/version)

	cd "mcp2210-linux"
	make KERNELDIR="/lib/modules/$KERNEL_VERSION/build" modules user
}

package_mcp2210-git() {
	install=mcp2210-git.install
	conflicts=('mcp2210')
	_kernver=$(pacman -Q linux | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	depends=("linux>=$_kernver" "linux<${_kernver/.*}.$(expr ${_kernver/*.} + 1)")
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-ARCH/version)
	msg "Kernel = $KERNEL_VERSION"

	cd "mcp2210-linux"
	install -Dm644 mcp2210.ko "$pkgdir/usr/lib/modules/extramodules-$_kernver-ARCH/mcp2210.ko"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +

	sed -i "s|extramodules-.*-ARCH|extramodules-$_kernver-ARCH|" "$startdir/$pkgname.install"
}

package_mcp2210-dkms-git() {
	install=mcp2210-dkms-git.install
	conflicts=('mcp2210' 'mcp2210-git')
	depends=('dkms')
	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgbase}-${pkgver}/dkms.conf

	# Set name and version
	sed -e "s/@PKGBASE@/${pkgbase}/" \
	    -e "s/@PKGVER@/${pkgver}/" \
	    -i "${pkgdir}"/usr/src/${pkgbase}-${pkgver}/dkms.conf

	cp -r mcp2210-linux/* "${pkgdir}"/usr/src/${pkgbase}-${pkgver}/
	make -C "${pkgdir}"/usr/src/${pkgbase}-${pkgver}/ clean
	#rm -r "${pkgdir}"/usr/src/${pkgbase}-${pkgver}/user
}

package_mcp2210-utils-git() {
	conflicts=('mcp2210-utils')
	cd "mcp2210-linux"
	install -Dm644 user/libmcp2210.so "$pkgdir/usr/lib/libmcp2210.so"
	install -Dm755 user/mcp2210-util "$pkgdir/usr/bin/mcp2210-util"
	install -Dm755 user/mcp2210_bind.sh "$pkgdir/usr/bin/mcp2210_bind.sh"
}
