# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgbase=looking-glass
pkgname=("${pkgbase}"
         "${pkgbase}-module-dkms"
         "${pkgbase}-host"
         "obs-plugin-${pkgbase}")
epoch=2
pkgver=B6
pkgrel=10
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.io/"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'fontconfig' 'libpipewire' 'libpulse'
             'libsamplerate' 'libxi' 'libxpresent' 'libxss' 'obs-studio'
             'spice-protocol' 'wayland-protocols')
source=("looking-glass-${pkgver}.tar.gz::https://looking-glass.io/artifact/${pkgver}/source"
        "backport-1076-module-kernel-64.patch"
        "backport-1154-module-kernel-613.patch"
        "https://github.com/gnif/LookingGlass/pull/1124.patch")
sha512sums=('558981d6b32098076ef0775a748da349941551352cbef836e37310e43e5cd6072df3dec6fa2418a9abecc7729ef0c1c6869e3168d05a3d76bea46c6eb8c4e82c'
            'd9516fb82b481ddc0cf622a067cc6f0c6b1af2004790d866ba8ed3da544b1b77d8612be0be9e6ae8495cd0ef969d8b42bcc619bf7794133a176ef864190c9744'
            '11b15a1da5efcb5ab60f579d4d85e9e809df2c09da89a55997e41f859ae8819b5ad1494c2a189e2c6b8c49e4267e640cd4cf544295f0f880fa1547a0ee7a0de4'
            '424876dc04a4738b6b0309bd2dbaac39f951e18491101c0717d0fbeb69a0c088e4ba9476394ebf92eb4bef3d8ac7d2eaad0b6dd7babe49c06073565f4d413138')

_lgdir="${pkgbase}-${pkgver}"

prepare() {
	cd "${srcdir}/${_lgdir}"
	for patch in "${srcdir}"/*.patch; do
		patch -p1 < "${patch}"
	done

	sed -i '1 i\#pragma GCC diagnostic ignored "-Wmaybe-uninitialized"' \
		"host/platform/Linux/capture/pipewire/src/portal.c"
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
	depends=('binutils' 'fontconfig' 'gcc-libs' 'glibc' 'gmp' 'libegl' 'libgl'
	         'libpipewire' 'libpulse' 'libsamplerate' 'libx11' 'libxcursor'
	         'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxpresent'
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

package_looking-glass-host() {
	pkgdesc="Linux host application for pushing frame data to the LookingGlass IVSHMEM device"
	depends=('binutils' 'gcc-libs' 'glib2' 'glibc'
	         'libpipewire' 'libxcb' 'zlib' 'zstd')

	cd "${srcdir}/${_lgdir}/host/build"
	make DESTDIR="${pkgdir}" install
}

package_obs-plugin-looking-glass() {
	pkgdesc="Plugin for OBS Studio to stream directly from Looking Glass without having to record the Looking Glass client"
	depends=('glibc' 'obs-studio')

	install -Dm644 -t "${pkgdir}/usr/lib/obs-plugins" \
		"${srcdir}/${_lgdir}/obs/build/liblooking-glass-obs.so"
}
