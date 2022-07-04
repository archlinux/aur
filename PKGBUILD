# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgbase=looking-glass
pkgname=("${pkgbase}"
         "${pkgbase}-module-dkms"
         "${pkgbase}-host"
         "obs-plugin-${pkgbase}")
epoch=2
pkgver=B5.0.1
pkgrel=3
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.io/"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'fontconfig' 'spice-protocol' 'wayland-protocols'
             'libxss' 'libxi' 'libxpresent' 'obs-studio')
source=("looking-glass-${pkgver}.tar.gz::https://looking-glass.io/artifact/${pkgver}/source")
sha512sums=('2600722fba5a9b794556391a636df09d284dc5460c5e9b4718bc2c044e6ece68890893c18c30780245207c0e92194f9691269bdcd590f118a616417d1e74bbd6')

_lgdir="${pkgbase}-${pkgver}"

prepare() {
	sed -i '30a #include <linux/memremap.h>' "${srcdir}/${_lgdir}/module/kvmfr.c"
}

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
	         'libxinerama' 'libxcursor' 'libxpresent' 'libxkbcommon')

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
	depends=('libxcb' 'zlib')

	cd "${srcdir}/${_lgdir}/host/build"
	make DESTDIR="${pkgdir}" install
}

package_obs-plugin-looking-glass() {
	pkgdesc="Plugin for OBS Studio to stream directly from Looking Glass without having to record the Looking Glass client"
	depends=('obs-studio')

	install -Dm644 -t "${pkgdir}/usr/lib/obs-plugins" \
		"${srcdir}/${_lgdir}/obs/build/liblooking-glass-obs.so"
}
