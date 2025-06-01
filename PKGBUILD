# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Bob Fanger < bfanger(at)gmail >
# Contributor: Filip <fila pruda com>, Det < nimetonmaili(at)gmail >

pkgname=r8168
pkgver=8.055.00
pkgrel=1
pkgdesc="A kernel module for Realtek 8168 network cards"
url="http://www.realtek.com.tw"
license=("GPL-2.0-only")
arch=('x86_64')
makedepends=('linux-headers')
source=(
	https://github.com/mtorromeo/r8168/archive/$pkgver/$pkgname-$pkgver.tar.gz
	https://github.com/mtorromeo/r8168/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc
)
sha256sums=('f101df6f11b82b33c5820ea1525ee16dfb1f98388b0494fb85a61e0268752e4a'
            'SKIP')
validpgpkeys=('0CADAACF70F64C654E131B3111675C743429DDEF') # Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

build() {
	cd "$pkgname-$pkgver"
	# avoid using the Makefile directly -- it doesn't understand
	# any kernel but the current.
	make -C /usr/src/linux M="$PWD/src" \
		ENABLE_USE_FIRMWARE_FILE=y \
		CONFIG_R8168_NAPI=y \
		CONFIG_R8168_VLAN=y \
		CONFIG_ASPM=y \
		ENABLE_S5WOL=y \
		ENABLE_EEE=y \
		modules
}

package() {
	depends=('glibc' 'linux')

	local extradir=/usr/lib/modules/$(</usr/src/linux/version)/extramodules
	cd "$pkgname-$pkgver"
	install -Dt "$pkgdir$extradir" -m644 src/*.ko
	find "$pkgdir" -name '*.ko' -exec strip --strip-debug {} +
	find "$pkgdir" -name '*.ko' -exec xz {} +

	echo "blacklist r8169" | \
		install -Dm644 /dev/stdin "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
}

# vim:set sw=0 noet:
