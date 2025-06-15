# Contributor: piernov <piernov@piernov.org

pkgname=mods-kernel-driver-dkms-git
_pkgname=mods-kernel-driver
pkgver=4.31.r0.g2cc2647
pkgrel=1
pkgdesc='NVIDIA Linux driver for diagnostic software'
arch=('x86_64')
url='https://github.com/NVIDIA/mods-kernel-driver'
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/NVIDIA/mods-kernel-driver.git" "dkms.conf")
sha1sums=('SKIP'
          '41c9d351cc543d3ba6db9fc4b74f866438909bb7')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
	install -dm 755 "${pkgdir}/usr/src"
	git -C "${_pkgname}" checkout-index --prefix="${pkgdir}/usr/src/${_pkgname}-${pkgver}/" -a
	#cp -dr --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
	install -D -m 644 dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

	# Set version
	sed -e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
}
