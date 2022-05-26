pkgname=spi-ch341-usb-dkms
pkgver=r34.af6fb1b
pkgver() {
	cd "$srcdir/spi-ch341-usb"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=3
pkgdesc="SPI/GPIO driver for CH341"
arch=(any)
url="https://github.com/dimich-dmb/spi-ch341-usb"
license=('GPL')
groups=()
depends=()
makedepends=('git')
source=('git+https://github.com/dimich-dmb/spi-ch341-usb.git'
        '50-spi_ch341_usb.rules'
        'spi_ch341_usb_setup.sh')
sha256sums=('SKIP'
            'f17a1941b599fdae84584be239905c76a81dbc17d4ed575c0b134112c6da2982'
            '41f03bfd96efed8b968ef1f695f18121cdbbc6af27212060a30274f1a1984544')

prepare() {
	cd "$srcdir"/spi-ch341-usb
	sed -i 's|/extras|/extramodules|' dkms.conf
}

package() {
	install -dm0755 "${pkgdir}"/usr/src
    mkdir -p "${pkgdir}"/etc/udev/rules.d/
    mkdir -p "${pkgdir}"/usr/local/bin/
    cp -a "${srcdir}"/../50-spi_ch341_usb.rules "${pkgdir}"/etc/udev/rules.d/
    cp -a "${srcdir}"/../spi_ch341_usb_setup.sh "${pkgdir}"/usr/local/bin/
	cp -a "${srcdir}"/spi-ch341-usb "${pkgdir}"/usr/src/spi-ch341-usb-$pkgver
	sed -i "s|PACKAGE_VERSION=\".*\"|PACKAGE_VERSION=\"$pkgver\"|" "${pkgdir}"/usr/src/spi-ch341-usb-$pkgver/dkms.conf
}

post_install() {
    udevadm control --reload-rules
}
