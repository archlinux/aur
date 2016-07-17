# $Id: PKGBUILD 175499 2016-05-16 18:54:57Z tpowa $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Based on SUSE spec https://build.opensuse.org/package/files?package=rt3562sta&project=driver%3Awireless

pkgname=rt3562sta
pkgver=2.4.1.1_r4
_patchrel=${pkgver/*_r/}
pkgrel=1
pkgdesc="Ralink RT3562 PCI WLAN adaptors kernel module"
arch=(i686 x86_64)
url="http://www.mediatek.com/en/products/connectivity/wifi/consumer-electronics/pcie/rt3562/"
license=('GPL')
depends=('linux')
makedepends=('linux-headers')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/mtorromeo/rt3562sta-linux/archive/r${_patchrel}.tar.gz)

build() {
	_kernver=$(pacman -Q linux | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	KERNEL_RELEASE=$(cat /usr/lib/modules/extramodules-$_kernver-ARCH/version)

	cd "$srcdir"/rt3562sta-linux-r$_patchrel

	EXTRA_CFLAGS="-DVERSION=$pkgver" \
	LINUX_SRC="/usr/lib/modules/$KERNEL_RELEASE/build" \
		make
}

package() {
	_kernver=$(pacman -Q linux | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	depends=("linux>=$_kernver" "linux<${_kernver/.*}.$(expr ${_kernver/*.} + 1)")
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-ARCH/version)
	msg "Kernel = $KERNEL_VERSION"

	cd "$srcdir"/rt3562sta-linux-r$_patchrel

	install -Dm 0644 RT3562STA.dat "$pkgdir/etc/Wireless/RT3562STA/RT3562STA.dat"
	install -Dm 0644 os/linux/$pkgname.ko "$pkgdir/usr/lib/modules/extramodules-$_kernver-ARCH/$pkgname.ko"
	install -dm 0755 "$pkgdir/usr/share/doc/$pkgname"
	install -m 0644 iwpriv_usage.txt README* RT3562STA* sta_ate_iwpriv_usage.txt "$pkgdir/usr/share/doc/$pkgname"

	find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;
	sed -i "s|extramodules-.*-ARCH|extramodules-$_kernver-ARCH|" "$startdir/$pkgname.install"
}

sha256sums=('6af6dd13ae1e1075974c8d0a54a0c9f73624cecf153f1f75c8c4f106f4719a1d')
