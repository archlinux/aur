pkgname=spi-ch341-usb-dkms
pkgver=r45.cfb61d0
pkgver() {
	cd "$srcdir/spi-ch341-usb"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="SPI/GPIO driver for CH341"
arch=(any)
url="https://github.com/rogerjames99/spi-ch341-usb"
license=('GPL')
groups=()
depends=()
makedepends=('git')
source=('git+https://github.com/rogerjames99/spi-ch341-usb.git'
        '0001-Arch-compatible-paths-for-kernel-headers-modules.patch')
sha256sums=('SKIP'
            '75041421dbbf41b35c8f7a3992d601ca304c129ca9b9f348d575c57999f3cbc0')

prepare() {
	cd "$srcdir"/spi-ch341-usb
	sed -i 's|/extras|/extramodules|' dkms.conf
    patch -Np1 -i ../0001-Arch-compatible-paths-for-kernel-headers-modules.patch
}

package() {
	install -dm0755 "${pkgdir}"/usr/src
	cp -a "${srcdir}"/spi-ch341-usb "${pkgdir}"/usr/src/spi-ch341-usb-$pkgver
	sed -i "s|PACKAGE_VERSION=\".*\"|PACKAGE_VERSION=\"$pkgver\"|" "${pkgdir}"/usr/src/spi-ch341-usb-$pkgver/dkms.conf
}
