# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=oracle-sgdc
pkgname=${_pkgname}-bin
pkgver="5.20.921"
pkgrel=1
pkgdesc="The Oracle Secure Global Desktop Client allows you to connect to an Oracle Secure Global Desktop server."
arch=('i686' 'x86_64')
url="http://www.oracle.com/us/technologies/virtualization/secure-global-desktop/overview/index.html"
license=('unknown')
depends_i686=('libxpm' 'libxinerama' 'libxcursor' 'libxkbfile' 'openmotif')
depends_x86_64=('lib32-libxpm' 'lib32-libxinerama' 'lib32-libxcursor' 'lib32-libxkbfile' 'lib32-openmotif')
makedepends=('gendesk')
provides=('oracle-sgdc')
conflicts=('oracle-sgdc')
install=${_pkgname}.install
source=("osgdc.png" "sgdcfile://sgdci3li.tar")
sha256sums=('866e0a618b330ba28d70fbdd3ad43d25e182587f50f88dbbe28543aa28a09378'
            'SKIP')

DLAGENTS+=('sgdcfile::/usr/bin/echo "Please obtain the Oracle SGD client tar (sgdci3li.tar) manually and put it next to the PKGBUILD. It can be obtained from an SGD server or from the Oracle eDelivery network SGD RPM files (opt/tarantella/var/docroot/client/sgdci3li.tar)"')

pkgver() {
	printf "%s" $(sed -n '/^PRODUCT_VERSION_FULL=/s,^PRODUCT_VERSION_FULL=,,p' "${srcdir}/sgdc/install")
}

prepare() {
	# Create .desktop file.
	gendesk -f -n \
		--pkgname "${_pkgname}" \
		--pkgdesc "${pkgdesc}" \
		--name "Oracle Secure Global Desktop Client" \
		--genericname "Remote Desktop" \
		--comment "Oracle SGD client for connecting to Oracle SGD servers." \
		--exec "/usr/bin/ttatcc -prompt" \
		--categories "Network;RemoteAccess;"
}

package() {
	install -Dm644 "${srcdir}/osgdc.png" "${pkgdir}/usr/share/pixmaps/oracle-sgdc.png"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm755 "${srcdir}/sgdc/ttatcc" "${pkgdir}/usr/bin/ttatcc"
}
