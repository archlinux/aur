# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=rtl8192du-git
_pkgname=rtl8192du
pkgver=9e7eb15
pkgrel=1
pkgdesc="Kernel module for Realtek RTL8192DU USB wireless devices."
arch=('x86_64' 'i686')
url="https://github.com/lwfinger/rtl8192du"
license=('GPL')
depends=('linux>=4.5' 'linux<4.6')
makedepends=('linux-headers>=4.5' 'git')
source=("git://github.com/lwfinger/$_pkgname.git")
sha256sums=('SKIP')
install=readme.install

_extramodules="extramodules-4.5-ARCH"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

pkgver() {
	cd "$_pkgname"
	git describe --always | sed 's|-|.|g'
}

prepare() {

	cd "$_pkgname"

	# fixup for Arch
	#
	# 1) reference the static kernel ver not the running one
	# 2) remove the depmod command which we do in the postinstall
	sed -i -e "/^KSRC/ s,\$(KVER),$_kernver," \
		-i -e '/depmod/d' Makefile
}

build() {
	cd "$_pkgname"
	make INSTALL_PREFIX=/usr
	gzip -9 8192du.ko
}

package() {
	install -d "$pkgdir/usr/lib/modules/${_extramodules}/kernel/drivers/net/wireless"
	install -m644 "$srcdir/$_pkgname/8192du.ko.gz" \
		"$pkgdir/usr/lib/modules/${_extramodules}/kernel/drivers/net/wireless/8192du.ko.gz"

	install -d "$pkgdir/usr/lib/firmware/rtlwifi"
	install -m644 "$srcdir/$_pkgname/rtl8192dufw.bin" \
		"$pkgdir/usr/lib/firmware/rtlwifi/rtl8192dufw.bin"
	install -m644 "$srcdir/$_pkgname/rtl8192dufw_wol.bin" \
		"$pkgdir/usr/lib/firmware/rtlwifi/rtl8192dufw_wol.bin"
}
