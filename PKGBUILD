# Maintainer: Joel Grunbaum <joel@joelg.net>
# Contributer: Yangtse Su <i@yangtse.me>
_pkgname=xpadneo
pkgname=xpadneo-dkms-git
pkgver=0.9.r15.g9d8c4b7
pkgrel=1
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
arch=('x86_64')
url='https://github.com/atar-axis/xpadneo'
license=('GPL')
depends=('dkms' 'bluez' 'bluez-utils')
makedepends=('git')
conflicts=('xpadneo-dkms')
provides=('xpadneo-dkms')
source=('git+https://github.com/atar-axis/xpadneo.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'	
}

package() {
	cd "${srcdir}/${_pkgname}"

	cd hid-xpadneo
	make src/version.h
	cd ..	
	VERSION=$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')

	echo "* replacing version string if necessary"
	sed -i 's/PACKAGE_VERSION="@DO_NOT_CHANGE@"/PACKAGE_VERSION="'$VERSION'"/g' hid-xpadneo/dkms.conf

	sed -i 's@/etc/udev/rules\.d@/usr/lib/udev/rules\.d@g' hid-xpadneo/dkms.post_install
	sed -i 's@/etc/udev/rules\.d@/usr/lib/udev/rules\.d@g' hid-xpadneo/dkms.post_remove

	echo "* copying module into /usr/src"
	install -dm755 ${pkgdir}/usr/src/hid-xpadneo-${VERSION}
	cp --recursive $PWD/hid-xpadneo/* ${pkgdir}/usr/src/hid-xpadneo-${VERSION}
}
