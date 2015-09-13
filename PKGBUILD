# Maintainer: Alexey Galakhov <agalakhov@gmail.com>

pkgbase=mcp2210-git
pkgname=(mcp2210-git mcp2210-utils-git)
pkgver="v0.1.r27.gfc8d532"
pkgver() {
  cd "mcp2210-linux"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="A kernel module for Microchip MCP2210 USB-to-SPI bridge"
url="https://github.com/agalakhov/mcp2210-linux"
license=("GPL")
arch=('i686' 'x86_64' 'armv7h')
depends=('linux')
makedepends=('linux-headers')
install=$pkgname.install
source=(git://github.com/agalakhov/mcp2210-linux.git)
md5sums=('SKIP')

build() {
	_kernver=$(pacman -Q linux | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-ARCH/version)

	cd "mcp2210-linux"
	make KERNELDIR="/lib/modules/$KERNEL_VERSION/build" modules user
}

package_mcp2210-git() {
	_kernver=$(pacman -Q linux | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	depends=("linux>=$_kernver" "linux<${_kernver/.*}.$(expr ${_kernver/*.} + 1)")
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-ARCH/version)
	msg "Kernel = $KERNEL_VERSION"

	cd "mcp2210-linux"
	install -Dm644 mcp2210.ko "$pkgdir/usr/lib/modules/extramodules-$_kernver-ARCH/mcp2210.ko"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +

	sed -i "s|extramodules-.*-ARCH|extramodules-$_kernver-ARCH|" "$startdir/$pkgname.install"
}

package_mcp2210-utils-git() {
	cd "mcp2210-linux"
	install -Dm644 user/libmcp2210.so "$pkgdir/usr/lib/libmcp2210.so"
	install -Dm755 user/mcp2210-util "$pkgdir/usr/bin/mcp2210-util"
	install -Dm755 user/mcp2210_bind.sh "$pkgdir/usr/bin/mcp2210_bind.sh"
}
