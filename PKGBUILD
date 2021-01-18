# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgbase=looking-glass
pkgname=("${pkgbase}"
         "${pkgbase}-module-dkms"
         "obs-plugin-${pkgbase}")
epoch=2
pkgver=B2
pkgrel=1
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.io/"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'sdl2_ttf' 'glu' 'fontconfig' 'spice-protocol' 'libxi' 'obs-studio')
source=("looking-glass-${pkgver}.tar.gz::https://looking-glass.io/ci/host/source?id=255")
sha512sums=('a6ddd07f69dacfe8e0322615d9ff95c0ea6257f3bff87f99b18d4b1f6c723cbfcced6f73fb9add2f752782d7a96c8beb153f55f3da170fcddeb726b2a378e0ef')

_lgdir="looking-glass-B2-0-g76710ef201"

build() {
	cd "${srcdir}/${_lgdir}"
	for b in {client,obs}; do
		pushd "${b}"
		cmake -DCMAKE_INSTALL_PREFIX=/usr .
		make
		popd
	done
}

package_looking-glass() {
	pkgdesc="A client application for accessing the LookingGlass IVSHMEM device of a VM"
	depends=('sdl2_ttf' 'glu' 'nettle' 'fontconfig' 'libxi')

	cd "${srcdir}/${_lgdir}/client"
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

package_obs-plugin-looking-glass() {
	pkgdesc="Plugin for OBS Studio to stream directly from Looking Glass without having to record the Looking Glass client"
	depends=('obs-studio')

	install -Dm644 -t "${pkgdir}/usr/lib/obs-plugins" \
		"${srcdir}/${_lgdir}/obs/liblooking-glass-obs.so"
}
