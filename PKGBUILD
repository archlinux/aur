# Maintainer: Christian Mauderer <oss@c-mauderer.de>

_pkgbase=gslx680-acpi
pkgname=${_pkgbase}-dkms-git
pkgrel=3
pkgver=r149.667efce
pkgdesc="ACPI/x86 compatible driver for Silead GSLx680 touchscreens."
arch=('i686' 'x86_64')
url="https://github.com/onitake/gslx680-acpi"
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
install=${pkgname}.install
source=("${pkgname}"::"git+https://github.com/onitake/${_pkgbase}.git"
	"blacklist-silead.conf")
sha256sums=('SKIP'
            '04e768901152606ab0c33dac6d0c4a365e5fd7ba803a43be9847e47f9da38461')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"

	# Install
	msg2 "Copy over sources"
	mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
	cp -pr ${srcdir}/${pkgname}/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

	# Set name and version
	msg2 "Adapt version"
	sed -e "s/PACKAGE_VERSION=.*$/PACKAGE_VERSION=\"${pkgver}\"/" \
	    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

	install -Dm644 -t "${pkgdir}/etc/modprobe.d/" \
			"${srcdir}/blacklist-silead.conf"
}
