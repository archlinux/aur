# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=looking-glass
pkgbase="${_pkgname}-git"
pkgname=("${_pkgname}-git" "${_pkgname}-module-dkms-git" "${_pkgname}-host-git")
epoch=1
pkgver=B1_rc5.r6.g2b4f809
pkgrel=2
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.hostfission.com"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'git' 'sdl2_ttf' 'glu' 'fontconfig' 'spice-protocol')
source=("${_pkgname}::git+https://github.com/gnif/LookingGlass.git")
sha512sums=('SKIP')
install="${pkgbase}.install"

pkgver() {
	cd "${_pkgname}"
	local TAG=$(git describe --abbrev=0 --tags)
	local SUFFIX=$(git describe --long --tags | sed 's/^'"${TAG}"'-\([^-]*-g\)/r\1/;s/-/./g')
	printf "%s.%s" "${TAG//-/_}" "${SUFFIX}"
}

build() {
	cd "${srcdir}/${_pkgname}"
	for b in {client,c-host}; do
		pushd "${b}"
		cmake -DCMAKE_INSTALL_PREFIX=/usr .
		make
		popd
	done
}

package_looking-glass-git() {
	pkgdesc="A client application for accessing the LookingGlass IVSHMEM device of a VM"
	depends=('sdl2_ttf' 'glu' 'nettle' 'fontconfig')
	provides=("${_pkgname}")
	conflicts=("${_pkgname}")

	cd "${srcdir}/${_pkgname}/client"
	make DESTDIR="${pkgdir}" install
}

package_looking-glass-module-dkms-git() {
	pkgdesc="A kernel module that implements a basic interface to the IVSHMEM device for when using LookingGlass in VM->VM mode"
	depends=('dkms')
	provides=("${_pkgname}-module-dkms")
	conflicts=("${_pkgname}-module-dkms")

	cd "${srcdir}/${_pkgname}/module"
	for f in {Makefile,dkms.conf,kvmfr.c}; do
		install -Dm644 "${f}" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/${f}"
	done
}

package_looking-glass-host-git() {
	pkgdesc="Linux host application for pushing frame data to the LookingGlass IVSHMEM device"
	depends=('libxcb' 'zlib')
	provides=("${_pkgname}-host")
	conflicts=("${_pkgname}-host")

	cd "${srcdir}/${_pkgname}/c-host"
	make DESTDIR="${pkgdir}" install
}
