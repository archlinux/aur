# $Id: PKGBUILD 138441 2015-08-17 06:39:34Z tpowa $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Based on SUSE spec https://build.opensuse.org/package/files?package=rt3562sta&project=driver%3Awireless
# AUFS stuff: GI_Jack <iamjacksemail@hackermail.com>

_pkgname=rt3562sta
pkgname=rt3562sta-aufs
pkgver=2.4.1.1_r2
_patchrel=${pkgver/*_r/}
pkgrel=12
pkgdesc="Ralink RT3562 PCI WLAN adaptors kernel module"
arch=(i686 x86_64)
url="http://www.mediatek.com/en/products/connectivity/wifi/consumer-electronics/pcie/rt3562/"
license=('GPL')
depends=('linux-aufs_friendly')
makedepends=('linux-aufs_friendly-headers')
install=$_pkgname.install
source=($_pkgname-$pkgver.tar.gz::https://github.com/mtorromeo/rt3562sta-linux/archive/r${_patchrel}.tar.gz)

build() {
	_kernver=$(pacman -Q linux-aufs_friendly | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	KERNEL_RELEASE=$(cat /usr/lib/modules/extramodules-$_kernver-aufs_friendly/version)

	cd "$srcdir"/rt3562sta-linux-r$_patchrel

	EXTRA_CFLAGS="-DVERSION=$pkgver" \
	LINUX_SRC="/usr/lib/modules/$KERNEL_RELEASE/build" \
		make
}

package() {
	_kernver=$(pacman -Q linux-aufs_friendly | sed -r 's#.* ([0-9]+\.[0-9]+).*#\1#')
	depends=("linux-aufs_friendly>=$_kernver" "linux-aufs_friendly<${_kernver/.*}.$(expr ${_kernver/*.} + 1)")
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-$_kernver-aufs_friendly/version)
	msg "Kernel = $KERNEL_VERSION"

	cd "$srcdir"/rt3562sta-linux-r$_patchrel

	install -Dm 0640 RT3562STA.dat "$pkgdir/etc/Wireless/RT3562STA/RT3562STA.dat"
	install -Dm 0644 os/linux/$_pkgname.ko "$pkgdir/usr/lib/modules/extramodules-$_kernver-aufs_friendly/$_pkgname.ko"
	install -dm 0755 "$pkgdir/usr/share/doc/$_pkgname"
	install -m 0644 iwpriv_usage.txt README* RT3562STA* sta_ate_iwpriv_usage.txt "$pkgdir/usr/share/doc/$_pkgname"

	find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;
	sed -i "s|extramodules-.*-aufs_friendly|extramodules-$_kernver-aufs_friendly|" "$startdir/$_pkgname.install"
}

sha256sums=('fbb31034fac14d63f9ed16039b79743746d91e0587e3bdd036697f7fd39cef9a')
