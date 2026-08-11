# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=looking-glass
pkgbase="${_pkgname}-git"
pkgname=("${_pkgname}-git"
         "${_pkgname}-module-dkms-git"
         "${_pkgname}-host-git"
         "obs-plugin-${_pkgname}-git")
epoch=2
pkgver=B7.r649.g9469c087
pkgrel=1
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
        "cimplot::git+https://github.com/cimgui/cimplot.git"
        "implot::git+https://github.com/epezent/implot.git"
        "wayland-protocols::git+https://gitlab.freedesktop.org/wayland/wayland-protocols.git"
        "nanosvg::git+https://github.com/memononen/nanosvg.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
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
	declare -rA submodules=(
		["LGMP"]="repos/LGMP"
		["PureSpice"]="repos/PureSpice"
		["cimgui"]="repos/gui/cimgui"
		["cimplot"]="repos/gui/cimplot"
		["wayland-protocols"]="repos/wayland-protocols"
		["nanosvg"]="repos/nanosvg"
	)
	git submodule init
	for submodule in "${!submodules[@]}"; do
		git submodule set-url -- "${submodules["${submodule}"]}" "${srcdir}/${submodule}"
	done
	git -c protocol.file.allow=always submodule update

	declare -rA nestedmodules=(
		["cimgui"]="imgui"
		["cimplot"]="implot"
	)
	for submodule in "${!nestedmodules[@]}"; do
		local nestedmodule="${nestedmodules["${submodule}"]}"
		cd "${srcdir}/${_pkgname}/${submodules["${submodule}"]}"
		git submodule init
		git submodule set-url -- "${nestedmodule}" "${srcdir}/${nestedmodule}"
		git -c protocol.file.allow=always submodule update
	done
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
	         'libegl' 'libgl' 'libpipewire' 'libpulse' 'libsamplerate' 'libunwind' 'libx11'
	         'libxcursor' 'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxpresent'
	         'libxss' 'nettle' 'wayland' 'zlib' 'zstd')
	provides=("${_pkgname}")
	conflicts=("${_pkgname}")
	install="client.install"

	cd "${srcdir}/${_pkgname}/client/build"
	make DESTDIR="${pkgdir}" install
	find "${pkgdir}" -name "*.debug*" -delete
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
	depends=('binutils' 'gcc-libs' 'glib2' 'glibc' 'libpipewire'
	         'libunwind' 'libxcb' 'zlib' 'zstd')
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
