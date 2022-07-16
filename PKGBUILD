# Maintainer: Ysblokje < ysblokje at gmail com >
# Contributor: Shen-Ta Hsieh <ibmibmibm.tw@gmail.com>
#
# Credits for the original version of this version of the file
# go to the r8168 package people

pkgname=r8125
pkgver=9.009.02
pkgrel=1
pkgdesc="A kernel module for Realtek r8125 network cards"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('x86_64')
conflicts=('r8125-dkms')
makedepends=('linux-headers')
source=(https://codeberg.org/ysblokje/r8125/archive/${pkgver}.tar.gz)
sha256sums=('45248674e26aa87b2f03daf27d02df8e1ea7f6c202f56f105445f942b41181ea')

build() {
	cd "$pkgname"
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
	cd "$pkgname"
	install -Dt "$pkgdir$extradir" -m644 src/*.ko
	find "$pkgdir" -name '*.ko' -exec strip --strip-debug {} +
	find "$pkgdir" -name '*.ko' -exec xz {} +

	echo "blacklist r8169" | \
		install -Dm644 /dev/stdin "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
}

# vim:set sw=0 noet:
