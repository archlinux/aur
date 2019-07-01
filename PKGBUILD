# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgbase=looking-glass
pkgname=("${pkgbase}" "${pkgbase}-module-dkms" "${pkgbase}-host")
epoch=1
pkgver=B1_rc6
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.hostfission.com"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'sdl2_ttf' 'glu' 'fontconfig' 'spice-protocol')
source=("https://github.com/gnif/LookingGlass/archive/${_pkgver}.tar.gz")
sha512sums=('592c5d813650a19dd8a3edfa7659348ec1d24627c7a66b6b13490a777e0f5b8d98bf7206323f3b9ebf5a1cd3904f068d67c5ad6277c43952eac13e099b7b8348')

build() {
	cd "${srcdir}/LookingGlass-${_pkgver}"
	for b in {client,c-host}; do
		pushd "${b}"
		cmake -DCMAKE_INSTALL_PREFIX=/usr .
		make
		popd
	done
}

package_looking-glass() {
	pkgdesc="A client application for accessing the LookingGlass IVSHMEM device of a VM"
	depends=('sdl2_ttf' 'glu' 'nettle' 'fontconfig')

	cd "${srcdir}/LookingGlass-${_pkgver}/client"
	make DESTDIR="${pkgdir}" install
}

package_looking-glass-module-dkms() {
	pkgdesc="A kernel module that implements a basic interface to the IVSHMEM device for when using LookingGlass in VM->VM mode"
	depends=('dkms')

	cd "${srcdir}/LookingGlass-${_pkgver}/module"
	for f in {Makefile,dkms.conf,kvmfr.c}; do
		install -Dm644 "${f}" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/${f}"
	done
}

package_looking-glass-host() {
	pkgdesc="Linux host application for pushing frame data to the LookingGlass IVSHMEM device"
	depends=('libxcb' 'zlib')

	cd "${srcdir}/LookingGlass-${_pkgver}/c-host"
	make DESTDIR="${pkgdir}" install
}
