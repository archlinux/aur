# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgbase=looking-glass
pkgname=("${pkgbase}"
         "${pkgbase}-module-dkms"
#         "${pkgbase}-host"
         "obs-plugin-${pkgbase}")
epoch=2
pkgver=B7
pkgrel=5
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.io/"
arch=('x86_64')
license=('GPL-2.0-or-later')
makedepends=('cmake' 'fontconfig' 'libpipewire' 'libpulse'
             'libsamplerate' 'libxi' 'libxpresent' 'libxss' 'obs-studio'
             'spice-protocol' 'wayland-protocols')
source=("looking-glass-${pkgver}.tar.gz::https://looking-glass.io/artifact/${pkgver}/source"
        "1197-backport.patch")
sha512sums=('a3f0193451c64dbd9ead01538fa53cc78b42d318d54b2eef026fb730811e055bb140b67dcd91c1da5ef09ec74fbb141c791b53264a56a943308b81a6e49e1e93'
            '7e927d6cae8190dba46be59e64862f327f5226e4baa3116559aa92174d9c8b7e6752a356fe67bb144036c36f1a95b2379d4b2efa5f4f09775bcbbe03107dcaac')

_lgdir="${pkgbase}-${pkgver}"

prepare() {
	cd "${srcdir}/${_lgdir}"
	for patch in "${srcdir}"/*.patch; do
		patch -p1 < "${patch}"
	done
}

build() {
	cd "${srcdir}/${_lgdir}"

	local components=(
		"client"
#		"host"
		"obs"
	)
	for b in "${components[@]}"; do
		mkdir "${b}/build"
		pushd "${b}/build"
		cmake -DCMAKE_INSTALL_PREFIX=/usr ..
		make
		popd
	done
}

package_looking-glass() {
	pkgdesc="A client application for accessing the LookingGlass IVSHMEM device of a VM"
	depends=('binutils' 'fontconfig' 'gcc-libs' 'glibc' 'gmp' 'hicolor-icon-theme'
	         'libegl' 'libgl' 'libpipewire' 'libpulse' 'libsamplerate' 'libx11'
	         'libxcursor' 'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxpresent'
	         'libxss' 'nettle' 'wayland' 'zlib' 'zstd')

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

#package_looking-glass-host() {
#	pkgdesc="Linux host application for pushing frame data to the LookingGlass IVSHMEM device"
#	depends=('binutils' 'gcc-libs' 'glib2' 'glibc'
#	         'libpipewire' 'libxcb' 'zlib' 'zstd')
#	install="host.install"
#
#	cd "${srcdir}/${_lgdir}/host/build"
#	make DESTDIR="${pkgdir}" install
#}

package_obs-plugin-looking-glass() {
	pkgdesc="Plugin for OBS Studio to stream directly from Looking Glass without having to record the Looking Glass client"
	depends=('glibc' 'obs-studio')

	install -Dm644 -t "${pkgdir}/usr/lib/obs-plugins" \
		"${srcdir}/${_lgdir}/obs/build/liblooking-glass-obs.so"
}
