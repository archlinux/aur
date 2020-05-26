# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=looking-glass
pkgbase="${_pkgname}-git"
pkgname=("${_pkgname}-git"
         "${_pkgname}-module-dkms-git"
         "obs-plugin-${_pkgname}-git")
epoch=2
pkgver=B2rc2.r2.g667ab98
pkgrel=1
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.hostfission.com"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'git' 'sdl2_ttf' 'glu' 'fontconfig' 'spice-protocol' 'libxi' 'obs-studio')
source=("${_pkgname}::git+https://github.com/gnif/LookingGlass.git"
        "LGMP::git+https://github.com/gnif/LGMP.git"
        "PureSpice::git+https://github.com/gnif/PureSpice.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')
install="${pkgbase}.install"

pkgver() {
	cd "${_pkgname}"
	local TAG=$(git describe --abbrev=0 --tags)
	local SUFFIX=$(git describe --long --tags | sed 's/^'"${TAG}"'-\([^-]*-g\)/r\1/;s/-/./g')
	printf "%s.%s" "${TAG//-/}" "${SUFFIX}"
}

prepare() {
	cd "${_pkgname}"

	git submodule init
	git config submodule.repos/LGMP.url "${srcdir}/LGMP"
	git config submodule.repos/PureSpice.url "${srcdir}/PureSpice"
	git submodule update
}

build() {
	cd "${srcdir}/${_pkgname}"
	for b in {client,obs}; do
		pushd "${b}"
		cmake -DCMAKE_INSTALL_PREFIX=/usr .
		make
		popd
	done
}

package_looking-glass-git() {
	pkgdesc="A client application for accessing the LookingGlass IVSHMEM device of a VM"
	depends=('sdl2_ttf' 'glu' 'nettle' 'fontconfig' 'libxi')
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

package_obs-plugin-looking-glass-git() {
	pkgdesc="Plugin for OBS Studio to stream directly from Looking Glass without having to record the Looking Glass client"
	depends=('obs-studio')
	provides=("obs-plugin-${_pkgname}")
	conflicts=("obs-plugin-${_pkgname}")

	cd "${srcdir}/${_pkgname}/obs"
	install -Dm644 "liblooking-glass-obs.so" "${pkgdir}/usr/lib/obs-plugins/liblooking-glass-obs.so"
}
