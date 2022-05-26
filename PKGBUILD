pkgname=spi-ch341-usb-dkms
pkgver=r45.cfb61d0
pkgver() {
	cd "$srcdir/spi-ch341-usb"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=2
pkgdesc="SPI/GPIO driver for CH341"
arch=(any)
url="https://github.com/rogerjames99/spi-ch341-usb"
license=('GPL')
groups=()
depends=()
makedepends=('git')
source=('git+https://github.com/rogerjames99/spi-ch341-usb.git'
        '0001-Arch-compatible-paths-for-kernel-headers-modules.patch'
        '50-spi_ch341_usb.rules'
        'spi_ch341_usb_setup.sh')
sha256sums=('SKIP'
            '75041421dbbf41b35c8f7a3992d601ca304c129ca9b9f348d575c57999f3cbc0'
            'f17a1941b599fdae84584be239905c76a81dbc17d4ed575c0b134112c6da2982'
            '41f03bfd96efed8b968ef1f695f18121cdbbc6af27212060a30274f1a1984544')

prepare() {
	cd "$srcdir"/spi-ch341-usb
	sed -i 's|/extras|/extramodules|' dkms.conf
    patch -Np1 -i ../0001-Arch-compatible-paths-for-kernel-headers-modules.patch
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
