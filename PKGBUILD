# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgbase=looking-glass
pkgname=("${pkgbase}" "${pkgbase}-module-dkms" "${pkgbase}-host")
pkgver=B1_rc5
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.hostfission.com"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'sdl2_ttf' 'glu' 'fontconfig' 'libconfig' 'spice-protocol')
source=("https://github.com/gnif/LookingGlass/archive/${_pkgver}.tar.gz")
sha512sums=('5e4539d7decbfb37e8eb481c5d27cc38c1d7ed65df5e49a64f9a14402243b9f9ee97c939d3733bd90859ded71961a866c627d3c6c44bff6bd36881eced1fc1ec')

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
