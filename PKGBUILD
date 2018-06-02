# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=looking-glass
pkgbase="${_pkgname}-git"
pkgname=("${_pkgname}-git" "${_pkgname}-module-dkms-git")
pkgver=a11.r29.g8a9d0b0
pkgrel=1
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.hostfission.com"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'git' 'sdl2_ttf' 'glu' 'fontconfig' 'libconfig' 'spice-protocol')
source=("${_pkgname}::git+https://github.com/gnif/LookingGlass.git"
        "dkms.conf")
sha512sums=('SKIP'
            'e1f6cd6aabd336d2af97b44a2746e5a0b41d5d5942993379b1284d1cc8d4981fced0ae44d8105709f2bc45a939dfc7f229018c680b0742c3f0778fe28ba301f8')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}/client"
	cmake .
	make
}

package_looking-glass-git() {
	pkgdesc="A client application for accessing the LookingGlass IVSHMEM device of a VM"
	depends=('sdl2_ttf' 'glu' 'nettle' 'fontconfig' 'libconfig')
	provides=("${_pkgname}")
	conflicts=("${_pkgname}")

	install -Dm755 "${srcdir}/${_pkgname}/client/looking-glass-client" "${pkgdir}/usr/bin/looking-glass-client"
}

package_looking-glass-module-dkms-git() {
	pkgdesc="A kernel module that implements a basic interface to the IVSHMEM device for when using LookingGlass in VM->VM mode"
	depends=('dkms')
	provides=("${_pkgname}-module-dkms")
	conflicts=("${_pkgname}-module-dkms")

	install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

	# Set module name and version
	sed -e "s/@PKGNAME@/${_pkgname}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

	cp -r "${srcdir}/${_pkgname}/module/"* "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
}
