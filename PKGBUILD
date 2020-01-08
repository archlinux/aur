# Maintainer: Yangtse Su <i@yangtse.me>

_pkgname=xpadneo
pkgname=xpadneo-dkms-git
pkgver=0.6.0.r404.g4414f98
pkgrel=1
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
arch=('x86_64')
url='https://github.com/atar-axis/xpadneo'
license=('GPL')
depends=('dkms' 'bluez' 'bluez-utils')
makedepends=('git')
source=('git+https://github.com/atar-axis/xpadneo.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	
	printf '%s.r%s.g%s' \
			"$(cat VERSION)" \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
}

package() {
	cd "${srcdir}/${_pkgname}"

	VERSION=$(cat VERSION)

	echo "* replacing version string if necessary"
	sed -i 's/PACKAGE_VERSION="@DO_NOT_CHANGE@"/PACKAGE_VERSION="'$VERSION'"/g' hid-xpadneo/dkms.conf
	sed -i 's/#define DRV_VER "@DO_NOT_CHANGE@"/#define DRV_VER "'$VERSION'"/g' hid-xpadneo/src/hid-xpadneo.c

	sed -i 's@/etc/udev/rules.d/@/usr/lib/udev/rules.d/@g' hid-xpadneo/dkms.post_install
	sed -i 's@/etc/udev/rules.d/@/usr/lib/udev/rules.d/@g' hid-xpadneo/dkms.post_remove

	echo "* copying module into /usr/src"
	install -dm755 ${pkgdir}/usr/src/hid-xpadneo-${VERSION}
	cp --recursive $PWD/hid-xpadneo/* ${pkgdir}/usr/src/hid-xpadneo-${VERSION}
}
