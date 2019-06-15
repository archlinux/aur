# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=amzn-drivers-ena-dkms
pkgver=2.1.1
pkgrel=1
pkgdesc='Linux kernel driver for Elastic Network Adapter (ENA)'
arch=('x86_64')
url='https://github.com/amzn/amzn-drivers'
license=('GPL')
source=("https://github.com/amzn/amzn-drivers/archive/ena_linux_${pkgver}.zip"
        ena_com_path.patch)
sha256sums=('eafc35121139068dfdfe7f3ca5fe8adec8652a5eca1718d26fc584917c8d07a0'
            'a37ccca26a6da38041c3eaef54973d65b516b6e639e2299d60f830268fa75d9e')

build() {
	cd amzn-drivers-ena_linux_${pkgver}/
	patch -p1 < ../ena_com_path.patch
	cat - <<EOF > kernel/linux/ena/dkms.conf
PACKAGE_NAME="ena"
PACKAGE_VERSION="${pkgver}"
BUILT_MODULE_NAME[0]="ena"
DEST_MODULE_LOCATION[0]="/kernel/drivers/net"
AUTOINSTALL="yes"
EOF
}

package() {
	depends=('dkms')
	provides=('AMZN-DRIVERS-ENA-MODULE')

	install -m755 -d ${pkgdir}/usr/src/ena-${pkgver}/common/ena_com
	install -m644 amzn-drivers-ena_linux_${pkgver}/kernel/linux/common/ena_com/* ${pkgdir}/usr/src/ena-${pkgver}/common/ena_com/
	install -m644 amzn-drivers-ena_linux_${pkgver}/kernel/linux/ena/* ${pkgdir}/usr/src/ena-${pkgver}/
}

