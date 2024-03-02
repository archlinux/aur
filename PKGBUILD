# Maintainer: Rihards Skuja <rihards at skuja dot eu>

pkgname=rtl8812au-openhd-dkms-git
_modname=88XXau_ohd
pkgver=5.2.20.2.r849.gf21bbe9
_pkgver=5.2.20.2
pkgrel=3
pkgdesc='Realtek RTL88xxAU WiFi USB driver (with OpenHD patches)'
arch=(any)
url='https://github.com/OpenHD/rtl8812au'
license=(GPL2)
depends=('dkms' 'bc')
makedepends=('git')
source=('git+https://github.com/OpenHD/rtl8812au.git' '0001-Update-beacon-change-signature-to-fix-build-on-recen.patch')
sha256sums=('SKIP' 'b26147fda4d78d8cc8f7d5f5d331e43a1ffeecb5596e703e3da6a7461a0fd7b2')

pkgver() {
	cd "${srcdir}/rtl8812au"
	printf '%s.r%s.g%s' "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${srcdir}/rtl8812au"
	patch -p1 -i "$srcdir/0001-Update-beacon-change-signature-to-fix-build-on-recen.patch"
}

package() {
	cd "${srcdir}/rtl8812au"
	mkdir -p "${pkgdir}/usr/src/${_modname}-${pkgver}"
	cp -pr * "${pkgdir}/usr/src/${_modname}-${pkgver}"
	install -Dm644 dkms.conf "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}
