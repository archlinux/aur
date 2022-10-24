# Maintainer: Omar Pakker <archlinux@opakker.nl>
# Maintainer: ston <2424284164@qq.com>

_pkgname=looking-glass
pkgbase=looking-glass-rc
pkgname=("${pkgbase}"
	"${pkgbase}-module-dkms"
	"${pkgbase}-host"
	"obs-plugin-${pkgbase}")
epoch=0
pkgver=B6_rc1
pkgrel=1
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough(Candidate Version)"
url="https://looking-glass.io/"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'fontconfig' 'spice-protocol' 'wayland-protocols'
	'libxss' 'libxi' 'libxpresent' 'obs-studio')
source=("looking-glass-${pkgver//_/-}.tar.gz::https://looking-glass.io/artifact/${pkgver//_/-}/source")
sha512sums=('fa408140d0a0dc3f27b926f0b62b0561d681e58c1c7de3d567b5b5d5e6a4e991dcfd560f23c0d74df15b15a77a78ddcb545cbdc5b340a86273569870800701f8')

_lgdir="${_pkgname}-${pkgver//_/-}"

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

package_looking-glass-rc() {
	pkgdesc="A client application for accessing the LookingGlass IVSHMEM device of a VM"
	depends=('libgl' 'libegl' 'nettle' 'fontconfig' 'libxss' 'libxi'
		'libxinerama' 'libxcursor' 'libxpresent' 'libxkbcommon')
	provides=("${_pkgname}")
	conflicts=("${_pkgname}")
	cd "${srcdir}/${_lgdir}/client/build"
	make DESTDIR="${pkgdir}" install
}

package_looking-glass-rc-module-dkms() {
	pkgdesc="A kernel module that implements a basic interface to the IVSHMEM device for when using LookingGlass in VM->VM mode"
	depends=('dkms')
	provides=("${_pkgname}-module-dkms")
	conflicts=("${_pkgname}-module-dkms")
	cd "${srcdir}/${_lgdir}/module"
	install -Dm644 -t "${pkgdir}/usr/src/${_pkgname}-${pkgver//_/-}" \
		Makefile \
		dkms.conf \
		kvmfr.{h,c}
}

package_looking-glass-rc-host() {
	pkgdesc="Linux host application for pushing frame data to the LookingGlass IVSHMEM device"
	depends=('libxcb' 'zlib')
	provides=("${_pkgname}-host")
	conflicts=("${_pkgname}-host")
	cd "${srcdir}/${_lgdir}/host/build"
	make DESTDIR="${pkgdir}" install
}

package_obs-plugin-looking-glass-rc() {
	pkgdesc="Plugin for OBS Studio to stream directly from Looking Glass without having to record the Looking Glass client"
	depends=('obs-studio')
	provides=("obs-plugin-${_pkgname}")
	conflicts=("obs-plugin-${_pkgname}")
	install -Dm644 -t "${pkgdir}/usr/lib/obs-plugins" \
		"${srcdir}/${_lgdir}/obs/build/liblooking-glass-obs.so"
}
