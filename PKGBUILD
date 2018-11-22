# Maintainer: enno <elo-archlinux(dot)nerdworks.de>

pkgname=rtl8821cu-raspberrypi-git
_pkgbase=rtl8821cu
pkgver=5.2.5.3_24795.20171031.r18.g0278eaa
pkgrel=1
pkgdesc="rtl8821cu chipset driver"
arch=('armv7h')
url="https://github.com/whitebatman2/rtl8821CU"
license=('GPL2')
depends=('bc')
makedepends=('git' 'linux-raspberrypi-headers')
conflicts=("${_pkgbase}")
source=("git+https://github.com/whitebatman2/rtl8821CU")
install="${_pkgbase}.install"
sha256sums=('SKIP')
pkgver() {
    cd rtl8821CU
    printf '%s.r%s.g%s' '5.2.5.3_24795.20171031' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd rtl8821CU
        sed \
		-e "s/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/" \
		-e "s/CONFIG_PLATFORM_ARM_RPI = n/CONFIG_PLATFORM_ARM_RPI = y/" \
                -i Makefile
}

build() {
        cd rtl8821CU
	make
}

package() {
	mkdir -p "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless"
        cd rtl8821CU
	install -p -m 644 8821cu.ko "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/8821cu.ko"
}

