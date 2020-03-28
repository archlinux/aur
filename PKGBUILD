# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=looking-glass
pkgbase="${_pkgname}-git"
pkgname=("${_pkgname}-git"
         "${_pkgname}-module-dkms-git"
         "${_pkgname}-host-git"
         "obs-plugin-${_pkgname}-git")
epoch=2
pkgver=B1.r162.gb953b2b
pkgrel=1
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.hostfission.com"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'git' 'sdl2_ttf' 'glu' 'fontconfig' 'spice-protocol' 'libxi' 'obs-studio')
source=("${_pkgname}::git+https://github.com/gnif/LookingGlass.git"
        "LGMP::git+https://github.com/gnif/LGMP.git"
        "PureSpice::git+https://github.com/gnif/PureSpice.git"
        "https://github.com/gnif/LookingGlass/pull/246.diff")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '5f26f385aaa0a518e12ea5919c009d39d771f2bb1676126e7fd57b46e0eddb1da77bd03db542d699f7ffc69144f166c456afedfa19f77f5a114b2393b1f0e6b8')
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
	git config submodule.LGMP.url "${srcdir}/LGMP"
	git config submodule.repos/PureSpice.url "${srcdir}/PureSpice"
	git submodule update

	# PR-246: [host] xcb: Fixed CaptureInterface definition
	patch -p1 < "${srcdir}/246.diff"
}

build() {
	cd "${srcdir}/${_pkgname}"
	for b in {client,c-host,obs}; do
		pushd "${b}"
		# CFLAGS for https://github.com/gnif/PureSpice/issues/1
		cmake -DCMAKE_INSTALL_PREFIX=/usr \
			-DCMAKE_C_FLAGS="-O0" \
			.
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

package_obs-plugin-looking-glass-git() {
	pkgdesc="Plugin for OBS Studio to stream directly from Looking Glass without having to record the Looking Glass client"
	depends=('obs-studio')
	provides=("obs-plugin-${_pkgname}")
	conflicts=("obs-plugin-${_pkgname}")

	cd "${srcdir}/${_pkgname}/obs"
	install -Dm644 "liblooking-glass-obs.so" "${pkgdir}/usr/lib/obs-plugins/liblooking-glass-obs.so"
}
