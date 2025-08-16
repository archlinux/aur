# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=looking-glass
pkgbase="${_pkgname}-git"
pkgname=("${_pkgname}-git"
         "${_pkgname}-module-dkms-git"
         "${_pkgname}-host-git"
         "obs-plugin-${_pkgname}-git")
epoch=2
pkgver=B7.r67.gcb304115
pkgrel=2
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.io/"
arch=('x86_64')
license=('GPL-2.0-or-later')
makedepends=('binutils' 'cmake' 'fontconfig' 'git' 'libegl' 'libpipewire'
             'libpulse' 'libsamplerate' 'libxi' 'libxpresent' 'libxss'
             'obs-studio' 'spice-protocol' 'wayland-protocols')
source=("${_pkgname}::git+https://github.com/gnif/LookingGlass.git"
        "LGMP::git+https://github.com/gnif/LGMP.git"
        "PureSpice::git+https://github.com/gnif/PureSpice.git"
        "cimgui::git+https://github.com/cimgui/cimgui.git"
        "imgui::git+https://github.com/ocornut/imgui.git"
        "wayland-protocols::git+https://gitlab.freedesktop.org/wayland/wayland-protocols.git"
        "nanosvg::git+https://github.com/memononen/nanosvg.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	local TAG=$(git describe --abbrev=0 --tags)
	local SUFFIX=$(git describe --long --tags | sed 's/^'"${TAG}"'-\([^-]*-g\)/r\1/;s/-/./g')
	printf "%s.%s" "${TAG//-/}" "${SUFFIX}"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule init
	for module in LGMP PureSpice cimgui wayland-protocols nanosvg; do
		git submodule set-url -- "repos/${module}" "${srcdir}/${module}"
	done
	git -c protocol.file.allow=always submodule update

	cd "repos/cimgui"
	git submodule init
	git submodule set-url -- imgui "${srcdir}/imgui"
	git -c protocol.file.allow=always submodule update

	cd "${srcdir}/${_pkgname}"
	sed -i '1 i\#pragma GCC diagnostic ignored "-Wmaybe-uninitialized"' \
		"host/platform/Linux/capture/pipewire/src/portal.c"
}

build() {
	cd "${srcdir}/${_pkgname}"
	for b in {client,host,obs}/build; do
		mkdir "${b}"
		pushd "${b}"
		cmake -DCMAKE_INSTALL_PREFIX=/usr ..
		make
		popd
	done
}

package_looking-glass-git() {
	pkgdesc="A client application for accessing the LookingGlass IVSHMEM device of a VM"
	depends=('binutils' 'fontconfig' 'gcc-libs' 'glibc' 'gmp' 'hicolor-icon-theme'
	         'libegl' 'libgl' 'libpipewire' 'libpulse' 'libsamplerate' 'libx11'
	         'libxcursor' 'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxpresent'
	         'libxss' 'nettle' 'wayland' 'zlib' 'zstd')
	provides=("${_pkgname}")
	conflicts=("${_pkgname}")
	install="client.install"

	cd "${srcdir}/${_pkgname}/client/build"
	make DESTDIR="${pkgdir}" install
}

package_looking-glass-module-dkms-git() {
	pkgdesc="A kernel module that implements a basic interface to the IVSHMEM device for when using LookingGlass in VM->VM mode"
	depends=('dkms')
	provides=("${_pkgname}-module-dkms")
	conflicts=("${_pkgname}-module-dkms")

	cd "${srcdir}/${_pkgname}/module"
	install -Dm644 -t "${pkgdir}/usr/src/${pkgbase}-${pkgver}" \
		Makefile \
		dkms.conf \
		kvmfr.{h,c}
}

package_looking-glass-host-git() {
	pkgdesc="Linux host application for pushing frame data to the LookingGlass IVSHMEM device"
	depends=('binutils' 'gcc-libs' 'glib2' 'glibc'
	         'libpipewire' 'libxcb' 'zlib' 'zstd')
	provides=("${_pkgname}-host")
	conflicts=("${_pkgname}-host")
	install="host.install"

	cd "${srcdir}/${_pkgname}/host/build"
	make DESTDIR="${pkgdir}" install
}

package_obs-plugin-looking-glass-git() {
	pkgdesc="Plugin for OBS Studio to stream directly from Looking Glass without having to record the Looking Glass client"
	depends=('glibc' 'obs-studio')
	provides=("obs-plugin-${_pkgname}")
	conflicts=("obs-plugin-${_pkgname}")
	install="client.install"

	install -Dm644 -t "${pkgdir}/usr/lib/obs-plugins" \
		"${srcdir}/${_pkgname}/obs/build/liblooking-glass-obs.so"
}
