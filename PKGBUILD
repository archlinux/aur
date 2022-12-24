# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgbase=looking-glass
pkgname=("${pkgbase}"
         "${pkgbase}-module-dkms"
         "${pkgbase}-host"
         "obs-plugin-${pkgbase}")
epoch=2
pkgver=B6
pkgrel=1
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.io/"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'fontconfig' 'spice-protocol' 'wayland-protocols'
             'libxss' 'libxi' 'libxpresent' 'obs-studio' 'pipewire' 'libpulse'
             'libsamplerate')
source=("looking-glass-${pkgver}.tar.gz::https://looking-glass.io/artifact/${pkgver}/source")
sha512sums=('402729dc51a6e8995a64384de6e9549861a0db6a87c9627e5832ea548b4ab6b49f538cf12ae510caa360c39806671785ce7560aaf07e7c46532fe0271884f2cb')

_lgdir="${pkgbase}-${pkgver}"

build() {
	cd "${srcdir}/${_lgdir}"
	for b in {client,host,obs}/build; do
		mkdir "${b}"
		pushd "${b}"
		cmake -DCMAKE_INSTALL_PREFIX=/usr ..
		make
		popd
	done
}

package_looking-glass() {
	pkgdesc="A client application for accessing the LookingGlass IVSHMEM device of a VM"
	depends=('libgl' 'libegl' 'nettle' 'fontconfig' 'libxss' 'libxi'
	         'libxinerama' 'libxcursor' 'libxpresent' 'libxkbcommon'
	         'pipewire' 'libpulse' 'libsamplerate')

	cd "${srcdir}/${_lgdir}/client/build"
	make DESTDIR="${pkgdir}" install
}

package_looking-glass-module-dkms() {
	pkgdesc="A kernel module that implements a basic interface to the IVSHMEM device for when using LookingGlass in VM->VM mode"
	depends=('dkms')

	cd "${srcdir}/${_lgdir}/module"
	install -Dm644 -t "${pkgdir}/usr/src/${pkgbase}-${pkgver}" \
		Makefile \
		dkms.conf \
		kvmfr.{h,c}
}

package_looking-glass-host() {
	pkgdesc="Linux host application for pushing frame data to the LookingGlass IVSHMEM device"
	depends=('libxcb' 'zlib' 'pipewire')

	cd "${srcdir}/${_lgdir}/host/build"
	make DESTDIR="${pkgdir}" install
}

package_obs-plugin-looking-glass() {
	pkgdesc="Plugin for OBS Studio to stream directly from Looking Glass without having to record the Looking Glass client"
	depends=('obs-studio')

	install -Dm644 -t "${pkgdir}/usr/lib/obs-plugins" \
		"${srcdir}/${_lgdir}/obs/build/liblooking-glass-obs.so"
}
