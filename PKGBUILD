# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=ovpn-dco-dkms-git
epoch=1
pkgver=0.2.20241216.r0.gita08b2fd
pkgrel=1
pkgdesc='Optional Data Channel Offload kernel module for OpenVPN 3'
arch=('any')
url='https://github.com/OpenVPN/ovpn-dco'
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('ovpn-dco' 'ovpn-dco-dkms')
conflicts=('ovpn-dco' 'ovpn-dco-git' 'ovpn-dco-dkms')
source=('git+https://github.com/OpenVPN/ovpn-dco.git'
        dkms.conf.in)
b2sums=('SKIP'
        '4c4d9ef50500f76766861dd7037974b71f3d7183897095e78d91db7ec6416e7d43e2a6bbb9f2625143845b5762f1ebc12b559b909944948d27deb26bb9c96226')

pkgver() {
	cd "${srcdir}/ovpn-dco"

	tag="$(git describe --abbrev=0 --tags)"
	revct=$(git rev-list --count "${tag}..HEAD")
	hash=$(git rev-parse --short HEAD)
	echo "${tag#v}.r${revct}.git${hash}"
}

package() {
	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/src/ovpn-dco-${pkgver}"
	cp -r "${srcdir}/ovpn-dco"/* "${pkgdir}/usr/src/ovpn-dco-${pkgver}"

	sed -e "s/@PKGVER@/${pkgver}/" "${srcdir}/dkms.conf.in" > "${srcdir}/dkms.conf"
	install -Tm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ovpn-dco-${pkgver}/dkms.conf"
}
